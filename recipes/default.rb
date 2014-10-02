# Cookbook Name:: fuse
# Recipe:: default
#
# Copyright 2014, Mariani Lucas
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'fuse_unzip' do
  package_name 'unzip'
  action :install
end

user node['fuse']['os']['user'] do
  password node['fuse']['os']['password']
  action :create
end

group node['fuse']['os']['group'] do
  members node['fuse']['os']['user']
  action :create
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['fuse']['filename']}.zip" do
  action :create_if_missing
  owner 'root'
  group 'root'
  mode '0644'
  source node['fuse']['url']
end

execute 'fuse_extract' do
  user 'root'
  cwd Chef::Config[:file_cache_path]
  command "unzip #{node['fuse']['filename']}.zip -d #{node['fuse']['dir']}"
  action :run
  not_if { ::Dir.exist?("#{node['fuse']['dir']}/#{node['fuse']['filename']}") }
end

template "#{node['fuse']['etc']}/#{node['fuse']['users_properties']}" do
  source 'users.properties.erb'
  mode 0644
  owner node['fuse']['os']['user']
  group node['fuse']['os']['group']
  variables(
    :app_user => node['fuse']['app']['user'],
    :app_password => node['fuse']['app']['password'],
    :app_role => node['fuse']['app']['role']
  )
end

execute 'fuse_owner' do
  user 'root'
  cwd node['fuse']['dir']
  command "chown -R #{node['fuse']['os']['user']}. #{node['fuse']['home']}"
  action :run
end

directory node['fuse']['m2_dir'] do
  owner node['fuse']['os']['user']
  group node['fuse']['os']['group']
  mode '0755'
end

template "#{node['fuse']['m2_dir']}/#{node['fuse']['m2_file']}" do
  source 'settings.xml.erb'
  mode 0644
  owner node['fuse']['os']['user']
  group node['fuse']['os']['group']
  variables(
    :proxy => node['fuse']['proxy'],
    :proxy_port => node['fuse']['proxy_port'],
    :noproxy => node['fuse']['noproxy']
  )
  not_if { node['fuse']['proxy'].nil? }
end

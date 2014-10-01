require 'spec_helper'

describe 'fuse::default' do
  context 'on Centos 6.5 x86_64 Fuse' do
    let(:chef_run) do
      ChefSpec::Runner.new(
        :platform => 'centos',
        :version => '6.5'
      ) do |node|
        node.automatic[:kernel][:machine] = 'x86_64'
        node.normal['fuse']['os']['user']  = 'fuse'
        node.normal['fuse']['os']['group']  = 'fuse'
      end.converge(described_recipe)
    end

    it 'install depends package for fuse' do
      expect(chef_run).to install_package('fuse_unzip')
    end

    it 'creates a user for jboss fuse ' do
      expect(chef_run).to create_user('fuse')
    end

    it 'creates a group for fuse user' do
      expect(chef_run).to create_group('fuse')
    end

    it 'download Jboss Fuse Binary' do
      expect(chef_run).to create_remote_file_if_missing("#{Chef::Config[:file_cache_path]}/jboss-fuse-6.0.0.redhat-024.zip")
    end

    it 'extract fuse' do
      expect(chef_run).to run_execute('fuse_extract')
    end

    it 'created fuse config file' do
      expect(chef_run).to create_template('/opt/jboss-fuse-6.0.0.redhat-024/etc/users.properties')
    end

    it 'change owner fuse' do
      expect(chef_run).to run_execute('fuse_owner')
    end

    it 'creates .m2 config directory for maven' do
      expect(chef_run).to create_directory('/home/fuse/.m2')
    end

    it 'add proxy to maven config file' do
      expect(chef_run).to_not create_template('/home/fuse/.m2/settings.xml')
    end
  end
end

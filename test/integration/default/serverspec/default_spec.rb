require_relative 'spec_helper'

describe package('unzip') do
  it { should be_installed }
end

describe user('user') do
  it { should exist }
  it { should belong_to_group 'fuse' }
end

describe group('fuse') do
  it { should exist }
end

describe file('/tmp/kitchen/cache/jboss-fuse-6.0.0.redhat-024.zip') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/opt/jboss-fuse-6.0.0.redhat-024') do
it { should be_directory }
it { should be_owned_by 'root' }
it { should be_grouped_into 'root' }
end

describe file('/opt/jboss-fuse-6.0.0.redhat-024/users.properties') do
  it { should be_file }
  it { should be_owned_by 'fuse' }
  it { should be_grouped_into 'fuse' }
end

describe file('/home/fuse/.m2') do
it { should be_directory }
it { should be_owned_by 'fuse' }
it { should be_grouped_into 'fuse' }
end

describe file('/home/fuse/.m2/settings.xml') do
it { should be_file }
it { should be_owned_by 'fuse' }
it { should be_grouped_into 'fuse' }
end

require 'serverspec'
require 'net/http'
require 'spec_helper'

describe command('dpkg -l | grep duplicity | awk \'{ print $3 }\'') do
  its(:stdout) { should match /~/ }
end


describe file('/etc/apt/sources.list.d/wheezy-backports.list') do
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  its (:content) { should match /wheezy-backports/ }
end

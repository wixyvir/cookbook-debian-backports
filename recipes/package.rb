if node["platform"] == "debian"
  include_recipe 'debian-backports'
  node['packages'].each do |pkg|
    apt_package pkg do
      default_release "#{node['lsb']['codename']}-backports"
      action :install
    end
  end
else
  log 'Debian backports packages install can only be set up on debian' do
    level :warn
  end
end

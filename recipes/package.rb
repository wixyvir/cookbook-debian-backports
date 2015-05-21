if node["platform"] == "debian"
  include_recipe 'debian-backports'

  if not node['backports']['install'].empty?
    apt_package node['backports']['install'] do
      default_release "#{node['lsb']['codename']}-backports"
      action :install
    end
  end

else
  log 'Debian backports packages install can only be set up on debian' do
    level :warn
  end
end

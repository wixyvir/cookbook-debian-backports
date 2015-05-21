if node["platform"] == "debian"
  include_recipe 'debian-backports'

  apt_preference 'linux-image-amd64' do
    pin "release a=#{node['lsb']['codename']}-backports"
    pin_priority '1001'
  end
  
  apt_package 'linux-image-amd64' do
    default_release "#{node['lsb']['codename']}-backports"
    action :upgrade
  end

  begin
    r = resources(reboot: "update_kernel_reboot")
    r.action(:request_reboot)
    r.reason("[REBOOT] Rebooting to new kernel")
  rescue Chef::Exceptions::ResourceNotFound
    log 'Please reboot to new kernel !' do
      level :warn
    end
  end
else
  log 'Debian backports kernel update can only be set up on debian' do
    level :warn
  end

end

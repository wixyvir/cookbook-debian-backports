if node["platform"] == "debian"
  include_recipe 'debian-backports'

  apt_preference 'linux-image-amd64' do
    pin "release a=#{node['lsb']['codename']}-backports"
    pin_priority '1001'
  end
  
  apt_package ["linux-image-amd64", "initramfs-tools"] do
    default_release "#{node['lsb']['codename']}-backports"
    action :upgrade
  end

  reboot "update_kernel_reboot" do
    action :request_reboot
    reason "[REBOOT] Rebooting to new kernel"
  end
else
  log 'Debian backports kernel update can only be set up on debian' do
    level :warn
  end
end

if node["platform"] == "debian"
  apt_repository "#{node['lsb']['codename']}-backports" do
    uri node["backports"]["mirror"]
    distribution "#{node['lsb']['codename']}-backports"
    components node["backports"]["components"]
  end

else
  log 'Debian backports can only be set up on debian' do
    level :warn
  end
end

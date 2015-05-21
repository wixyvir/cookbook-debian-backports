name             'debian-backports'
maintainer       'Cyprien DIOT'
maintainer_email 'cyprien.diot@pmsipilot.com'
license          'Public Domain'
description      'Sets up debian-backports for debian 7, 8'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'
recipe "debian-backports", "Set up debian backports repo"
recipe "debian-backports::kernel", "Keep kernel updated to last backports release"
recipe "debian-backports::package", "Install backport packages from ['backports']['install']"

# This manifest is for host system configuration
# for team-network virtual labs
# Requires: parser = future
#   puppet apply --parser future -d -v team-network-lab.pp
# Requires modules:
#   postgres
#   thias-sysctl
#   puppetlabs-firewall
# Install modules:
#   puppet module install puppetlabs/postgresql thias-sysctl puppetlabs-firewall

###############################################################################
# Some variables
$vagrant_ver = '1.8.7'
$vagrant_url = "https://releases.hashicorp.com/vagrant/${vagrant_ver}/vagrant_${vagrant_ver}_x86_64.deb"
$vagrant_num_instances = 5
###############################################################################
# Create users
$users_hash = {
  'adidenko'   => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwKpK7YBECkad/ureUhratFOt9BG4WarY4Vp3E5sdtDk+w7AzrK4gXIsDc+CMHkuTpzNMXSvNXYLskpNt1ndCA455BdEr60pyA/HBsxeqio4J1dwlLRbynZRFhjSR+6OyyAf8QCIGCYQZdkQyrHdEKPQNLMa6Pg5bDI6LiPuf+W+JJfUXpychazkAH0FK8kz+vFmLhIiwzVSzH316jBTv8iAfXjyAcgIE5SwkRMBO6bEpNIL7nMhb24i5cKDRruUAfOrLRYIEzur9b9hXFnZo3OSCjn5JwVJzoHusMj1m60leU5vpSjb4JjXkGlVMDmakASmgwQAir/HKlb3Ca6pQ9 adidenko@adidenko-pc',
    ip_pool => '10.110.0.0/16:24',
    vagrant_pool => '10.210.0.0/16',
  },
  'svasilenko' => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbNUC2UJiVk0bHmbVBHd4L22M3Mc3HVPdZZja7gzzUJDI/MIGoTSX8/Q38olBHg6i/9ePzroMqQS70x/LvuEgfKMDUcEBhggq22zea/wohMmMPwiGTEJ3j0CfckXM2cfjRHweHu4U//4SiSgLHi3nnEhYJUvFkOq10qOtZd2iT76sbKpnIEcRVfDcIy01G/wZQLX0SiCk8hWh9ERBqnW2OjNhwG/a2SdoPN25T1HmHAhLJykcGXb7BmrMNe7XFcNsqleMsopTXcqtZBu+ysEbNywPQKUiJrwqOtzkncQwwuKlr53EaXwBY5UHQwoFSXXi28JjmvEZAzA+UBMrPDHrx',
    ip_pool => '10.120.0.0/16:24',
    vagrant_pool => '10.220.0.0/16',
  },
  'apanchenko' => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzEjBQ4zCsvS/lzB/HZrA9QkblwC4UT2wwV/gO410qSJDMzPUSYfCQNchJEgrxDeOwxBKW1XNt7y46eJ2fFM2Rt66U5WW/VChSbzSrdmnKoRNKeRo8+xWWckCfXAxM1HU0Sx5Rf5jJHO79PKINURnYTgtIC3+wm8AZXeXuYCt5eV8e7ByGwt0ldO/dH3pnAJ9D7v77TGp03odPcsGl4rvj5C1kXhK3UJ9sdum8fW3rFePK6o7SuU7c3IzSFf0rFI2Eydf+RQy/SyA5aLQS/kQFBTNzUhb8HNAj/06x9siB+XPXCkSOwpFdYat/F5Py9PsEIr1xLHN+4Nkm6rpn+5aX apanchenko@mirantis.com',
    ip_pool => '10.130.0.0/16:24',
    vagrant_pool => '10.230.0.0/16',
  },
  'aroma'  => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOVomDosX6yuF46qh1HFBWCf8OiJY2nKKfbSNf5BItcHOErtjrOPd0NliPSW+Akr4fy5wln1nlIGfMjq+ZVY1Yv59hBB1Hbebik3K5d+BX9KIYHctjrclXLhtiXCFS/X2XRoMcZwOq1ozdo7S7aKSGl6fZVfaxjF1KMIc7RajmEop3eLYMkurqcxjdhBb2FplEpumHnBJtHhgnCDOI4DwVpczVhUDun5YRmCS7w1VcQ5LQphll5Pnj11G9xw84vwPIINr5NvqkKYudnWjF4elqnPMfr+A9m4ZeBgDZPO6QSMtYL3ZImANwaNtw1poZzxzVgVFmM9yCS/QJjqV3/br4mY6g00hmqqFdnZRi5MTMskvq7aBV11DCgJvrzX24RVmyYi6hFo5pqWqieaGDKSH0I7/kQXbuJnjyCTXdMwaqDiNOZkGoHNwucfNVJ6TugoJWhILpqkqc8hCz4i14v/zbKm7musoeIXUod3UxlVB34PdRhU4m0GznmfOdEWNwz1u29IeeQVunGwwzWnHENvlqMtpiWPXyPjNqO+4VKtzlioYIEgGS4gFGpq+RP0z9EDO9qU/nwUPVfp2izwd39XwKtuqlMLBxf6dYy2FJAd9q6Uzbv0aN5K9CRvsqFSVjzY9Vv0BS0VsZgP9/ie3i98zpPNO7JpqGRjkq64TL6RDyDw== aroma@mirantis.com',
    ip_pool => '10.140.0.0/16:24',
    vagrant_pool => '10.240.0.0/16',
  },
  'mstrukov'   => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDzbNI1nFRFuTFYFXKUioYEtr+4oKgBuO32hxnxuE1ohTbjBd0TK4abyzaZgVVk3qx3fdfvxmBcCtjRIElPOeQq9JNDHtXouPa8enUNXeeA8c2FAPZEdG6poEHGY43BNo9rxQJL4ddrJf+ykx6yNLYGGlrNRNK3erCbMY7lz2wWovvGa+ulLdC9NAGrywxTjKJjw1qdH6+fs1PuAAkSnU/nGnf+cAO6pgX+nM8t/j6mfGeYMd4UpMOczu+uNj2VqGDtQOoA7me2U+RD3iP/Y/LtMmvjLq2JXJphbMBJ0+ZrJyE8DTkTM1mnDCWJA9Smt25doks4534t2zyfUQfR2/uZby++X7zLd5WePe1dTzYFeC8GzYWr88S7XKpZs6u3dAcaLf2BedbWap3msHT07B04YNaLc5WkRo0J9WQBw0gCPPIod9QHvvymKhN6Or+UYJ/kklSsTRA6TBsWezAikn+5JlowENzY3HQafmgS4x4mgMnlxTw+YNXZmWaUoj7iIxLS1FwzSrrIzyGoY8DgX2Gz+KPhqlT7YxmPX+5wWR78RF1ozB9GWbkOHmeoPSp6QU/OWeve3s378SFLD89fCIqwESmULP4E99FyEO8zTGrwzMcYs06PxPpEoImQD/fX3+ismY4r2X2IsRlZ9GFpPEPX7XOD8P3u9VwQXEOW/jUa9w== mstrukov@mstrukov-pc
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCa06S3WW2GM3v2mUlK5kOYli6+4s9ed3rM+0osJYdgHV60OVxpiVGDtwlXGUSHVllZqPT5a2n7CMfIWqZV5s0aec8kTbbxWT15Ykoi8OVOMd2EJYDDpYMa6vIcw91LVkHmZnUMlu6ZSYUT+4mM2o9wsxtuV0UdCkf9xOzj2GYmBD41/6FpO+kg1NE2+8247rySBLem4cN9KCU+XRBJKD9LFkZEYPG8rRgoQRQ6ePAZcbvfhu7IGKYDshumQm1R1q968Iu4hrkbL8PYEScVG+JRlU1aTzZnfrM2RgmgmPxVdPR6TRUoqlRB0Ko6g4MbvOVNUMSbexhlMTFy2oR4Jbdqx+p+PD2fplMLsVz1+UCEX2YDsSCR0BRWLOJUuvxOeRAQC6jOjGhCWRquQFwhhD2xlVK/VwTMr6WSE5s3rZhAb2rhpH4332t6Xe9t3sokLg/WlDoRCy7RL9RafpFwYogeDEjqi447q0NRhsDRa9BwxEpWkqBcXZiwA0ZTp/py8FtEyAwPtzkgmp6AtVo+LK9BegYlOXNCiJxpY8fgRr50psLhA+LQFZVnidCbMq8Ld81UWazQEzCfN6lf96PCfmi6X7qkSxuuPQ/hdK4yHtJQ5z9oR795JV6zxMVmL1pl5cwE0liHdcXVebFMR0vWtnDxv9aGoueuJFlhkabxgI32aQ== maxik@power',
    ip_pool => '10.150.0.0/16:24',
    vagrant_pool => '10.250.0.0/16',
  },
  'akasatkin'  => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJFOEwYid83klmXcQs9QBDJwb1EG6Ly7DpJ32aH8gB8uguUPVO3rS/08GNav7+6GFLwlbWHVDe1MIFeNvyqh778B2piCzoajIT8aZFiutjbGtVPfkGkt94mibVutjO36eSEjEDW8GYQ2boisibha6B2mlz126y7nJN1VDSUr05Ro719i696vdN0fglu5DlT6qnOSei16EqkgQcMdyoxCfUOy9zBe3p1jGd2XKCOy3aGkhixEj6oaWSFRcA48SgqNSUO9A5NHTmWT/3j76Jsk92yw4e5OenWJbVx0BkU8q6U5fIncxkIQRYFUqB0X1TT9PnktDD4iJwNMXY7W2hYN2/ aleksey@aleksey-ThinkPad',
    ip_pool => '10.160.0.0/16:24',
    vagrant_pool => '10.60.0.0/16',
  },
  'veremin'  => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5VpKME2EWRH2XHgipoZJwW7fjWoBBQq3xA1+1jMWf+P2avy9Xjkgf0WIpQ7/FLXln+4HI18HME6XHjTiV6tMTMprtnllz+9j8Wxl2Umt8hBh2V1wzyp1E1d8j4MU6SvA5ZaTxx711DKhEWH9fXhw+7o9rQdxWSZbbvodz5VGfo7YxPX4OkEHUhJYYfsfyNXjHWpMYmpzICHqc47myQAiDc0OupQ8m2XZhc8imYRe01bBJLBgET2cYui2puHyT++EbcR+vFstoM6FtbsP4ii+z2b5+vsnm5awYLECvs5IF5deN2dX2H/azdcpDQRKToxJ8UjYJDi+GB8FwTMBY4Ozf yottatsa@Vladimirs-MacBook-Air.local',
    ip_pool => '10.170.0.0/16:24',
    vagrant_pool => '10.70.0.0/16',
  },
  'apopovych' => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDALtQKLsFXAJrOe1FL/5T9Rn7nHuTrfNKVb/reqpnMaPUcmRLPPmT9OqR5DiwYCf78xk8vHh5ogR4Cg5mdpgJwVGkQYhCqjiNiMFmlKImQx0bMlj1vQJk+x7qQQFras5jRHV6Ui2yI3o5laxX7GzgYlt39qMBEtyZrzwHzxfT//NQcFOYnKWjgcH8Z7C+nR8rixaicJEQ7jEAQVyzeA+I94gErd1Uy9LUXO33L4jKStKeQN89vl0OF6rperji1B9qFRb2CW/+kMdLmDBeoKHbTVYikHG8c15E1oaw6EeepWx8AaeFHi9T2+xwOrJ4Pw1UCyi/5d9Qf0RE3FdoAUvnJ falkerson@quasar',
    ip_pool => '10.180.0.0/16:24',
    vagrant_pool => '10.80.0.0/16',
  },
  'ssalagame' => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD2+mfcpRfoa+vwTeZEF51vhCwbVCYXxWWViIdrhph3uHiEaL3D3v564ECRfn0wqkLHUZNkZu91CTCZQ+h4vXA/owH3kJ9tRlW0c7V+lK5UayprF4bQ3ffk+fipqeqnv8ObqxiD0/9wkfVxWb9jnKNf45PKGp5GLzGgOvAntFZINR1XG3watnzlzmgmRQS9a6Jghr5Acn5FRRPlCXFv+VEg1Eadza34RiY36qVl79vq+9azTKS4nFQhrrid7LxcApCJlQnyYBdfDomcXMEE1ZmCiyoll5jwzTnP/DtR/YpAPcBXZcx/sbO8VnoHVMzA43DmqNLa+F2H9cegbqS6LYP ssalagame@mirantisits-MacBook-Pro-8.local',
    ip_pool => '10.190.0.0/16:24',
    vagrant_pool => '10.90.0.0/16',
  },
  'aarzhanov' => {
    pubkey  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDULnUS0LRq5K95vo0rFuxRxHt7vK/M/m4HVYNe0FcGnLESeFEb8Ip5NYl2P+77OQP/uPpOnDorFgBqANQXw8pHRihqRNXG7PylrOITHc/0RLiJvIEWt82Fw0Sz/6fY6b+/mVs01kD25MJy5lWNZEtxbbSaCmtst/9+ZIySYPnL2rNf3wTsW/IHDAziCqZr6nxfp0cIPy5KtNdT/AithsPvimdveSe25uEdZKxvfE/r3c6wock73ZIDLb9bzPaPQX5kZc9AAAuBfL2Vtzb9juFvPnwkK3mC/geGppP00wvmO12/WqEHRh92BMVpNOTgYpsvU37E9S5pjbTejTlcLPMR coolenigmaboy@aarzhanov',
    ip_pool => '10.115.0.0/16:24',
    vagrant_pool => '10.215.0.0/16',
  },
}

define shell_user(
  $user_hash,
  $user = $name,
){
  user {"$user":
    shell  => '/bin/bash',
    ensure => present,
    groups => ['libvirtd', 'docker'],
    home   => "/home/${user}",
  } ->
  file {"/home/${user}":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0750',
  } ->
  file {"/home/${user}/.ssh":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0700',
  } ->
  file {"/home/${user}/.ssh/authorized_keys":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    content => $user_hash[$user]['pubkey'],
  } ->
  exec {"clone_test_scripts_for_${user}":
    cwd     => "/home/${user}",
    command => "git clone https://github.com/adidenko/fuel-tests",
    creates => "/home/${user}/fuel-tests",
    user    => $user,
  }
  $master_ip = inline_template('<%= @user_hash[@user]["ip_pool"].gsub("0/16:24", "2") %>')
  $public_vip = inline_template('<%= @user_hash[@user]["ip_pool"].gsub("0.0/16:24", "3.3") %>')
  $octets = split($user_hash[$user]['ip_pool'], '[.]')
  firewall {"300 ${user}_fuelweb_nat":
    table       => 'nat',
    proto       => 'tcp',
    chain       => 'PREROUTING',
    jump        => 'DNAT',
    dport       => "8${octets[1]}",
    todest      => "${master_ip}:8443",
  }
  firewall {"300 ${user}_fuelweb_allow":
    proto       => 'tcp',
    destination => "${master_ip}",
    dport       => '8443',
    action      => 'accept',
    chain       => 'FORWARD',
  }
  firewall {"400 ${user}_fuelssh_nat":
    table       => 'nat',
    proto       => 'tcp',
    chain       => 'PREROUTING',
    jump        => 'DNAT',
    dport       => "2${octets[1]}",
    todest      => "${master_ip}:22",
  }
  firewall {"400 ${user}_fuelssh_allow":
    proto       => 'tcp',
    destination => "${master_ip}",
    dport       => '22',
    action      => 'accept',
    chain       => 'FORWARD',
  }
  firewall {"500 ${user}_horizon_nat":
    table       => 'nat',
    proto       => 'tcp',
    chain       => 'PREROUTING',
    jump        => 'DNAT',
    dport       => "9${octets[1]}",
    todest      => "${public_vip}:80",
  }
  firewall {"500 ${user}_horizon_allow":
    proto       => 'tcp',
    destination => "${public_vip}",
    dport       => '80',
    action      => 'accept',
    chain       => 'FORWARD',
  }

  # Vagrant plugin
  exec {"${user}-vagrant-libvirt-plugin":
    command     => 'vagrant plugin install vagrant-libvirt',
    unless      => 'vagrant plugin list | grep -q vagrant-libvirt',
    tag         => ['vagrant'],
    user        => $user,
    group       => $user,
    timeout     => 300,
    environment => "HOME=/home/${user}",
    cwd         => "/home/${user}",
  }
  # Vagrant lab firewall
  $node2_ip = inline_template('<%= @user_hash[@user]["vagrant_pool"].gsub("0/16", "12") %>')
  $v_octets = split($user_hash[$user]['vagrant_pool'], '[.]')
#  firewall {"500 ${user}_k8s_dashboard_nat":
#    table       => 'nat',
#    proto       => 'tcp',
#    chain       => 'PREROUTING',
#    jump        => 'DNAT',
#    dport       => "9${v_octets[1]}",
#    todest      => "${node2_ip}:9090",
#  }
#  firewall {"500 ${user}_k8s_dashboard_masquerade":
#    table       => 'nat',
#    chain       => 'POSTROUTING',
#    jump        => 'MASQUERADE',
#    proto       => 'all',
#    destination => "${node2_ip}",
#    source      => "! ${v_octets[0]}.${v_octets[1]}.0.0/24",
#  }
#  firewall {"500  ${user}_k8s_dashboard_allow":
#    proto       => 'tcp',
#    destination => "${node2_ip}",
#    dport       => '9090',
#    action      => 'accept',
#    chain       => 'FORWARD',
#  }
  # Vagrant skeleton
  $user_subnet = inline_template('<%= @user_hash[@user]["vagrant_pool"].gsub(".0.0/16.*", "") %>')
  file {"/home/${user}/vagrant":
    ensure => directory,
    owner  => $user,
    group  => $user,
  } ->
  file {"/home/${user}/vagrant/Vagrantfile.example":
    ensure  => file,
    owner   => $user,
    group   => $user,
    content => inline_template('# Controlled by puppet
# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["VAGRANT_DEFAULT_PROVIDER"] = "libvirt"

$num_instances = <%= @vagrant_num_instances %>
$vm_memory = 2048
$vm_cpus = 2

$user = "<%= @user %>"
$public_subnet = "<%= user_subnet %>.0"
$private_subnet = "<%= user_subnet %>.1"
$mgmt_cidr = "<%= user_subnet %>.2.0/24"

$instance_name_prefix = "#{$user}-k8s"
# Boxes with libvirt provider support:
#$box = "yk0/ubuntu-xenial" #900M
#$box = "centos/7"
$box = "nrclark/xenial64-minimal-libvirt"

Vagrant.configure("2") do |config|
  (1..$num_instances).each do |i|
    config.ssh.insert_key = false
    vm_name = "%s-%02d" % [$instance_name_prefix, i]
    config.vm.define vm_name do |test_vm|
      test_vm.vm.box = $box
      test_vm.vm.hostname = vm_name
      test_vm.vm.provider :libvirt do |domain|
        domain.uri = "qemu+unix:///system"
        domain.memory = $vm_memory
        domain.cpus = $vm_cpus
        domain.driver = "kvm"
        domain.host = "localhost"
        domain.connect_via_ssh = false
        domain.username = $user
        domain.storage_pool_name = "default"
        domain.nic_model_type = "e1000"
        domain.management_network_name = "#{$instance_name_prefix}-mgmt-net"
        domain.management_network_address = $mgmt_cidr
      end

      test_vm.vm.network :private_network,
        :ip => "#{$private_subnet}.#{i+10}",
        :model_type => "e1000",
        :libvirt__network_name => "#{$instance_name_prefix}-private",
        :libvirt__dhcp_enabled => false,
        :libvirt__forward_mode => "none"

    end
  end
end
')
  }
}
###############################################################################

$users = map($users_hash) |$x| { $x[0] }

shell_user {$users:
  user_hash => $users_hash,
  require   => Package['libvirt-bin'],
}

###############################################################################
# Install software

Package<| tag == 'software' |> -> Exec<| tag == 'software' |>

$packages = [
  'git',
  'postgresql',
  'postgresql-server-dev-all',
  'libyaml-dev',
  'libffi-dev',
  'python-dev',
  'python-libvirt',
  'python-pip',
  'qemu-kvm',
  'qemu-utils',
  'libvirt-bin',
  'libvirt-dev',
  'ubuntu-vm-builder',
  'bridge-utils',
  'python-virtualenv',
  'libpq-dev',
  'libgmp-dev'
]

package {$packages:
  ensure => installed,
  tag    => ['software'],
}
###############################################################################
# Configure libvirt
# !!!!exec magick!!!!
Exec<||>{
  path      => ['/bin/', '/usr/bin', '/sbin', '/usr/sbin', '/usr/local/bin'],
  logoutput => true,
}

Package<| tag == 'software' |> -> Exec<| tag == 'libvirt' |>

exec {'virsh-pool-create':
  command => 'virsh pool-define-as --type=dir --name=default --target=/var/lib/libvirt/images',
  unless  => 'virsh pool-list --all | grep default',
  tag     => ['libvirt'],
} ->
exec {'virsh-pool-autostart':
  command => 'virsh pool-autostart default',
  unless  => 'virsh pool-list --all | grep default | grep yes',
  tag     => ['libvirt'],
} ->
exec {'virsh-pool-start':
  command => 'virsh pool-start default',
  unless  => 'virsh pool-list | grep default | grep active',
  tag     => ['libvirt'],
}

###############################################################################
# Configure virtualenv and soft
#
#exec {'update-pg-config':
#  command => "sed -ir 's/peer/trust/' $pg_conf",
#  onlyif  => "grep -v ^# $pg_conf | grep peer"
#} ~>
#service {'postgresql':
#  ensure => running,
#}

exec {'create-virtual-env':
  command => 'virtualenv --no-site-packages /opt/fuel-devops-venv',
  creates => '/opt/fuel-devops-venv',
} ->
exec {'setup-fuel-devops':
  command => 'bash -c "source /opt/fuel-devops-venv/bin/activate ; pip install git+https://github.com/openstack/fuel-devops.git@3.0.3 --upgrade"',
  creates => '/opt/fuel-devops-venv/lib/python2.7/site-packages/devops',
} ->
exec {'setup-psycopg2':
  command => 'bash -c "source /opt/fuel-devops-venv/bin/activate ; pip install psycopg2"',
  creates => '/opt/fuel-devops-venv/lib/python2.7/site-packages/psycopg2',
}

class { 'postgresql::server': }

postgresql::server::db { 'nailgun':
  user     => 'nailgun',
  password => postgresql_password('nailgun', 'nailgun'),
}

postgresql::server::db { 'fuel_devops':
  user     => 'fuel_devops',
  password => postgresql_password('fuel_devops', 'fuel_devops'),
} ->
exec {'setup-django-db':
  command => 'bash -c "source /opt/fuel-devops-venv/bin/activate ; django-admin.py syncdb --settings=devops.settings ; django-admin.py migrate devops --settings=devops.settings"',
  unless  => 'bash -c "source /opt/fuel-devops-venv/bin/activate ; dos.py list"',
}

exec {'download-fuel-qa':
  cwd     => '/opt',
  command => 'git clone https://github.com/openstack/fuel-qa',
  creates => '/opt/fuel-qa',
} ->
exec {'setup-fuel-qa':
  cwd     => '/opt/fuel-qa',
  command => 'bash -c "source /opt/fuel-devops-venv/bin/activate ; pip install -r ./fuelweb_test/requirements.txt --upgrade"',
  creates => '/opt/fuel-devops-venv/lib/python2.7/site-packages/jenkins',
}

sysctl { 'net.bridge.bridge-nf-call-iptables': value => '0' }

###############################################################################
file {'/var/log/nailgun':
  ensure => directory,
  mode   => '0777',
}

file {'/opt/fuel-iso':
  ensure => directory,
  mode   => '0777',
}

file {'/etc/profile.d/team-network.sh':
  ensure  => file,
  mode    => '0755',
  content => inline_template('# created by puppet

declare -A ip_pools
ip_pools=( \
<% @users_hash.each do |user, user_hash| -%>
["<%= user %>"]="<%= user_hash["ip_pool"] %>" \
<% end -%>
)

declare -A vagrant_pools
vagrant_pools=( \
<% @users_hash.each do |user, user_hash| -%>
["<%= user %>"]="<%= user_hash["vagrant_pool"] %>" \
<% end -%>
)

declare -A fmaster
fmaster=( \
<% @users_hash.each do |user, user_hash|
  master_port = user_hash["ip_pool"].split(/\./)[1] -%>
["<%= user %>"]="<%= @ipaddress_em1 %>:8<%= master_port %>" \
<% end -%>
)
export POOL_DEFAULT="${ip_pools[$(whoami)]}"
export VAGRANT_POOL="${vagrant_pools[$(whoami)]}"
export MY_MASTER="${fmaster[$(whoami)]}"
function helpme {
echo -e "\n##################################################"
echo -e "TEAM-NETWORK INFO\n"
echo -e "Fuel-devops path:            /opt/fuel-devops-venv/"
echo -e "Fuel-qa path:                /opt/fuel-qa/"
echo -e "Test scripts path:           ~/fuel-tests/"
echo -e "Direcotry for ISO sharing:   /opt/fuel-iso"
echo -e "\nCOMMANDS:"
echo -e "\n# Run tests:"
echo -e "vim ~/fuel-tests/testsrc"
echo -e "~/fuel-tests/systest.sh"
echo -e "\n# Activate fuel-devops venv and list envs:"
echo -e ". /opt/fuel-devops-venv/bin/activate"
echo -e "dos.py list"
echo
echo "YOUR FUEL WEB URL IS: https://$MY_MASTER/"
echo
echo "YOUR IP_POOL FOR SYSTEM-TESTS IS: $POOL_DEFAULT"
echo
echo "You can make sure it\'s set by running this command:"
echo "echo \$POOL_DEFAULT"
echo
echo "YOUR VAGRANT POOL IS: $VAGRANT_POOL"
echo "You can make sure it\'s set by running this command:"
echo "echo \$VAGRANT_POOL"
echo -e "\n##################################################\n"
}
helpme
')
}
###############################################################################
# script and cron to run

file {'/usr/local/bin/run_puppet.sh':
  ensure  => file,
  mode    => 0755,
  content => '#!/bin/bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
date
iptables --version
while `iptables -L --line-numbers -nv | grep _allow | head -n1 | awk \'{print $1}\' | xargs iptables -D FORWARD $i ` ; do echo REMOVED;  done
puppet apply --parser future -d -v /home/adidenko/team-network-lab.pp &> /var/log/puppet.log
',
}
cron {'run_puppet':
  command => '/usr/local/bin/run_puppet.sh &>/var/log/run_puppet.log',
  user    => 'root',
  minute  => '*/10',
}

###############################################################################
# Vagrant

Exec<| tag == 'libvirt' |> ->
Exec<| tag == 'vagrant' |>

Package<| tag == 'vagrant' |> ->
Exec<| tag == 'vagrant' |>

$vagrant_packages = [
  'bundler',
  'libxml2-dev',
  'libxslt-dev',
  'zlib1g-dev',
  'ruby-dev',
  'ruby-libvirt'
]

package {$vagrant_packages:
  ensure   => installed,
  tag      => ['vagrant'],
}

exec {'download_vagrant':
  command  => "wget -N $vagrant_url -O /var/tmp/vagrant_${vagrant_ver}_x86_64.deb",
  unless   => "test -f /var/tmp/vagrant_${vagrant_ver}_x86_64.deb",
}
package {'vagrant':
  ensure   => latest,
  provider => 'dpkg',
  source   => "/var/tmp/vagrant_${vagrant_ver}_x86_64.deb",
  tag      => ['vagrant'],
  require  => Exec['download_vagrant'],
}

#$vagrant_gems = [
#  'nokogiri'
#]
#package {$vagrant_gems:
#  ensure   => installed,
#  provider => "gem",
#  tag      => ['vagrant'],
#}

###############################################################################
###############################################################################
###############################################################################

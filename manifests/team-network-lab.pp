###############################################################################
###############################################################################
# This manifest is for host system configuration
# for team-network virtual labs
# Requires: parser = future
#   puppet apply --parser future -d -v team-network-lab.pp
# Requires modules:
#   puppetlabs/vcsrepo
#   thias-sysctl
#   puppetlabs-firewall
#   garethr/docker
#   camptocamp-kmod
#   saz-locales
#
###############################################################################
# Vagrant variables
$vagrant_ver = '1.9.3'
$vagrant_url = "https://releases.hashicorp.com/vagrant/${vagrant_ver}/vagrant_${vagrant_ver}_x86_64.deb"
$vagrant_num_instances = 5
# Docker variables
$docker_version = 'latest'
$docker_compose_version = '1.10.0'
# Gimme variables
$gimme_url = 'https://raw.githubusercontent.com/travis-ci/gimme/master/gimme'
$gimme_path = 'bin/gimme'
# Repo variables
$tcp_qa_repo = 'git://github.com/mirantis/tcp-qa.git'
$tcp_qa_repo_rev = 'master'
# etc
$path_to_script_for_cron = '/usr/local/bin/run_puppet.sh'
$cron_run_puppet_logs = '/var/log/run_puppet.log'
$temp_path_for_vagrant_package = '/var/tmp'

###############################################################################
# User data
$users_hash = {
  'svasilenko' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbNUC2UJiVk0bHmbVBHd4L22M3Mc3HVPdZZja7gzzUJDI/MIGoTSX8/Q38olBHg6i/9ePzroMqQS70x/LvuEgfKMDUcEBhggq22zea/wohMmMPwiGTEJ3j0CfckXM2cfjRHweHu4U//4SiSgLHi3nnEhYJUvFkOq10qOtZd2iT76sbKpnIEcRVfDcIy01G/wZQLX0SiCk8hWh9ERBqnW2OjNhwG/a2SdoPN25T1HmHAhLJykcGXb7BmrMNe7XFcNsqleMsopTXcqtZBu+ysEbNywPQKUiJrwqOtzkncQwwuKlr53EaXwBY5UHQwoFSXXi28JjmvEZAzA+UBMrPDHrx',
    ip_pool      => '10.120.0.0/16:24',
    vagrant_pool => '10.220.0.0/16',
  },
  'apanchenko' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzEjBQ4zCsvS/lzB/HZrA9QkblwC4UT2wwV/gO410qSJDMzPUSYfCQNchJEgrxDeOwxBKW1XNt7y46eJ2fFM2Rt66U5WW/VChSbzSrdmnKoRNKeRo8+xWWckCfXAxM1HU0Sx5Rf5jJHO79PKINURnYTgtIC3+wm8AZXeXuYCt5eV8e7ByGwt0ldO/dH3pnAJ9D7v77TGp03odPcsGl4rvj5C1kXhK3UJ9sdum8fW3rFePK6o7SuU7c3IzSFf0rFI2Eydf+RQy/SyA5aLQS/kQFBTNzUhb8HNAj/06x9siB+XPXCkSOwpFdYat/F5Py9PsEIr1xLHN+4Nkm6rpn+5aX apanchenko@mirantis.com',
    ip_pool      => '10.130.0.0/16:24',
    vagrant_pool => '10.230.0.0/16',
  },
  'akasatkin' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJFOEwYid83klmXcQs9QBDJwb1EG6Ly7DpJ32aH8gB8uguUPVO3rS/08GNav7+6GFLwlbWHVDe1MIFeNvyqh778B2piCzoajIT8aZFiutjbGtVPfkGkt94mibVutjO36eSEjEDW8GYQ2boisibha6B2mlz126y7nJN1VDSUr05Ro719i696vdN0fglu5DlT6qnOSei16EqkgQcMdyoxCfUOy9zBe3p1jGd2XKCOy3aGkhixEj6oaWSFRcA48SgqNSUO9A5NHTmWT/3j76Jsk92yw4e5OenWJbVx0BkU8q6U5fIncxkIQRYFUqB0X1TT9PnktDD4iJwNMXY7W2hYN2/ aleksey@aleksey-ThinkPad',
    ip_pool      => '10.160.0.0/16:24',
    vagrant_pool => '10.60.0.0/16',
  },
  'ssalagame' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD2+mfcpRfoa+vwTeZEF51vhCwbVCYXxWWViIdrhph3uHiEaL3D3v564ECRfn0wqkLHUZNkZu91CTCZQ+h4vXA/owH3kJ9tRlW0c7V+lK5UayprF4bQ3ffk+fipqeqnv8ObqxiD0/9wkfVxWb9jnKNf45PKGp5GLzGgOvAntFZINR1XG3watnzlzmgmRQS9a6Jghr5Acn5FRRPlCXFv+VEg1Eadza34RiY36qVl79vq+9azTKS4nFQhrrid7LxcApCJlQnyYBdfDomcXMEE1ZmCiyoll5jwzTnP/DtR/YpAPcBXZcx/sbO8VnoHVMzA43DmqNLa+F2H9cegbqS6LYP ssalagame@mirantisits-MacBook-Pro-8.local',
    ip_pool      => '10.190.0.0/16:24',
    vagrant_pool => '10.90.0.0/16',
  },
  'vyakovlev' => {
    pubkey       => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTwut7jb55gax2Fz7uP9JOVNFPB0xnRH/baqRoxupedfpFmWz7EL/MUp097kRSgfK77WXTqr7jfpKVqV/aOURq1RG71Tt901s5aUgzNMKOabsqKddycahDuwrOGsxZkKTUJBd86762rnjZ8+fDoVycvdAat6am711evMkMVrFZLYi3FTEEwQcw7egjGtBo/3uXFoTf3tC9DPVqeO+tvPuDka4ajkYzdxEN8Rk0V4fc47OpckQWclRY90bbCD7byRWd/XEu+AS5xT7A8wnx7c0u4PnBUQUy6om7N0GpaoE/wzKn+x1OX/4x0c0DP1durABAauqrC+7nG9J9W4XuWbTL',
    vagrant_pool => '10.215.0.0/16',
  },
}

define shell_user(
  $user_hash,
  $user = $name,
){
  user { $user:
    ensure => present,
    shell  => '/bin/bash',
    groups => ['libvirtd', 'docker'],
    home   => "/home/${user}",
  } ->
  file { "/home/${user}":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0750',
  } ->
  file { "/home/${user}/.ssh":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0700',
  } ->
  file { "/home/${user}/.ssh/authorized_keys":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    content => $user_hash[$user]['pubkey'],
  } ->
  file { "/home/${user}/bin":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0775',
  } ->
  exec { "download_gimme_for_${user}":
    command     => "wget -O /home/${user}/${gimme_path} ${gimme_url}",
    unless      => "test -f /home/${user}/${gimme_path}",
    environment => "HOME=/home/${user}",
    cwd         => "/home/${user}",
  } ->
  file { "/home/${user}/${gimme_path}":
    ensure  => present,
    replace => 'no',
    owner   => $user,
    group   => $user,
    mode    => '0775',
  } ->
  file { [ "/home/${user}/gopath", "/home/${user}/gopath/src",
    "/home/${user}/gopath/src/github.com",
    "/home/${user}/gopath/src/github.com/Mirantis" ]:
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0775',
  } ->
  vcsrepo { "/home/${user}/tcp-qa":
    ensure   => present,
    # if use "ensure => latest",
    # this overwrites any local changes to the repository.
    provider => git,
    source   => $tcp_qa_repo,
    revision => $tcp_qa_repo_rev,
    user     => $user,
  }

  # Vagrant plugin
  exec { "${user}-vagrant-libvirt-plugin":
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
#  firewall { "500 ${user}_k8s_dashboard_nat":
#    table  => 'nat',
#    proto  => 'tcp',
#    chain  => 'PREROUTING',
#    jump   => 'DNAT',
#    dport  => "9${v_octets[1]}",
#    todest => "${node2_ip}:9090",
#  }
#  firewall { "500 ${user}_k8s_dashboard_masquerade":
#    table       => 'nat',
#    chain       => 'POSTROUTING',
#    jump        => 'MASQUERADE',
#    proto       => 'all',
#    destination => "${node2_ip}",
#    source      => "! ${v_octets[0]}.${v_octets[1]}.0.0/24",
#  }
#  firewall { "500  ${user}_k8s_dashboard_allow":
#    proto       => 'tcp',
#    destination => "${node2_ip}",
#    dport       => '9090',
#    action      => 'accept',
#    chain       => 'FORWARD',
#  }

  # Vagrant skeleton
  $user_subnet = inline_template('<%= @user_hash[@user]["vagrant_pool"].gsub(".0.0/16.*", "") %>')

  file { "/home/${user}/vagrant":
    ensure => directory,
    owner  => $user,
    group  => $user,
  } ->
  file { "/home/${user}/vagrant/Vagrantfile.example":
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
$public_subnet = "<%= @user_subnet %>.0"
$private_subnet = "<%= @user_subnet %>.1"
$mgmt_cidr = "<%= @user_subnet %>.2.0/24"

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
# Install docker, docker-compose
Class['docker'] -> Shell_user<||>

class { '::docker::compose':
  ensure  => present,
  version => $docker_compose_version,
}

class { '::docker':
#  docker_users => $users,
  version => $docker_version,
}

$users = map($users_hash) |$x| { $x[0] }

shell_user { $users:
  user_hash => $users_hash,
  require   => Package['libvirt-bin'],
}

###############################################################################
# Configure locales
class { '::locales':
  default_locale => 'en_US.UTF-8',
  locales        => ['en_US.UTF-8 UTF-8', 'ru_RU.UTF-8 UTF-8' ],
  lc_all         => 'en_US.UTF-8',
}

###############################################################################
# Install software
Class['locales'] -> Package<| tag == 'software' |>
Package<| tag == 'software' |> -> Exec<| tag == 'software' |>

$packages = [
  'git',
  'libsqlite3-0',
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
  'libgmp-dev',
  'createrepo',
  'rpm',
  'dpkg-dev',
  'iptables-persistent'
]

package { $packages:
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

Class['locales'] -> Exec<| tag == 'libvirt' |>
Package<| tag == 'software' |> -> Exec<| tag == 'libvirt' |>

exec { 'virsh-pool-create':
  command => 'virsh pool-define-as --type=dir --name=default --target=/var/lib/libvirt/images',
  unless  => 'virsh pool-list --all | grep default',
  tag     => ['libvirt'],
} ->
exec { 'virsh-pool-autostart':
  command => 'virsh pool-autostart default',
  unless  => 'virsh pool-list --all | grep default | grep yes',
  tag     => ['libvirt'],
} ->
exec { 'virsh-pool-start':
  command => 'virsh pool-start default',
  unless  => 'virsh pool-list | grep default | grep active',
  tag     => ['libvirt'],
}

###############################################################################
# Configure virtualenv, devops, fuel-qa requirements, etc
Class['locales'] -> Virtual_env<||>

$venvs = [
  '/opt/fuel-devops-venv-mcp'
]

$tcp_qa_hash = {
  'tcp-qa-master' => {
    rev  => 'master',
    venv => 'fuel-devops-venv-mcp',
  },
}

$tcp_qa = map($tcp_qa_hash) |$x| { $x[0] }

define virtual_env(
  $venv = $name,
){
  exec { "create-virtual-env_${venv}":
    command => "virtualenv --no-site-packages ${venv}",
    creates => $venv,
  } ->
  file { "${venv}":
    ensure => directory,
    mode   => '0777',
  } ->
  file { "${venv}/devops.db":
    ensure => present,
    content => "",
    mode   => '0777',
    replace => 'no',
  } ->
  exec { "setup-fuel-devops-for_${venv}":
    command => "bash -c 'source ${venv}/bin/activate; pip install psycopg2; export DEVOPS_DB_NAME=${venv}/devops.db DEVOPS_DB_ENGINE=django.db.backends.sqlite3; pip install git+https://github.com/openstack/fuel-devops.git@3.0.5 --upgrade; django-admin.py syncdb --settings=devops.settings; django-admin.py migrate devops --settings=devops.settings'",
    creates => "${venv}/lib/python2.7/site-packages/devops",
  } ->
  exec { "add_sqlite_db_activation":
    command => "echo 'export DEVOPS_DB_NAME=${venv}/devops.db \nexport DEVOPS_DB_ENGINE=django.db.backends.sqlite3' >> ${venv}/bin/activate",
    unless => "grep -q DEVOPS_DB_ENGINE ${venv}/bin/activate"
  }
}

define tcpqa(
  $tcpqa_hash,
  $tcp_qa = $name,
){
  $python_venv = $tcpqa_hash[$tcp_qa]['venv']
  $git_rev     = $tcpqa_hash[$tcp_qa]['rev']
  vcsrepo { "/opt/${tcp_qa}":
    ensure   => present,
    # if use "ensure => latest",
    # this overwrites any local changes to the repository.
    provider => git,
    source   => $tcp_qa_repo,
    revision => $git_rev,
  } ->
  file { "/opt/${tcp_qa}":
    ensure => directory,
    mode   => '0777',
  } ->
  exec { "setup-${tcp_qa}":
    cwd     => "/opt/${tcp_qa}",
    command => "bash -c 'source /opt/${python_venv}/bin/activate ; pip install -r ./tcp_tests/requirements.txt --upgrade'",
    creates => "/opt/${python_venv}/lib/python2.7/site-packages/k8sclient",
  } ->
  file { "/opt/${python_venv}/update-requirements.sh":
    ensure  => file,
    mode    => '0755',
    content => inline_template('#!/bin/bash

# created by puppet

set -ex

TCP_QA_COMMIT=${TCP_QA_COMMIT:-master}
REQUIREMENTS_FILE="https://raw.githubusercontent.com/Mirantis/tcp-qa/${TCP_QA_COMMIT}/tcp_tests/requirements.txt"
PYTHON_VENV_PATH="/opt/<%= @python_venv %>"

pip_install_upgrade () {
        source "${PYTHON_VENV_PATH}/bin/activate"
        pip install --upgrade --upgrade-strategy=only-if-needed -r <(curl -s "${REQUIREMENTS_FILE}")
        deactivate
}

pip_install_upgrade')
  } ->
  file { "/opt/${python_venv}/exports.sh":
    ensure  => file,
    mode    => '0755',
    content => inline_template('#!/bin/bash

# created by puppet

set -a

##############################
     #  General options #
##############################

# Environment name (fuel-devops & libvirt VMs)
ENV_NAME=mcp-k8s-$(whoami)

# Cloud image used by fuel-devops to setup VMs
IMAGE_PATH1604=/opt/images/xenial-server-cloudimg-amd64.qcow2

# Name of reclass model (cluster) and template in tcp-qa
LAB_CONFIG_NAME=virtual-mcp11-k8s-calico-minimal
# Currently (June 2017) available templates with k8s:
#  * virtual-mcp11-k8s-calico-minimal - 5 nodes, 16GB RAM (1 salt master, 3 kube masters, 1 kube minion)
#  * virtual-mcp11-k8s-calico - 10 nodes, 32+GB RAM (1 salt master, 3 kube masters, 2 kube minions, 3 monitoring nodes, 1 proxy node for monitoring)
#  * virtual-mcp11-k8s-contrail - 14 nodes,  64GB RAM (the same as above + 3 network nodes and 1 VSRX node)

# APT repository to use (dist in http://apt-mk.mirantis.com/xenial), (!)salt formulas are installed from there
# could be "stable" (kinda stable), "testing" (kinda tested) and "nightly" (just built from master)
REPOSITORY_SUITE=testing

# You can use your own GIT repository with reclass models
#SALT_MODELS_REPOSITORY="http://apanchenko-pc.kha.mirantis.net:8080/salt-models/mcp-virtual-lab.git"
#SALT_MODELS_BRANCH="CalicoMinimal"
#SALT_MODELS_COMMIT="CalicoMinimal"

# Hint: to check all configurable options you can use:
#
#    `vim tcp_tests/settings_oslo.py`
#    `vim tcp_tests/settings.py`
#    `fgrep -w os_env tcp_tests/templates/virtual-mcp11-k8s-calico/ -R`
#
#  where "virtual-mcp11-k8s-calico" is the name of reclass model you use

##############################
     #  Tests options #
##############################

# Do not shutdown environment after tests if False
SHUTDOWN_ENV_ON_TEARDOWN=false

KUBERNETES_ADMIN_USER=admin  # k8s creds
KUBERNETES_ADMIN_PASSWORD=sbPfel23ZigJF3Bm  # k8s creds
#KUBERNETES_DOCKER_PACKAGE=  # system package with Docker to install on nodes
KUBERNETES_HYPERKUBE_IMAGE=docker-prod-virtual.docker.mirantis.net/mirantis/kubernetes/hyperkube-amd64:v1.6.2-2  # k8s image
KUBERNETES_CALICO_IMAGE=docker-prod-virtual.docker.mirantis.net/mirantis/projectcalico/calico/node:latest  # calico/node image
KUBERNETES_CALICOCTL_IMAGE=docker-prod-virtual.docker.mirantis.net/mirantis/projectcalico/calico/ctl:latest  # calico/ctl image
KUBERNETES_CALICO_CNI_IMAGE=docker-prod-virtual.docker.mirantis.net/mirantis/projectcalico/calico/cni:latest  # calico/cni image
KUBERNETES_NETCHECKER_ENABLED=True  # Do not install netchecker by salt formulas if False
KUBERNETES_NETCHECKER_AGENT_IMAGE=mirantis/k8s-netchecker-agent:latest
KUBERNETES_NETCHECKER_SERVER_IMAGE=mirantis/k8s-netchecker-server:latest
KUBERNETES_CALICO_POLICY_ENABLED=true  # do not install calico policy controller if False
#KUBERNETES_CALICO_POLICY_IMAGE=  # calico policy controller image

set +a')
  }
}

kmod::load { 'br_netfilter': } ->
sysctl { 'net.bridge.bridge-nf-call-iptables': value => '0' }

virtual_env { $venvs: } ->
tcpqa { $tcp_qa:
  tcpqa_hash => $tcp_qa_hash,
}

###############################################################################
# Create directories for images  and profile file.

file { '/opt/images':
  ensure => directory,
  mode   => '0777',
}

file { '/etc/profile.d/team-network.sh':
  ensure  => file,
  mode    => '0755',
  content => inline_template('# created by puppet

declare -A vagrant_pools
vagrant_pools=( \
<% @users_hash.each do |user, user_hash| -%>
["<%= user %>"]="<%= user_hash["vagrant_pool"] %>" \
<% end -%>
)

export VAGRANT_POOL="${vagrant_pools[$(whoami)]}"
export GOPATH="${HOME}"/gopath
export PATH="${HOME}"/bin:"${HOME}"/gopath/bin:"${PATH}"
function helpme {
echo -e "\e[34m########################################################################\e[0m    "
echo -e "\e[34m#                        # TEAM-NETWORK INFO #                         #\e[0m    "
echo -e "\e[34m########################################################################\e[0m    "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mClone tcp-qa git repository to home dir:\e[0m                       "
echo -e "\e[34m#\e[0m    git clone https://github.com/Mirantis/tcp-qa                           "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mCopy settings file into your test dir:\e[0m                         "
echo -e "\e[34m#\e[0m    cp /opt/fuel-devops-venv-mcp/exports.sh ~/tcp-qa/exports.sh            "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mDirectory for ISO sharing:\e[0m                                     "
echo -e "\e[34m#\e[0m    /opt/images/                                                           "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#                        # COMMANDS: #\e[0m                                      "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m  \e[1mRun tests:\e[0m                                                     "
echo -e "\e[34m#\e[0m    * Update python venv if needed (e.g. requirements changed in tcp-qa):  "
echo -e "\e[34m#\e[0m       \e[37m export TCP_QA_COMMIT=master \e[0m                            "
echo -e "\e[34m#\e[0m       \e[37m sudo -E /opt/fuel-devops-venv-mcp/update-requirements.sh\e[0m"
echo -e "\e[34m#\e[0m    * Activate python venv with fuel-devops for MCP:                       "
echo -e "\e[34m#\e[0m       \e[37m . /opt/fuel-devops-venv-mcp/bin/activate \e[0m               "
echo -e "\e[34m#\e[0m       \e[37m dos.py list \e[0m                                            "
echo -e "\e[34m#\e[0m    * Edit some variables, if needed and run tests:                        "
echo -e "\e[34m#\e[0m       \e[37m cd ~/tcp-qa/ \e[0m                                           "
echo -e "\e[34m#\e[0m       \e[37m vim exports.sh \e[0m                                         "
echo -e "\e[34m#\e[0m       \e[37m source exports.sh \e[0m                                      "
echo -e "\e[34m#\e[0m       \e[37m py.test -k test_only_k8s_install \e[0m                       "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m#\e[0m                                                                           "
echo -e "\e[34m########################################################################\e[0m    "
echo -e "\e[34m#                        # TEAM-NETWORK INFO #                         #\e[0m    "
echo -e "\e[34m########################################################################\e[0m    "
}
helpme
')
}

###############################################################################
# Script and cron to run
### Implemented in puppet_apply.sh ###
#file { '/usr/local/bin/run_puppet.sh':
#  ensure  => file,
#  mode    => '0755',
#  content => '#!/bin/bash
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#date
#iptables --version
#while `iptables -L --line-numbers -nv | grep _allow | head -n1 | awk \'{print $1}\' | xargs iptables -D FORWARD $i ` ; do echo REMOVED; done
#puppet apply --parser future -d -v /home/adidenko/team-network-lab.pp &> /var/log/puppet.log
#',
#}
### Implemented in puppet_apply.sh ###

cron { 'run_puppet':
  command => "${path_to_script_for_cron} &>${cron_run_puppet_logs}",
  user    => 'root',
  minute  => '*/20',
}

###############################################################################
# Vagrant
Exec<| tag == 'libvirt' |> -> Exec<| tag == 'vagrant' |>
Package<| tag == 'vagrant' |> -> Exec<| tag == 'vagrant' |>

$vagrant_packages = [
  'bundler',
  'libxml2-dev',
  'libxslt-dev',
  'zlib1g-dev',
  'ruby-dev',
  'ruby-libvirt'
]

package { $vagrant_packages:
  ensure => installed,
  tag    => ['vagrant'],
}

exec { 'download_vagrant':
  command => "wget -O ${temp_path_for_vagrant_package}/vagrant_${vagrant_ver}_x86_64.deb ${vagrant_url}",
  unless  => "test -f ${temp_path_for_vagrant_package}/vagrant_${vagrant_ver}_x86_64.deb",
}

package { 'vagrant':
  ensure   => latest,
  provider => 'dpkg',
  source   => "${temp_path_for_vagrant_package}/vagrant_${vagrant_ver}_x86_64.deb",
  tag      => ['vagrant'],
  require  => Exec['download_vagrant'],
}

#$vagrant_gems = [
#  'nokogiri'
#]
#package { $vagrant_gems:
#  ensure   => installed,
#  provider => "gem",
#  tag      => ['vagrant'],
#}

###############################################################################
###############################################################################

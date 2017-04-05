#!/bin/bash
#
set -o xtrace
set -o pipefail
set -o errexit
set -o nounset


APT_ARGS=${APT_ARGS:-"--yes"}
PACKAGES_TO_INSTALL=${PACKAGES_TO_INSTALL:-"puppet-common"}
PUPPET_APPLY_ARGS=(--parser future -d -v)
PATH_TO_SCRIPT_FOR_CRON=${PATH_TO_SCRIPT_FOR_CRON:-/usr/local/bin/run_puppet.sh}
PUPPET_LOGS=${PUPPET_LOGS:-/var/log/puppet.log}
PATH_TO_MANIFESTS="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[@]}")")"; cd ../manifests; pwd)"
MANIFEST_NAME=${MANIFEST_NAME:-team-network-lab.pp}
MODULES_TO_INSTALL=${MODULES_TO_INSTALL:-"puppetlabs/postgresql \
puppetlabs/vcsrepo thias-sysctl puppetlabs-firewall \
garethr/docker camptocamp-kmod saz-locales"}


function check-root {
  if [ "${EUID}" -ne 0 ]; then
  	echo "Please run as root!"
    exit 1
  fi
}


function check-manifest-exist() {
  if [ ! -d "${PATH_TO_MANIFESTS}" ]; then
  	echo "Directory with manifests does not exist!"
  	exit 1
  fi  
  if [ ! -f "${PATH_TO_MANIFESTS}"/"${1}" ]; then
    echo "Manifest ${1} does not exist!"
    exit 1
  fi
}


function create-script-for-cron() {
  if [ ! -f "${1}" ]; then
    cat > "${1}" << EOF
#!/bin/bash
#
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#
date
iptables --version
while iptables -L --line-numbers -nv | grep _allow | head -n1 | awk '{print \$1}' | xargs iptables -D FORWARD; do
  echo REMOVED;
done
puppet apply ${PUPPET_APPLY_ARGS[@]} ${PATH_TO_MANIFESTS}/${MANIFEST_NAME} &> ${PUPPET_LOGS}
EOF
    chmod +x "${PATH_TO_SCRIPT_FOR_CRON}"
  fi
}


function check-command-exists() {
  type "${1}" &> /dev/null;
}


function install-modules-and-run-puppet {
  if ! check-command-exists puppet; then
    apt update;
    apt "${APT_ARGS}" install "${PACKAGES_TO_INSTALL}";
    for module in ${MODULES_TO_INSTALL}; do
      puppet module install "${module}"
    done
  fi
  puppet apply "${PUPPET_APPLY_ARGS[@]}" "${PATH_TO_MANIFESTS}"/"${MANIFEST_NAME}"
}


check-root
check-manifest-exist "${MANIFEST_NAME}"
create-script-for-cron "${PATH_TO_SCRIPT_FOR_CRON}"
install-modules-and-run-puppet

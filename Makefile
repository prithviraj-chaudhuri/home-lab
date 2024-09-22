install-k3s:
	ansible-playbook playbooks/k3s.yml -i playbooks/hosts.yml

uninstall-k3s:
	ansible-playbook playbooks/uninstall-k3s.yml -i playbooks/hosts.yml

install-portainer:
	ansible-playbook playbooks/portainer.yml -i playbooks/hosts.yml
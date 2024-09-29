install-k3s:
	ansible-playbook playbooks/k3s.yml -i playbooks/hosts.yml

uninstall-k3s:
	ansible-playbook playbooks/uninstall-k3s.yml -i playbooks/hosts.yml

setup:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml
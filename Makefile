setup:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml ---skip-tags "github-runner"

runner:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml --tags "github-runner"
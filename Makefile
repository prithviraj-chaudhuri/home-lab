setup:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml --skip-tags "github-runner,tunnel"

tag-%:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml --tags "$*"

runner:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml --tags "github-runner"

ssh-gemini:
	ssh -t ansible-user@eq01.prithvirajchaudhuri.com "sudo docker exec -it gemini-cli /bin/bash"

ssh:
	ssh ansible-user@eq01.prithvirajchaudhuri.com
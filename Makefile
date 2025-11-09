setup:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml --skip-tags "github-runner,tunnel"

tag-%:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml --tags "$*"

runner:
	ansible-playbook playbooks/setup.yml -i playbooks/hosts.yml --tags "github-runner"

ssh-gemini:
	ssh -i secrets/ssh-keys/ansible-user.controller.key -t ansible-user@eq-01.pi.hole "sudo docker exec -it gemini-cli /bin/bash"

ssh:
	ssh -i secrets/ssh-keys/ansible-user.controller.key ansible-user@eq-01.pi.hole
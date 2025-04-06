# Home Lab Setup

This repository contains Ansible playbooks and configurations to set up and manage services for your homelab. The playbooks automate the deployment of various services like Traefik, Portainer, Pi-hole, FileBrowser, GitHub Runner, and more.

## Prerequisites

Before running the playbooks, ensure the following prerequisites are met:

1. **Ansible Installed**:
   - Install Ansible on your local machine or control node.
   - For Ubuntu:
     ```bash
     sudo apt update
     sudo apt install ansible -y
     ```

2. **SSH Access**:
   - Ensure SSH access is configured for the target machine(s).
   - Add the private key to the `secrets/ssh-keys/` directory (e.g., `ansible-user.controller.key`).

3. **Docker Installed**:
   - Docker must be installed on the target machine(s). The playbooks include a role to install Docker if it's not already installed.

4. **Network Configuration**:
   - Ensure the `traefik` network is created as an external Docker network:
     ```bash
     docker network create traefik
     ```

5. **Environment Variables**:
   - Add required secrets and environment variables to the `secrets/` directory (e.g., `.env` files for services).

## Repository Structure

- **`playbooks/`**: Contains the main Ansible playbooks and roles.
- **`roles/`**: Contains individual roles for each service (e.g., Traefik, Portainer, Pi-hole).
- **`files/`**: Contains configuration files and Docker Compose files for services.
- **`secrets/`**: Contains sensitive files like `.env` files and SSH keys.

## Setup Instructions

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/prithviraj-chaudhuri/home-lab.git
cd home-lab
```

### 2. Configure Inventory

Edit the playbooks/hosts.yml file to define your target machines. Example:
```controllers:
  hosts:
    EQ-homelab-01:
      ansible_host: 10.0.0.163
      ansible_ssh_private_key_file: ansible-user.controller.key
```

### 3. Add Secrets
Place the required secrets in the `secrets/` directory. For example:

`secrets/.env` for environment variables.
`secrets/ssh-keys/` for SSH keys.

### 4. Setup GitHub Runner

1. **Get GitHub Runner Token**:
    - Go to your GitHub repository
    - Navigate to `Settings > Actions > Runners`
    - Click `New self-hosted runner`
    - Copy the registration token

2. **Configure Runner**:
    Create `playbooks/files/github-runner/secrets/.env`:
      ```
        RUNNER_TOKEN=
        RUNNER_URL=
        RUNNER_NAME=
      ```

3. **Deploy Runner**:
    ```
    make runner
    ```

    This will deploy a self-hosted GitHub runner using the token and repository configured in the environment file.

### 5. Github Action

The repository includes a GitHub Action workflow that automatically deploys all services when changes are pushed to the main branch.

1. **Workflow Details**:
    - Triggers on push to main branch
    - Uses self-hosted runner
    - Runs Ansible playbooks to deploy services

2. **Manual Trigger**:
    - Go to `Actions` tab in repository
    - Select `Deploy Services` workflow
    - Click `Run workflow`

3. **Monitor Deployment**:
    - Check workflow status in Actions tab
    - Review logs for any errors
    - Verify services are running after completion

### 6. Verify Services
After running the playbooks, verify that the services are running:

* Homepage: https://homepage.eq-01.pi.hole
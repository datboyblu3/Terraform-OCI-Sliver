# SATO: Automated Sliver Beacon Deployment in OCI

## Overview
This proof of concept (PoC) demonstrates the automation of red team infrastructure provisioning in Oracle Cloud Infrastructure (OCI) using Terraform and Ansible. The deployment facilitates the rapid creation of adversary-simulated environments by provisioning multiple compute instances and executing Sliver beacons.

## Purpose
The goal of this PoC is to provide red teams and penetration testers with an automated approach to deploying command and control (C2) infrastructure. By leveraging Infrastructure as Code (IaC) principles, this setup allows for:
- **Scalable and repeatable** red team operations.
- **Automated provisioning** of cloud-based attack infrastructure.
- **Stealthy deployments** by dynamically spinning up and destroying attacker-controlled assets.
- **Operational efficiency**, reducing the manual effort required to set up C2 infrastructure.
- **CI/CD pipeline compromise**, enabling deeper attacks within trusted environments.

## OCI Shapes Overview

Oracle OCI Compute Shapes define the hardware specifications for virtual machines and bare metal instances in Oracle Cloud Infrastructure (OCI). These shapes determine the number of CPUs, memory, network bandwidth, and storage configurations available for compute instances. 
Go here for the official [OCI Compute Shape documentation](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm#vm-standard).

### **Types of OCI Compute Shapes:**
1. **Standard Shapes** – General-purpose instances with balanced CPU and memory.
2. **Dense I/O Shapes** – Optimized for high-performance workloads with local NVMe storage.
3. **GPU Shapes** – Equipped with NVIDIA GPUs for machine learning and AI workloads.
4. **High Performance Computing (HPC) Shapes** – Designed for computationally intensive tasks.
5. **Optimized Shapes** – Customizable CPU and memory allocations for specific workloads.

These shapes allow users to tailor their cloud infrastructure based on workload requirements, whether for general computing, high-speed storage, or AI-based processing. Below are some of the "standard" shapes used in OCI. These shapes will be the most cost effective.

If you have purview into the workspace, build your beach head based off the image(s) used in the OCI environment.

| Shape               | OCPU                | Memory (GB)            | Local Disk    | 
| :---                |    :----:           |          ---:          | :---          |    
| VM.Standard3        | 1 min, 32 max       | 1 GB min, 512 GB max   | Block Storage | 
| VM.Standard.E4.Flex | 1 min, 64 max       | 1 GB min, 1024 GB max  | Block Storage |
| VM.Standard.E5.Flex | 1 min, 94 max       | 1 GB min, 1049 GB max  | Block Storage |
| VM.Standard.A1.Flex | 1 min, 78 max       | 1 GB min, 946 GB max   | Block Storage | 

## Requirements
- [OCI Account](https://signup.oraclecloud.com/)
- [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Generate SSH keypair to access the OCI compute instances and resources:
```go
ssh-keygen -t RSA -b 4096 -f ~/.ssh/oci_key
```

## Deployment Instructions

1. Clone the repository and change into the directory

```go
https://github.com/datboyblu3/Terraform-OCI-Sliver
cd Terraform-OCI-Sliver
```

2. Initialize Terraform to configure the OCI provider
```go
terraform init
```

3. Create the Terraform deployment. This will display what changes will be made
```go
terraform plan
```

4. Apply the plan to deploy your OCI infrastructure
```go
terraform apply --auto-approve
```

### Default Login

Once the OCI instance has been fully deployed and provisioned, attempt to SSH into it with the default username: `opc`, like so:
```go
ssh -i ~/.ssh/oci_key opc@COMPUTE_INSTANCE_IP
```

## Ansible 

*Hint:* Install [`prettier`](https://prettier.io/) to auto format your Ansible playbooks. This will ensure your playbooks are syntatically correct and save you a TON of headaches!

DigitalOcean has a thorough Ansible tutorial series that with some helpful commands that can assist you in trouble shooting, configuration management etc:  [How To Manage Remote Servers with Ansible](https://www.digitalocean.com/community/tutorial-series/how-to-manage-remote-servers-with-ansible)


Test Ansible playbook
```go
ansible-playbook get_stager.yml --ask-become-pass
```



## SliverC2 Commands

Tutorial Series: **[Sliver.sh](https://sliver.sh/)**

Sliver C2 is an open-source command and control (C2) framework developed by BishopFox. It is designed for adversary emulation, red teaming, and penetration testing. Sliver provides features similar to other C2 frameworks like Cobalt Strike and Metasploit, but it is particularly popular for its flexibility, modularity, and support for multiple operating systems.

### **Key Features of Sliver C2:**
- **Cross-platform Support:** Works on Windows, Linux, and macOS.
- **Multiple Communication Channels:** Uses HTTP, HTTPS, DNS, and Mutual TLS (mTLS) for covert communication.
- **Built-in Payload Generation:** Allows easy deployment of implants (beacons) in various formats.
- **Multi-user Support:** Supports team-based operations.
- **Dynamic Evasion Techniques:** Includes features to bypass endpoint detection and response (EDR) solutions.
- **Extensibility:** Can be customized with Golang for additional functionalities.




## Troubleshooting Tips

### Troubleshooting Terraform

### Troubleshooting Ansible

### Troubleshooting OCI

### Troubleshooting Sliver



---
**Disclaimer:** This project is for educational and research purposes only. Unauthorized use in production or external environments is strictly prohibited.

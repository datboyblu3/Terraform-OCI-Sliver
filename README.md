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

If you have purview into the workspace, build your beach head based off the image(s) used in the OCI environment
| Shape       | OCPU        | Local Disk    |
| :---        |    :----:   |          ---: |
| Header      | Title       | Here's this   |
| Paragraph   | Text        | And more      |

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
cd 
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
````

## Ansible 

## SliverC2 Commands

Sliver C2 is an open-source command and control (C2) framework developed by BishopFox. It is designed for adversary emulation, red teaming, and penetration testing. Sliver provides features similar to other C2 frameworks like Cobalt Strike and Metasploit, but it is particularly popular for its flexibility, modularity, and support for multiple operating systems.

### **Key Features of Sliver C2:**
- **Cross-platform Support:** Works on Windows, Linux, and macOS.
- **Multiple Communication Channels:** Uses HTTP, HTTPS, DNS, and Mutual TLS (mTLS) for covert communication.
- **Built-in Payload Generation:** Allows easy deployment of implants (beacons) in various formats.
- **Multi-user Support:** Supports team-based operations.
- **Dynamic Evasion Techniques:** Includes features to bypass endpoint detection and response (EDR) solutions.
- **Extensibility:** Can be customized with Golang for additional functionalities.


---
**Disclaimer:** This project is for educational and research purposes only. Unauthorized use in production or external environments is strictly prohibited.


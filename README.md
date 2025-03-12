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

## Key Components
1. **Terraform**
   - Deploys multiple OCI compute instances.
   - Automates network configurations and provisioning.
   - Ensures infrastructure consistency and repeatability.

2. **Ansible**
   - Remotely executes post-provisioning tasks on OCI instances.
   - Downloads and executes Sliver beacons on target hosts.
   - Enables modular and scalable attack automation.

3. **Sliver C2**
   - An open-source adversary simulation and C2 framework.
   - Used for deploying and managing beacons on compromised systems.
   - Enables real-world attack emulation for cybersecurity assessments.

4. **CI/CD Pipeline Compromise**
   - Provisioned machines allow attackers to access and manipulate the CI/CD pipeline.
   - Enables tampering with deployment workflows to introduce malicious artifacts.
   - Facilitates persistence by leveraging trusted infrastructure for further compromise.

## Attack Chain
1. **Initial Deployment**
   - Terraform provisions OCI instances.
   - Ansible executes Sliver beacons, establishing C2 communication.

2. **CI/CD Pipeline Access**
   - Exploitation of misconfigured or exposed credentials.
   - Lateral movement within the pipeline environment.

3. **Workflow Manipulation**
   - Injecting malicious code or artifacts into trusted deployment processes.
   - Establishing persistence through legitimate build systems.

4. **Infrastructure Expansion**
   - Deploying additional machines within the trusted environment.
   - Scaling attack operations without triggering traditional alerts.

## Benefits
- **Time-efficient**: Reduces setup time for red team engagements.
- **Cloud-native**: Leverages OCI’s infrastructure for cost-effective, scalable operations.
- **Automated adversary emulation**: Enhances penetration testing realism.
- **Flexible and customizable**: Easily integrates with other attack frameworks.
- **Trusted Execution**: Exploits the inherent trust of CI/CD pipelines to deploy malicious workloads undetected.

## Usage Considerations
- This PoC is strictly for ethical red teaming and penetration testing within authorized environments.
- Ensure compliance with organizational and legal guidelines before deployment.
- Follow cloud provider terms of service regarding offensive security testing.

## Future Enhancements
- Integrate additional evasion techniques to improve stealth.
- Expand cloud provider support (AWS, Azure, GCP).
- Automate teardown procedures for quick cleanup.
- Enhance CI/CD attack techniques with advanced persistence mechanisms.

---
**Disclaimer:** This project is for educational and research purposes only. Unauthorized use in production or external environments is strictly prohibited.


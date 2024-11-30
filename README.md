# SmartInfraOps



## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [NextSteps](#nextsteps)
- [Contributing](#contributing)
- [License](#license)

## Introduction

SmartInfraOps is a robust automation framework designed to streamline infrastructure provisioning and configuration management using Terraform and Ansible. This project harnesses the power of Infrastructure as Code (IaC) principles, enabling users to efficiently create, manage, and configure cloud resources in a seamless and repeatable manner.

## Features

- Infrastructure Provisioning: Use Terraform to define and provision scalable cloud infrastructure across various providers.
- Configuration Management: Leverage Ansible for automating application deployment and configuration on the provisioned resources.
- Modular Design: Organize your Terraform and Ansible scripts into reusable modules for enhanced maintainability and collaboration.
- Seamless Integration: Effortlessly integrate Terraform and Ansible workflows for a streamlined DevOps process.
- Environment Consistency: Ensure consistent environments across development, testing, and production with automated provisioning and configuration.

## Installation

Step-by-step instructions on how to install and set up the project:
1. Clone the repository: `git clone https://github.com/Gani-23/SmartInfraOps.git`
2. Navigate to the project directory: `cd SmartInfraOps/Terraform/`
3. Install dependencies: `terraform init`
4. Validate Configuration: `terraform validate`
5. Create Architeture plan: `terraform plan`
6. Execute to deploy resources: `terraform apply` and click yes


## NextSteps

Instructions to run ansible:
1. Make sure you did install ansible in your system
2. Make sure .PEM file in the same directory

3. `Note: .PEM file is a key that you use to connect instance`

4. Right after then you need to execute files in this very manner to executes commands 

5. ```ansible-playbook -i inventory.ini GroupUpdate.yml ```
6. ```ansible-playbook -i inventory.ini Backend.yml ```
7. ```ansible-playbook -i inventory.ini Frontend.yml ```
8. ```ansible-playbook -i inventory.ini mongodb.yml ```



## Contributing

Guidelines for contributing to the project:
1. Fork the repository
2. Create a new branch: `git checkout -b feature-branch`
3. Make your changes and commit them: `git commit -m 'Add new feature'`
4. Push to the branch: `git push origin feature-branch`
5. Submit a pull request

## License

Include the license under MIT is distributed.

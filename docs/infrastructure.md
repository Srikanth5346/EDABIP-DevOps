\# EDABIP AWS Infrastructure Approach



\## 1. Objective



The EDABIP AWS infrastructure is designed to provide a controlled, scalable and secure environment for hosting the application components and supporting services.



The infrastructure approach separates networking, application compute, database services, container image management, access control and monitoring responsibilities.



\---



\## 2. High-Level Infrastructure



The proposed AWS infrastructure consists of:



\- Amazon VPC

\- Public and private subnets

\- Internet Gateway

\- Route Tables

\- Security Groups

\- Application Load Balancer

\- Amazon EC2

\- Amazon RDS for MySQL

\- Amazon ECR

\- AWS IAM

\- Amazon CloudWatch



\---



\## 3. Network Architecture



Amazon VPC provides the logical network boundary for EDABIP AWS resources.



The VPC is divided into appropriate subnets based on resource requirements.



Public-facing components can be placed in public subnets where required.



Application and database components should be placed in appropriately restricted network segments.



Route tables control traffic flow between the relevant network components.



An Internet Gateway provides internet connectivity for resources that require it.



\---



\## 4. Application Load Balancer



The Application Load Balancer acts as the centralized application entry point.



The ALB receives application traffic and routes requests to healthy application targets.



Health checks are used to determine whether application targets are available.



The load balancer also provides a controlled entry point for application traffic rather than exposing application instances directly wherever possible.



\---



\## 5. Application Compute



Amazon EC2 is used as the application compute layer in the documented deployment approach.



The application workloads can be deployed to EC2 instances using the approved deployment mechanism.



The compute layer hosts the application components required for the EDABIP deployment.



\---



\## 6. Database



Amazon RDS for MySQL is used as the managed database service in the documented AWS approach.



The database should not be directly exposed to the public internet.



Database access should be restricted to the application layer through appropriate security-group rules and network controls.



\---



\## 7. Container Image Management



Amazon ECR can be used as the container image repository.



Application Docker images are built through the CI/CD process and pushed to the appropriate ECR repository.



Only approved application images should be used for deployment.



\---



\## 8. IAM



AWS IAM is used to control access to AWS resources.



The implementation should follow least-privilege principles.



Permissions should be granted only to the users, roles and services that require them.



AWS credentials and access keys must not be stored in source code repositories.



\---



\## 9. Security Groups



Security groups provide network-level access control.



The intended communication pattern is:



Internet

&#x20;   ↓

Application Load Balancer

&#x20;   ↓

Application EC2

&#x20;   ↓

RDS MySQL



Only required ports and communication paths should be allowed.



Database access should be restricted to the application security boundary.



\---



\## 10. Monitoring



Amazon CloudWatch is used for AWS monitoring and alerting.



Monitoring should include relevant:



\- EC2 metrics

\- ALB metrics

\- Application logs

\- Database health

\- Availability indicators

\- Operational alarms



CloudWatch Logs can be used for centralized collection of application and infrastructure logs.



\---



\## 11. Infrastructure as Code



Terraform is intended to provide Infrastructure as Code for the AWS infrastructure where adopted.



Terraform configuration should be maintained in version control.



Infrastructure changes should be reviewed before being applied to the target environment.



The Terraform structure should support reusable modules for the required AWS components.



\---



\## 12. Environment Management



Environment-specific configuration should be separated from application source code.



Configuration and secrets should be managed securely.



Development, testing and production environments should be isolated according to project requirements.



\---



\## 13. Cost Management



AWS resources used for testing should be monitored and terminated when they are no longer required.



Unused EC2, RDS, load balancer and other billable resources should not be left running after testing.



Resource utilization should be reviewed regularly to identify unnecessary cost.



\---



\## 14. Infrastructure Principles



The EDABIP infrastructure approach follows these principles:



\- Secure network boundaries

\- Least-privilege access

\- Managed database services where applicable

\- Controlled application entry points

\- Version-controlled infrastructure

\- Repeatable provisioning

\- Monitoring and logging

\- Environment separation

\- Cost awareness


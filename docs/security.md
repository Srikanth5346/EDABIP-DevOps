\# EDABIP Security Approach



\## 1. Objective



The EDABIP security approach is designed to protect application data, infrastructure, credentials and access to AWS resources.



Security controls are applied across source control, network infrastructure, application deployment, database access and AWS services.



\---



\## 2. IAM



AWS Identity and Access Management (IAM) is used to control access to AWS resources.



The implementation follows the principle of least privilege.



Users, roles and services should receive only the permissions required to perform their responsibilities.



Root account access should not be used for routine operational activities.



\---



\## 3. Source Code Security



The EDABIP source repository should be maintained with controlled access.



Security practices include:



\- Private repository access

\- Pull Request-based changes

\- Code review

\- Controlled branch access

\- Protection of sensitive configuration

\- No credentials committed to Git



\---



\## 4. Secrets Management



Sensitive information must not be stored directly in source code.



Examples of sensitive information include:



\- Database passwords

\- AWS credentials

\- API keys

\- SSH private keys

\- Application secrets

\- Authentication tokens



Secrets should be provided through secure configuration or an appropriate AWS secrets-management mechanism.



\---



\## 5. Network Security



The AWS infrastructure should use a VPC as the primary network boundary.



Security groups should restrict communication between application components.



Only required ports and protocols should be permitted.



The intended communication flow is:



Internet

&#x20;   ↓

Application Load Balancer

&#x20;   ↓

Application Layer

&#x20;   ↓

Database



The database should not be directly exposed to the public internet.



\---



\## 6. Security Groups



Security groups should follow a least-access approach.



Application access should be allowed only through the required application entry point.



Backend communication should be restricted to required sources.



Database access should be limited to the application layer.



Unnecessary inbound ports must remain closed.



\---



\## 7. Database Security



The MySQL database should be protected from direct public access.



Database credentials must be securely managed.



Database access should be restricted through network controls and security groups.



Only authorized application components should be able to connect to the database.



\---



\## 8. EC2 Security



EC2 instances should be accessible only to authorized users and approved automation processes.



SSH access should be restricted.



SSH private keys must not be committed to GitHub.



The EC2 operating system and installed packages should be maintained using an appropriate patching process.



\---



\## 9. Container Security



Docker images should be built from controlled source code.



Images should be scanned for known vulnerabilities where security scanning is available.



Only approved images should be deployed.



Container credentials and secrets must not be embedded directly into Docker images.



\---



\## 10. CI/CD Security



Security checks should be included in the CI/CD lifecycle.



The pipeline should:



\- Validate dependencies

\- Perform applicable security scans

\- Protect deployment credentials

\- Avoid exposing secrets in logs

\- Restrict deployment permissions

\- Deploy only validated application versions



\---



\## 11. HTTPS



HTTPS should be used for external application communication where TLS termination is configured.



The Application Load Balancer can provide the controlled entry point for secure application traffic.



Certificates should be managed using an appropriate AWS certificate-management mechanism where applicable.



\---



\## 12. Logging and Auditing



Security-relevant activities should be logged where supported.



Operational logs should be monitored to identify:



\- Unauthorized access attempts

\- Application errors

\- Infrastructure failures

\- Authentication-related issues

\- Unexpected operational activity



\---



\## 13. Security Monitoring



Security and operational monitoring should be integrated with the monitoring approach.



Relevant CloudWatch metrics, logs and alarms should be reviewed regularly.



Security issues identified during monitoring should be investigated and remediated.



\---



\## 14. Security Responsibilities



The DevOps team is responsible for:



\- Maintaining IAM controls.

\- Managing infrastructure security groups.

\- Protecting deployment credentials.

\- Maintaining secure CI/CD configuration.

\- Supporting vulnerability scanning.

\- Protecting database access.

\- Supporting secure EC2 access.

\- Monitoring security-related operational events.

\- Reviewing and improving security controls.



\---



\## 15. Security Principles



The EDABIP DevOps implementation follows:



\- Least privilege

\- Defense in depth

\- Secure credential management

\- Restricted network access

\- Private database access

\- Controlled deployment access

\- Secure source-code management

\- Vulnerability awareness

\- Monitoring and auditing


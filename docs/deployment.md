\# EDABIP Deployment Approach



\## 1. Objective



The EDABIP deployment approach defines how validated application versions are transferred from the CI/CD process into the target AWS environment.



The deployment process is intended to be repeatable, controlled and recoverable.



\---



\## 2. Deployment Flow



The high-level deployment flow is:



Developer

&#x20;   ↓

GitHub

&#x20;   ↓

CI/CD Pipeline

&#x20;   ↓

Validation and Testing

&#x20;   ↓

Docker Image Build

&#x20;   ↓

Container Image Repository

&#x20;   ↓

Deployment Approval

&#x20;   ↓

AWS EC2

&#x20;   ↓

Docker Compose

&#x20;   ↓

Nginx

&#x20;   ↓

Application

&#x20;   ↓

Post-Deployment Validation



\---



\## 3. Application Deployment



The application components are packaged using Docker where containerized deployment is adopted.



The deployment target is an AWS EC2 environment.



Docker Compose can be used to manage the application containers on the EC2 host.



The deployment process should ensure that the required application configuration and environment variables are available securely.



\---



\## 4. Frontend Deployment



The frontend application is built using the approved CI/CD process.



The validated frontend application is packaged into its deployment image or build output.



Nginx can be used as the web server and application entry point for the frontend.



The deployment process should verify that the frontend is accessible after deployment.



\---



\## 5. Backend Deployment



The backend application is deployed as a containerized application where Docker deployment is adopted.



The backend container exposes the required API service internally or through the appropriate application routing layer.



The deployment process should verify:



\- Backend container status

\- API availability

\- Application logs

\- Database connectivity



\---



\## 6. Database Connectivity



The application backend connects to the configured MySQL database.



Database credentials must not be hard-coded into the application source code.



The required database configuration should be supplied securely through the deployment environment.



Database connectivity must be validated after deployment.



\---



\## 7. Nginx



Nginx can act as the frontend web server and controlled application entry point.



It can serve the frontend application and route required requests according to the deployment configuration.



Nginx configuration should be maintained in version control where practical.



\---



\## 8. EC2 Deployment



The EC2 instance provides the compute environment for the application deployment.



The deployment process can use controlled SSH-based access for deployment automation where this is the approved deployment mechanism.



The EC2 host should have the required Docker runtime and deployment configuration.



\---



\## 9. Deployment Validation



After deployment, the following checks should be performed:



\- EC2 instance health

\- Docker container status

\- Frontend availability

\- Backend API availability

\- Database connectivity

\- Nginx status

\- Application logs

\- Relevant CloudWatch metrics



A deployment should only be considered successful after the required validation checks pass.



\---



\## 10. Failed Deployment



If deployment validation fails:



1\. Identify the failed application component.

2\. Review application and infrastructure logs.

3\. Check container status.

4\. Check database connectivity.

5\. Check network and security-group configuration.

6\. Determine whether the issue is configuration, application or infrastructure related.

7\. Roll back to the previous known-good application version if required.



\---



\## 11. Rollback



Rollback should restore the previously validated application version.



For containerized deployment, the previous approved image can be redeployed.



The rollback process should then verify:



\- Application availability

\- Frontend functionality

\- Backend API availability

\- Database connectivity

\- Application logs



\---



\## 12. Deployment Security



Deployment credentials must be protected.



SSH keys, cloud credentials, database passwords and other sensitive values must not be committed to GitHub.



Access should be limited to authorized users and automation processes.



The deployment process should follow least-privilege principles.



\---



\## 13. Deployment Principle



The deployment approach follows these principles:



\- Repeatable deployments

\- Version-controlled configuration

\- Automated validation

\- Secure credentials

\- Minimal manual intervention

\- Health verification

\- Controlled rollback

\- Monitoring after deployment


\# EDABIP CI/CD Workflow



\## 1. Objective



The objective of the EDABIP CI/CD workflow is to automate application validation, testing, security checks, build activities, and deployment while ensuring that only successfully validated changes progress toward deployment.



The workflow is designed to reduce manual activities and identify application issues early in the delivery lifecycle.



\---



\## 2. Source Code Management



GitHub is used as the central source-code repository for EDABIP.



The repository is maintained as a private repository and access is provided only to authorized project members.



A branch-based development approach is followed.



Feature branches are used for new functionality, while hotfix branches are used for urgent fixes or production-related corrections.



Changes are reviewed through Pull Requests before integration into the appropriate stable branch.



\---



\## 3. CI/CD High-Level Flow



The EDABIP CI/CD workflow is:



GitHub

&#x20;   ↓

Pull Request / Code Review

&#x20;   ↓

Source Validation

&#x20;   ↓

Frontend CI

&#x20;   ↓

Backend CI

&#x20;   ↓

Security Checks

&#x20;   ↓

Application Build

&#x20;   ↓

Deployment Approval

&#x20;   ↓

Deployment

&#x20;   ↓

Post-Deployment Validation

&#x20;   ↓

Monitoring

&#x20;   ↓

Rollback if Required



\---



\## 4. Frontend Continuous Integration



The EDABIP frontend is implemented using React and Vite.



The frontend CI process will perform:



\- Dependency installation

\- Source validation

\- Automated testing where configured

\- Production build

\- Build artifact validation



A frontend build failure will stop the pipeline from progressing toward deployment.



\---



\## 5. Backend Continuous Integration



The EDABIP backend is implemented using Python and FastAPI.



The backend CI process will perform:



\- Python dependency installation

\- Source-code validation

\- Automated tests

\- Dependency validation

\- Security checks where configured



A backend validation or test failure will stop the affected pipeline from progressing toward deployment.



\---



\## 6. Security Validation



Security validation is incorporated into the CI/CD workflow.



The pipeline should perform appropriate application dependency and security checks before deployment.



Critical security findings should be reviewed and resolved or formally accepted according to the project's security process before deployment.



Sensitive credentials must not be stored directly in the source repository.



\---



\## 7. Build Stage



After successful validation and testing, the application is built or packaged for deployment.



The build process produces the required deployable output for the frontend and backend components.



A failed build stops the pipeline and prevents the affected application version from progressing toward deployment.



\---



\## 8. Container Image Management



Where containerized deployment is used, Docker images are built after successful application validation and testing.



The images are tagged using an identifiable application version or release identifier.



Amazon ECR can be used as the AWS container image repository.



The CI/CD process can:



1\. Build the Docker image.

2\. Perform required security checks.

3\. Authenticate to Amazon ECR.

4\. Tag the image.

5\. Push the image to the appropriate ECR repository.

6\. Use the approved image for deployment.



Previously validated images should be retained according to the image lifecycle policy to support rollback.



\---



\## 9. Deployment Approval



After successful CI, testing, security validation, and build activities, the application proceeds to deployment according to the project's approval process.



For the current POC, deployment may involve manual approval or controlled deployment activities.



\---



\## 10. Deployment



The deployment process updates the application components using the approved application version or container image.



The deployment process must maintain controlled configuration and secure access to the target environment.



Application connectivity with the database must be validated as part of deployment verification.



\---



\## 11. Post-Deployment Validation



After deployment, the DevOps team should verify:



\- Application instance status

\- Application process status

\- Frontend accessibility

\- Backend API availability

\- Backend-to-database connectivity

\- ALB target health where configured

\- Application logs

\- Relevant CloudWatch metrics



Any critical deployment issue should be investigated before the release is considered successful.



\---



\## 12. Rollback



If the newly deployed application version causes critical issues, the deployment should be rolled back to the previous known-good version.



For containerized deployment, the previous validated container image can be used for rollback.



After rollback, application health and service availability must be validated.



\---



\## 13. Monitoring



Following successful deployment, the application and supporting AWS infrastructure are monitored.



Amazon CloudWatch is used as the primary AWS monitoring and alerting service.



Monitoring can include:



\- EC2 metrics

\- Application Load Balancer metrics

\- Application logs

\- Database health

\- Application availability

\- Relevant application metrics



\---



\## 14. CI/CD Responsibilities



The DevOps team is responsible for:



\- Maintaining CI/CD workflows.

\- Managing build and deployment automation.

\- Maintaining source-code integration controls.

\- Supporting security checks.

\- Managing container image repositories.

\- Maintaining deployment procedures.

\- Supporting post-deployment validation.

\- Maintaining rollback procedures.

\- Monitoring deployment health.


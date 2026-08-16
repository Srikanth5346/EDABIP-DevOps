\# EDABIP Architecture



\## 1. Project Architecture



EDABIP is an Enterprise Data Analytics \& Business Intelligence Platform designed as a scalable SaaS / Enterprise Analytics Platform.



The EDABIP SRS defines five primary architecture layers:



1\. Data Sources

2\. Data Integration

3\. Data Warehouse

4\. Analytics

5\. Presentation



Each layer is intended to support independent scalability and high availability.



\## 2. Application Architecture



From the DevOps implementation perspective, the application consists of:



\- Frontend application

\- Backend API

\- Database layer



The frontend is implemented using React and Vite.



The backend is implemented using Python and FastAPI.



The backend uses SQLAlchemy for database interaction and PyMySQL for MySQL connectivity.



Alembic is used to support database schema migration management.



\## 3. High-Level Flow



Data Sources

&#x20;   ↓

Data Integration / ETL

&#x20;   ↓

Data Warehouse

&#x20;   ↓

Analytics

&#x20;   ↓

Presentation



The application delivery architecture is supported by the following application components:



Frontend

&#x20;   ↓

Backend API

&#x20;   ↓

MySQL Database



\## 4. DevOps Infrastructure Direction



The documented AWS deployment approach uses:



\- AWS VPC

\- Subnets

\- Route Tables

\- Internet Gateway

\- Security Groups

\- Amazon EC2

\- Amazon RDS for MySQL

\- Application Load Balancer

\- Amazon ECR

\- IAM

\- Amazon CloudWatch

\- CloudWatch Logs



The Application Load Balancer acts as the centralized application entry point and routes traffic to healthy application targets.



The frontend and backend workloads are hosted in the application compute environment, while the database is maintained using Amazon RDS for MySQL.



\## 5. Security Boundaries



The AWS architecture uses security groups to control communication between application components.



Application instances should receive application traffic through the appropriate load-balancer/application security boundary rather than exposing unnecessary direct internet access.



Database access should be restricted to the application layer.



IAM is used to control access to AWS resources according to least-privilege principles.



\## 6. DevOps Architecture Principle



The infrastructure and application deployment should be automated as much as practical through version-controlled configuration, CI/CD automation, containerization, monitoring, security controls and rollback procedures.


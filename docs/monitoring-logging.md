\# EDABIP Monitoring and Logging Approach



\## 1. Objective



The EDABIP monitoring and logging approach provides visibility into application, infrastructure and database health.



Monitoring is used to identify failures, performance issues, resource utilization problems and operational abnormalities.



Logging provides information required for troubleshooting application and infrastructure issues.



\---



\## 2. Monitoring Service



Amazon CloudWatch is used as the primary AWS monitoring and alerting service.



CloudWatch provides:



\- Metrics

\- Logs

\- Alarms

\- Dashboards



\---



\## 3. EC2 Monitoring



EC2 monitoring should track relevant infrastructure metrics including:



\- CPU utilization

\- Network activity

\- Instance health

\- Disk utilization where applicable

\- Application process health



Thresholds should be defined for important resource conditions.



\---



\## 4. Application Monitoring



Application monitoring should verify:



\- Frontend availability

\- Backend API availability

\- Application response health

\- Container status

\- Application errors

\- Database connectivity



Health checks should be used where supported.



\---



\## 5. Application Load Balancer Monitoring



Where an Application Load Balancer is configured, relevant ALB metrics should be monitored.



Monitoring should include:



\- Target health

\- Request activity

\- HTTP error conditions

\- Backend target availability



Unhealthy targets should generate operational alerts where appropriate.



\---



\## 6. Database Monitoring



The RDS MySQL environment should be monitored for relevant database health indicators.



Monitoring can include:



\- Database availability

\- CPU utilization

\- Storage utilization

\- Database connections

\- Relevant performance indicators



Database monitoring helps identify resource and connectivity issues before they affect application availability.



\---



\## 7. Logging



Application and infrastructure logs should be collected and retained according to the project's operational requirements.



Logs may include:



\- Frontend/Nginx logs

\- Backend application logs

\- Docker container logs

\- EC2 system logs

\- Application Load Balancer logs where configured

\- Database-related operational logs where available



CloudWatch Logs can be used for centralized AWS log collection.



\---



\## 8. CloudWatch Alarms



CloudWatch alarms should be configured for important operational conditions.



Examples include:



\- High EC2 CPU utilization

\- Unhealthy application targets

\- High error rates

\- Resource utilization thresholds

\- Application availability issues



Alerts should be routed to the appropriate operational notification mechanism.



\---



\## 9. Dashboards



A CloudWatch dashboard can provide a consolidated view of EDABIP infrastructure health.



The dashboard can include:



\- EC2 health

\- ALB health

\- Application metrics

\- Database metrics

\- Important alarms



\---



\## 10. Health Checks



Post-deployment health checks should validate:



1\. EC2 instance status.

2\. Docker container status.

3\. Frontend accessibility.

4\. Backend API availability.

5\. Database connectivity.

6\. ALB target health where configured.

7\. Application logs.

8\. CloudWatch metrics.



\---



\## 11. Troubleshooting Process



When an operational issue is detected:



1\. Check CloudWatch alarms.

2\. Review relevant metrics.

3\. Review application logs.

4\. Check Docker container status.

5\. Check EC2 health.

6\. Check ALB target health where applicable.

7\. Check database connectivity.

8\. Identify the root cause.

9\. Apply the required corrective action.

10\. Validate application health.



\---



\## 12. Monitoring Responsibilities



The DevOps team is responsible for:



\- Maintaining CloudWatch monitoring.

\- Maintaining relevant alarms.

\- Reviewing application and infrastructure logs.

\- Monitoring resource utilization.

\- Investigating alerts.

\- Supporting troubleshooting.

\- Validating application health after deployments.

\- Supporting incident recovery.


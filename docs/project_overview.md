\## DBA Light Enhancements



This project includes basic PostgreSQL administration practices, such as:



\- Creation of indexes to improve query performance

\- Use of views to simplify operational queries

\- Logical separation of schema objects

\- Focus on maintainability and readability



These practices reflect a real-world database administration approach suitable

for operational and support environments.



===============================================================================



\## Access Control (Roles and Permissions)



Basic role-based access control was implemented to reflect real-world

security practices. Distinct roles were created for read-only access

and operational users, following the principle of least privilege.

This approach improves security, maintainability, and auditability.



===============================================================================

\## Audit and Data Traceability



An audit mechanism was implemented using database triggers to track

changes to ticket records. This ensures traceability of updates,

supports compliance requirements, and reflects common practices

in enterprise database environments.



========================================================================================



\## SLA and Operational Metrics



Service Level Agreement (SLA) metrics were implemented to evaluate ticket

resolution performance. Resolution time is calculated at the database level,

and views provide SLA compliance percentage, site-based performance, and

MTTR (Mean Time To Resolve). These metrics support operational monitoring,

capacity planning, and service quality evaluation.






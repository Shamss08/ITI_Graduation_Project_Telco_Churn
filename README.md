# Customer Churn in Telecom Industry
## Problem Overview :
Customer churn, also known as customer attrition, occurs when a customer decides to stop using your products or services. Every business faces this challenge, but it’s typically more cost-effective to retain existing customers than to acquire new ones. Additionally, addressing issues before a customer leaves is usually easier and more successful than trying to win them back later. Building and maintaining customer loyalty is essential for any brand, and understanding and preventing churn is a key part of this process.
## Objectives:
   - Identifying what causes customer churn.
   - Finding areas for improvement in service.
   - Developing strategies to attract and keep more customers.
## Data Modeling :
1. Relational Modeling :
   - ERD :
     ![image](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/Data%20Modeling/ERD.png)
   - Mapping :
     ![image](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/Data%20Modeling/Mapping.png)
   - Database Creation Script : [Telco_Churn.SQL](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/Telco_Churn.sql)
   - Database Diagram : [DB Diagram](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/Data%20Modeling/DB_Final.png)
2. Dimensional Modeling(DWH) :
   - Snowflake Schema : [DWH Diagram](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/Data%20Modeling/DWH_Final.png)
   - DWH Creation Script : [Telco_Churn_DWH.SQL](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/Telco_Churn_DWH.sql)
## Extract Transform Load(ETL):
1. [Transfer Data From XLSX Source Files To Database](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/ETL-FROM-SRC-TO-DB.zip)
   - EX :
     <p align="middle">
        <img src="https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/ETL_Process/DB/contract.PNG" width="32%" />
        <img src="https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/ETL_Process/DB/InternetService.PNG" width="32%" /> 
     </p>
2. [Transfer Data From Database To Data Warehouse](https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/TelcoChurnDWH_ETL.zip)
   - EX :
     <p align="middle">
        <img src="https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/ETL_Process/DWH/Dim_Internet_Service.PNG" width="80%" />
        <img src="https://github.com/Shamss08/ITI_Graduation_Project_Telco_Churn/blob/main/ETL_Process/DWH/Fact_Charges.PNG" width="80%" />
     </p>
## Developing Analysis & Visualization System :
> Power BI Dashboard:
   - [Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiYThiZTA5ZDYtZWU1OC00NzNmLWJhZGUtYTRmNGYzZDMyOWJkIiwidCI6IjJhZDI5ZGJiLThjYzQtNDMxNy04NWVlLTM2Mjk2ZWRkZjI1NSJ9)
> Tableau Dashboard:
   - [Interactive Dashboard](https://public.tableau.com/app/profile/shams.khaled/viz/Graduation_Project/Dashboard1)

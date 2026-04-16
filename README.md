# Hospital Cost And Insurance Reimbursement Analysis Using Excel, SQL and Power BI
### Project Overview
This project analyzes real-world hospital cost and insurance reimbursement data to identify financial inefficiencies, revenue leakage, and high-risk diagnoses impacting hospital profitability.
The analysis is based on:

 - New York State hospital data submitted under Article 28 (covering 282 hospitals)
 - CMS Medicare Inpatient dataset (FY 2023) reflecting actual payments made by Medicare
   
By integrating clinical operations with reimbursement data, the project uncovers cost drivers, payment gaps, and financial risk patterns in hospital systems.

### Objective
  - Identify high-cost diagnoses and cost drivers
  - Evaluate alignment between treatment cost and insurance reimbursement
  - Quantify financial loss at both unit and aggregate levels
  - Detect high-risk and loss-making service lines
  - Provide actionable recommendations to improve financial performance
***
### Business Problem
**Where are hospitals losing money, and how can financial performance be optimized?**
Healthcare providers face several challenges:

- Rising treatment costs  
- Misaligned insurance reimbursements  
- Financial losses in specific diagnoses  

These issues create a gap between the cost of care and the payments received, requiring deeper diagnosis-level financial analysis.
***

### Objective
To identify:

  - Cost drivers across diagnoses
  - Reimbursement gaps between hospital cost and Medicare payment
  - High-risk and loss-making service lines

And provide data-driven, actionable recommendations to improve financial performance.
***
### Datasets
#### New York State Hospital Dataset (Operations)
**Source**: New York State Department of Health (Article 28 Hospitals)

**Coverage**: 282 hospitals

**Size**: 1M+ records

**Data Schema**
  - Diagnosis
  - Severity
  - Mean Cost
  - Mean Charge
  - Discharges
Provides clinical + operational insight, including severity impact
           
#### CMS Medicare Dataset (Insurance)
**Source**: Centers for Medicare & Medicaid Services (CMS)

**Coverage**: Inpatient hospital services

**Year**: Fiscal Year 2023
      
**Size**: 1M+ records

**Data Schema**
  - DRG Definition
  - Average Covered Charges
  - Average Medicare Payment
  - Total Discharges
Provides insurance reimbursement perspective
***
### Data Integration
A standardized mapping layer `Mapped_Diagnosis` was created to:
  - Align clinical diagnoses (NY dataset) with DRG groups (CMS dataset)
  - Enable direct comparison of hospital cost vs insurance payment
  - Support cross-dataset financial analysis
***
### Methodology
#### End-to-End Analytical Workflow
##### Excel
        - Data Cleaning
        - Column standardization
        - Creation of Mapped_Diagnosis
##### SQL
        - Data aggregation
        - Cost vs Payment calculations
        - Gap and risk analysis
##### Power BI
        - Dashboard development
        - KPI tracking
        - Insight visualization
***
### Key Analyses
#### Cost Analysis
- Average cost per diagnosis
- Cost distribution across severity levels
- High-cost treatment identification
#### Payment Analysis
- Average Medicare payment per diagnosis
- Charge vs payment comparison
- Under-reimbursed diagnoses
#### Gap Analysis
- Gap per case = Cost – Payment
- Total loss = Gap × Volume
- Identification of loss-making diagnoses

#### Risk Segmentation
- High cost + low payment
- High volume + moderate loss
- Profitable diagnoses (Payment > Cost)
***
### Key Insights
#### Cost Drivers
- Orthopedic, Psychiatric, and Sepsis show highest cost per patient
- Severity significantly increases cost (2–3x in extreme cases)
#### Reimbursement Gap
- Psychiatric and Orthopedic diagnoses are consistently under-reimbursed
- Payments (~$10K–$20K) are significantly lower than treatment charges
#### Loss per Patient
- Psychiatric → ~6.3K loss per case
- Orthopedic → ~3.8K loss per case
#### Business Impact (Total Loss)
- Psychiatric → ~6.2B loss
- Orthopedic → ~2.2B loss
- Others Combined → ~3.4B loss (volume-driven)
#### Profit Centers
- Heart Failure and Neurological Disorders show positive margins
- These diagnoses contribute to overall financial stability
***
### Financial Risk Concentration
Financial risk is not evenly distributed:
Concentrated in a few diagnoses:
- Psychiatric
- Orthopedic
- Sepsis
- Pneumonia

The “Others” category, despite low per-case loss, creates significant total impact due to extremely high volume

Severity analysis shows:
_Higher acuity → higher cost → increased financial risk_
***
### Recommendations
Cost Optimization- _Orthopedic and Psychiatric diagnoses should be prioritized for cost optimization due to high unit costs and negative margins. Severity-driven cost escalation highlights the need for acuity-based cost control strategies._
Reimbursement Optimization- _Psychiatric and Orthopedic diagnoses require reimbursement alignment, as Medicare payments consistently underrepresent actual treatment cost._
Volume-Driven Optimization- _High-volume diagnoses amplify financial impact.
Loss-making categories (Psychiatric, Orthopedic) increase losses at scale, while Heart Failure offsets losses through strong margins._
Strategic Growth-_Heart Failure and Neurological Disorders should be expanded due to positive contribution margins and financial sustainability._
Risk Monitoring- _Implement continuous tracking of: Gap per case,Total loss,Severity-based cost trends_
***
### Tools Used
- SQL (SQLite)
- DBeaver
- Power BI
- Excel (Data Cleaning & Mapping)
***
### Skills Demonstrated
- Healthcare domain analysis
- Data cleaning and preprocessing
- SQL joins, aggregation, and optimization
- Financial and cost analysis
- Data storytelling and dashboard design
- Business-driven decision making
***
### Project Status
   ##### Completed
***
### Data Sources
- New York State Department of Health: 
https://www.kaggle.com/datasets/wajahat1064/hospital-inpatient-cost-data-by-new-york-state?utm_source=chatgpt.com 
- Centers for Medicare & Medicaid Services (CMS)
https://www.kaggle.com/datasets/hagaih/medicare-inpatient-hospitals-payments-2023

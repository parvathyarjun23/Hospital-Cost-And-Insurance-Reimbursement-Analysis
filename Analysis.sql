---Cost by Diagnosis

SELECT 
Mapped_Diagnosis,
ROUND(AVG(Mean_Cost), 2) AS Avg_Cost,
ROUND(SUM(Mean_Cost * Discharges), 2) AS Total_Cost,
SUM(Discharges) AS Total_Volume,
ROUND(SUM(Mean_Cost * Discharges) / NULLIF(SUM(Discharges), 0), 2)  AS Cost_Per_Person 
FROM ny_hospital_data
GROUP BY Mapped_Diagnosis
ORDER BY Avg_Cost DESC; 

--Does severity has any effect

SELECT 
n.Mapped_Diagnosis,
n.Severity,
ROUND(Avg(n.Mean_Cost),2) AS Avg_Cost
FROM ny_hospital_data n
GROUP BY n.Mapped_Diagnosis, n.Severity
Order BY Avg_Cost DESC;

--Reimbursement by diagnosis

SELECT
c.Mapped_Diagnosis,
ROUND(AVG(c.Avg_Covered_Charges),2) AS Avg_Charge,
Round(AVG(c.Avg_Medicare_Payment), 2) AS Avg_Payment,
SUM(c.Total_Discharges) AS Total_Cases
FROM cmsdata c 
Group BY c.Mapped_Diagnosis 
Order by Avg_Payment DESC; 

--Risk Segmentation

SELECT  
n.Mapped_Diagnosis, 
SUM(n.Discharges) AS Total_Volume, 
ROUND(SUM(n.Mean_Cost * n.Discharges),2) AS Total_Cost, 
ROUND(SUM(c.Avg_Medicare_Payment * n.Discharges),2) AS Total_Payment, 
ROUND(SUM(n.Mean_Cost * n.Discharges) - SUM(c.Avg_Medicare_Payment * n.Discharges),2) AS Total_Gap, 
ROUND( 
		(SUM(n.Mean_Cost * n.Discharges) - SUM(c.Avg_Medicare_Payment * n.Discharges)) / NULLIF(SUM(n.Discharges),0),  
2) AS Gap_per_person, 
		CASE  
				WHEN (SUM(n.Mean_Cost * n.Discharges) - SUM(c.Avg_Medicare_Payment * n.Discharges)) > 1000000  
				THEN 'High Priority' 
				WHEN (SUM(n.Mean_Cost * n.Discharges) - SUM(c.Avg_Medicare_Payment * n.Discharges)) > 500000  
				THEN 'Medium Priority' 
				ELSE 'Low Priority' 
		END AS Priority_Level 
FROM ny_hospital_data n 
JOIN ( 
		SELECT Mapped_Diagnosis, AVG(Avg_Medicare_Payment) AS Avg_Medicare_Payment 
		FROM cmsdata 
		GROUP BY Mapped_Diagnosis 
		) c ON n.Mapped_Diagnosis = c.Mapped_Diagnosis 
GROUP BY n.Mapped_Diagnosis 
ORDER BY Total_Gap DESC; 
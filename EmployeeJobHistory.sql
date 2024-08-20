CREATE TABLE EmployeeJobHistory ( EmployeeID INT,
EmployeeName VARCHAR(50),
CompanyName VARCHAR(100),
StartDate DATE,
 EndDate DATE,
IsCurrentOrganization BIT 
);

INSERT INTO EmployeeJobHistory (EmployeeID, EmployeeName, CompanyName, StartDate, EndDate, IsCurrentOrganization)
VALUES
(1, 'Alice', 'Company A', '2020-01-01', '2021-12-31', 0),
(1, 'Alice', 'Company B', '2022-01-01', NULL, 1), -- Alice is currently working at Company B
(2, 'Bob', 'Company C', '2018-06-01', '2019-05-31', 0),
(2, 'Bob', 'Company D', '2019-06-01', '2022-11-30', 0),
(2, 'Bob', 'Company E', '2023-01-01', NULL, 1),  -- Bob is currently working at Company E
(3, 'Charlie', 'Company F', '2018-03-01', NULL, 1), -- Charlie is currently working at Company F
(4, 'Diana', 'Company G', '2005-09-01', '2010-08-31', 0),
(4, 'Diana', 'Company H', '2010-09-01', '2015-12-31', 0),
(4, 'Diana', 'Company I', '2016-01-01', '2020-02-29', 0),
(4, 'Diana', 'Company J', '2020-03-01', NULL, 1); 

select EmployeeName,floor(datediff(CURDATE(),StartDate)/365) as Exp,CASE WHEN floor(datediff(CURDATE(),StartDate)/365) <= 5 then 'JUNIOR' 
			WHEN floor(datediff(CURDATE(),StartDate)/365) > 5 and  floor(datediff(CURDATE(),StartDate)/365) <7  then 'SENOR' 
            ELSE 'VETERAN' END  as CATEGORY from EmployeeJobHistory;
            
            
with experience_identification as
( 
select *,case when enddate is not null then round(datediff(month,startdate,enddate)*1.0/12,1) else round(datediff(month,startdate,current_date())*1.0/12,1) end as exp
from employeejobhistory
)
,revised_experience as 
(
select *,case when month(enddate+1) <> month(enddate) or month(current_date()+1) <> month(current_date()) then exp+0.1 else exp end as Revised_exp from experience_identification
)
select distinct 
employeeid,employeename,
sum(Revised_exp) over (partition by employeeid,employeename) as Experience,
case when sum(Revised_exp) over (partition by employeeid,employeename) <= 5 then 'Junior'
when sum(Revised_exp) over (partition by employeeid,employeename) between 5 and 7 then 'Senior'
when sum(Revised_exp) over (partition by employeeid,employeename) > 7 then 'Veteran'
end as Levels
from revised_experience;
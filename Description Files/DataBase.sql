--------------------------------------------------------
--  File created - Tuesday-April-21-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2), 
	"COUNTRY_NAME" VARCHAR2(40), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS ;
 

   COMMENT ON COLUMN "COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
 
   COMMENT ON COLUMN "COUNTRIES"."COUNTRY_NAME" IS 'Country name';
 
   COMMENT ON COLUMN "COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
 
   COMMENT ON TABLE "COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "DEPARTMENT" 
   (	"DEP_ID" NUMBER, 
	"DEP_NAME" VARCHAR2(20), 
	"LOCATION" VARCHAR2(30), 
	"DEP_MANGER" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) ;
 

   COMMENT ON COLUMN "DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
 
   COMMENT ON COLUMN "DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
 
   COMMENT ON COLUMN "DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
 
   COMMENT ON COLUMN "DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
 
   COMMENT ON TABLE "DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "EMPLOYEE" 
   (	"EMP_ID" NUMBER, 
	"F_NAME" VARCHAR2(20), 
	"L_NAME" VARCHAR2(20), 
	"EMAIL" VARCHAR2(30), 
	"EMP_PASSWORD" VARCHAR2(15), 
	"ADDRESS" VARCHAR2(30), 
	"MOBILE" VARCHAR2(11), 
	"WORKING_HOURS" NUMBER(2,0), 
	"SALARY" NUMBER, 
	"DEP_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20), 
	"LAST_NAME" VARCHAR2(25), 
	"EMAIL" VARCHAR2(25), 
	"PHONE_NUMBER" VARCHAR2(20), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) ;
 

   COMMENT ON COLUMN "EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
 
   COMMENT ON COLUMN "EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
 
   COMMENT ON COLUMN "EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
 
   COMMENT ON COLUMN "EMPLOYEES"."EMAIL" IS 'Email id of the employee';
 
   COMMENT ON COLUMN "EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
 
   COMMENT ON COLUMN "EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
 
   COMMENT ON COLUMN "EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
 
   COMMENT ON COLUMN "EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
 
   COMMENT ON COLUMN "EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
 
   COMMENT ON COLUMN "EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
 
   COMMENT ON COLUMN "EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
 
   COMMENT ON TABLE "EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
--------------------------------------------------------
--  DDL for Table EMP_MEETING
--------------------------------------------------------

  CREATE TABLE "EMP_MEETING" 
   (	"EMP_ID" NUMBER, 
	"MEETING_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table EVALUATION
--------------------------------------------------------

  CREATE TABLE "EVALUATION" 
   (	"EVAL_ID" NUMBER, 
	"EVAL_VALUE" NUMBER, 
	"FEEDBACK" VARCHAR2(50), 
	"EMP_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table INTERVIEW
--------------------------------------------------------

  CREATE TABLE "INTERVIEW" 
   (	"INTERVIEW_ID" NUMBER, 
	"INTERVIEW_DATE" DATE, 
	"INTERVIEW_RESULT" VARCHAR2(10), 
	"INTERVIEWEE_ID" NUMBER, 
	"HR_EMP_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table INTERVIEWEE
--------------------------------------------------------

  CREATE TABLE "INTERVIEWEE" 
   (	"INTERVIEWEE_ID" NUMBER, 
	"F_NAME" VARCHAR2(20), 
	"L_NAME" VARCHAR2(20), 
	"MOBILE" VARCHAR2(11), 
	"EMAIL" VARCHAR2(25), 
	"ADDRESS" VARCHAR2(25)
   ) ;
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "JOBS" 
   (	"JOB_ID" VARCHAR2(10), 
	"JOB_TITLE" VARCHAR2(35), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) ;
 

   COMMENT ON COLUMN "JOBS"."JOB_ID" IS 'Primary key of jobs table.';
 
   COMMENT ON COLUMN "JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
 
   COMMENT ON COLUMN "JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
 
   COMMENT ON COLUMN "JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
 
   COMMENT ON TABLE "JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"JOB_ID" VARCHAR2(10), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) ;
 

   COMMENT ON COLUMN "JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
 
   COMMENT ON COLUMN "JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
 
   COMMENT ON COLUMN "JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
 
   COMMENT ON COLUMN "JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
 
   COMMENT ON COLUMN "JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
 
   COMMENT ON TABLE "JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40), 
	"POSTAL_CODE" VARCHAR2(12), 
	"CITY" VARCHAR2(30), 
	"STATE_PROVINCE" VARCHAR2(25), 
	"COUNTRY_ID" CHAR(2)
   ) ;
 

   COMMENT ON COLUMN "LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
 
   COMMENT ON COLUMN "LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
 
   COMMENT ON COLUMN "LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
 
   COMMENT ON COLUMN "LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
 
   COMMENT ON COLUMN "LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
 
   COMMENT ON COLUMN "LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
 
   COMMENT ON TABLE "LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
--------------------------------------------------------
--  DDL for Table MEETING
--------------------------------------------------------

  CREATE TABLE "MEETING" 
   (	"MEETING_ID" NUMBER, 
	"MEETING_DATE" DATE, 
	"MEETING_DURATION" NUMBER, 
	"MEETING_LOCATION" VARCHAR2(30), 
	"MEETING_LEADER" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "REGIONS" 
   (	"REGION_ID" NUMBER, 
	"REGION_NAME" VARCHAR2(25)
   ) ;
--------------------------------------------------------
--  DDL for Table REWARD
--------------------------------------------------------

  CREATE TABLE "REWARD" 
   (	"REWARD_ID" NUMBER, 
	"BONUS" NUMBER, 
	"PUNISHMENT" NUMBER, 
	"VALUE" NUMBER, 
	"RESULT" NUMBER, 
	"REASON" VARCHAR2(20), 
	"EMP_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table TRAINING
--------------------------------------------------------

  CREATE TABLE "TRAINING" 
   (	"TRAINING_ID" NUMBER, 
	"TRAINING_TITLE" VARCHAR2(20), 
	"TRAINING_DESCRIPTION" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table TRAINING_TEAM
--------------------------------------------------------

  CREATE TABLE "TRAINING_TEAM" 
   (	"TRAINING_ID" NUMBER, 
	"EMP_ID" NUMBER, 
	"TEAM_OR_EMP" NUMBER
   ) ;

---------------------------------------------------
--   DATA FOR TABLE COUNTRIES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into COUNTRIES
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CH','Switzerland',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DK','Denmark',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('FR','France',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IL','Israel',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IN','India',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IT','Italy',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('JP','Japan',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('KW','Kuwait',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ML','Malaysia',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('MX','Mexico',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NL','Netherlands',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SG','Singapore',3);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('UK','United Kingdom',1);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('US','United States of America',2);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia',4);
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe',4);

---------------------------------------------------
--   END DATA FOR TABLE COUNTRIES
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE DEPARTMENT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEPARTMENT
Insert into DEPARTMENT (DEP_ID,DEP_NAME,LOCATION,DEP_MANGER) values (1,'CS','Cairo',1);
Insert into DEPARTMENT (DEP_ID,DEP_NAME,LOCATION,DEP_MANGER) values (2,'IS','Alex',2);
Insert into DEPARTMENT (DEP_ID,DEP_NAME,LOCATION,DEP_MANGER) values (3,'IT','Giza',3);
Insert into DEPARTMENT (DEP_ID,DEP_NAME,LOCATION,DEP_MANGER) values (4,'SC','Cairo',4);

---------------------------------------------------
--   END DATA FOR TABLE DEPARTMENT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE DEPARTMENTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEPARTMENTS
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (10,'Administration',200,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (20,'Marketing',201,1800);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (30,'Purchasing',114,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (40,'Human Resources',203,2400);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (50,'Shipping',121,1500);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (60,'IT',103,1400);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (70,'Public Relations',204,2700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (80,'Sales',145,2500);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (90,'Executive',100,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (100,'Finance',108,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (110,'Accounting',205,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (120,'Treasury',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (130,'Corporate Tax',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (140,'Control And Credit',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (150,'Shareholder Services',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (160,'Benefits',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (170,'Manufacturing',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (180,'Construction',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (190,'Contracting',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (200,'Operations',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (210,'IT Support',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (220,'NOC',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (230,'IT Helpdesk',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (240,'Government Sales',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (250,'Retail Sales',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (260,'Recruiting',null,1700);
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values (270,'Payroll',null,1700);

---------------------------------------------------
--   END DATA FOR TABLE DEPARTMENTS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into EMPLOYEE
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (1,'mahmoud','nasr','nasr@gmail.com','12345*','Cairo','01024112607',8,800,1);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (2,'mostafa','abdalla','mostafa@gmail.com','02549n@','Giza','01020830146',8,600,2);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (3,'mohamed','yasser','mohamed@gmail.com','96741356#$','Cairo','01549732665',10,700,3);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (4,'ali','elthoqaby','ali@gmail.com','36987%1','Alexandria','01047829557',8,800,4);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (5,'zyad','mostafa','zyad@gmail.com','25964iu','Alexandria','01547320967',8,900,1);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (7,'Mahmoud','Emad','Emad@gmail.com','14789','Cairo','01003462963',10,1000,1);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (8,'Khaled','Mahmed','Khaled@gmail.com','1111','Alexandria','01003462541',7,800,2);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (9,'Ahmed','Magdy','Ahmed@gmail.com','2222','Cairo','01003468547',8,900,2);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (10,'Mostafa','Mahmed','Mahmed@gmail.com','3333','Alexandria','01112354789',10,1000,4);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (11,'Fares','Aymen','Fares@gmail.com','4444','Giza','01254874586',10,1000,3);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (12,'Karim','Ataf','Karim@gmail.com','5555','Giza','01524854796',12,1200,3);
Insert into EMPLOYEE (EMP_ID,F_NAME,L_NAME,EMAIL,EMP_PASSWORD,ADDRESS,MOBILE,WORKING_HOURS,SALARY,DEP_ID) values (6,'Nader','Waled','Nader@gmail.com','6666','Alexandria','02154854769',10,1300,4);

---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEE
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into EMPLOYEES
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (198,'Donald','OConnell','DOCONNEL','650.507.9833',to_timestamp('21-JUN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2600,null,124,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (199,'Douglas','Grant','DGRANT','650.507.9844',to_timestamp('13-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2600,null,124,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (200,'Jennifer','Whalen','JWHALEN','515.123.4444',to_timestamp('17-SEP-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_ASST',4400,null,101,10);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (201,'Michael','Hartstein','MHARTSTE','515.123.5555',to_timestamp('17-FEB-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'MK_MAN',13000,null,100,20);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (202,'Pat','Fay','PFAY','603.123.6666',to_timestamp('17-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'MK_REP',6000,null,201,20);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (203,'Susan','Mavris','SMAVRIS','515.123.7777',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'HR_REP',6500,null,101,40);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (204,'Hermann','Baer','HBAER','515.123.8888',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PR_REP',10000,null,101,70);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (205,'Shelley','Higgins','SHIGGINS','515.123.8080',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_MGR',12008,null,101,110);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (206,'William','Gietz','WGIETZ','515.123.8181',to_timestamp('07-JUN-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_ACCOUNT',8300,null,205,110);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (100,'Steven','King','SKING','515.123.4567',to_timestamp('17-JUN-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_PRES',24000,null,null,90);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (101,'Neena','Kochhar','NKOCHHAR','515.123.4568',to_timestamp('21-SEP-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_VP',17000,null,100,90);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (102,'Lex','De Haan','LDEHAAN','515.123.4569',to_timestamp('13-JAN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_VP',17000,null,100,90);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (103,'Alexander','Hunold','AHUNOLD','590.423.4567',to_timestamp('03-JAN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',9000,null,102,60);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (104,'Bruce','Ernst','BERNST','590.423.4568',to_timestamp('21-MAY-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',6000,null,103,60);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (105,'David','Austin','DAUSTIN','590.423.4569',to_timestamp('25-JUN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',4800,null,103,60);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (106,'Valli','Pataballa','VPATABAL','590.423.4560',to_timestamp('05-FEB-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',4800,null,103,60);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (107,'Diana','Lorentz','DLORENTZ','590.423.5567',to_timestamp('07-FEB-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',4200,null,103,60);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (108,'Nancy','Greenberg','NGREENBE','515.124.4569',to_timestamp('17-AUG-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_MGR',12008,null,101,100);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (109,'Daniel','Faviet','DFAVIET','515.124.4169',to_timestamp('16-AUG-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',9000,null,108,100);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (110,'John','Chen','JCHEN','515.124.4269',to_timestamp('28-SEP-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',8200,null,108,100);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (111,'Ismael','Sciarra','ISCIARRA','515.124.4369',to_timestamp('30-SEP-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',7700,null,108,100);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (112,'Jose Manuel','Urman','JMURMAN','515.124.4469',to_timestamp('07-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',7800,null,108,100);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (113,'Luis','Popp','LPOPP','515.124.4567',to_timestamp('07-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'FI_ACCOUNT',6900,null,108,100);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (114,'Den','Raphaely','DRAPHEAL','515.127.4561',to_timestamp('07-DEC-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_MAN',11000,null,100,30);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (115,'Alexander','Khoo','AKHOO','515.127.4562',to_timestamp('18-MAY-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',3100,null,114,30);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (116,'Shelli','Baida','SBAIDA','515.127.4563',to_timestamp('24-DEC-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2900,null,114,30);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (117,'Sigal','Tobias','STOBIAS','515.127.4564',to_timestamp('24-JUL-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2800,null,114,30);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (118,'Guy','Himuro','GHIMURO','515.127.4565',to_timestamp('15-NOV-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2600,null,114,30);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (119,'Karen','Colmenares','KCOLMENA','515.127.4566',to_timestamp('10-AUG-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'PU_CLERK',2500,null,114,30);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (120,'Matthew','Weiss','MWEISS','650.123.1234',to_timestamp('18-JUL-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',8000,null,100,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (121,'Adam','Fripp','AFRIPP','650.123.2234',to_timestamp('10-APR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',8200,null,100,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (122,'Payam','Kaufling','PKAUFLIN','650.123.3234',to_timestamp('01-MAY-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',7900,null,100,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (123,'Shanta','Vollman','SVOLLMAN','650.123.4234',to_timestamp('10-OCT-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',6500,null,100,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (124,'Kevin','Mourgos','KMOURGOS','650.123.5234',to_timestamp('16-NOV-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_MAN',5800,null,100,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (125,'Julia','Nayer','JNAYER','650.124.1214',to_timestamp('16-JUL-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3200,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',to_timestamp('28-SEP-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2700,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (127,'James','Landry','JLANDRY','650.124.1334',to_timestamp('14-JAN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2400,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (128,'Steven','Markle','SMARKLE','650.124.1434',to_timestamp('08-MAR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2200,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (129,'Laura','Bissot','LBISSOT','650.124.5234',to_timestamp('20-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3300,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (130,'Mozhe','Atkinson','MATKINSO','650.124.6234',to_timestamp('30-OCT-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2800,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (131,'James','Marlow','JAMRLOW','650.124.7234',to_timestamp('16-FEB-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2500,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (132,'TJ','Olson','TJOLSON','650.124.8234',to_timestamp('10-APR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2100,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (133,'Jason','Mallin','JMALLIN','650.127.1934',to_timestamp('14-JUN-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3300,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (134,'Michael','Rogers','MROGERS','650.127.1834',to_timestamp('26-AUG-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2900,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (135,'Ki','Gee','KGEE','650.127.1734',to_timestamp('12-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2400,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (136,'Hazel','Philtanker','HPHILTAN','650.127.1634',to_timestamp('06-FEB-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2200,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (137,'Renske','Ladwig','RLADWIG','650.121.1234',to_timestamp('14-JUL-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3600,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (138,'Stephen','Stiles','SSTILES','650.121.2034',to_timestamp('26-OCT-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3200,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (139,'John','Seo','JSEO','650.121.2019',to_timestamp('12-FEB-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2700,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (140,'Joshua','Patel','JPATEL','650.121.1834',to_timestamp('06-APR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2500,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (141,'Trenna','Rajs','TRAJS','650.121.8009',to_timestamp('17-OCT-03 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3500,null,124,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (142,'Curtis','Davies','CDAVIES','650.121.2994',to_timestamp('29-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',3100,null,124,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (143,'Randall','Matos','RMATOS','650.121.2874',to_timestamp('15-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2600,null,124,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (144,'Peter','Vargas','PVARGAS','650.121.2004',to_timestamp('09-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',2500,null,124,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (145,'John','Russell','JRUSSEL','011.44.1344.429268',to_timestamp('01-OCT-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',14000,0.4,100,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (146,'Karen','Partners','KPARTNER','011.44.1344.467268',to_timestamp('05-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',13500,0.3,100,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',to_timestamp('10-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',12000,0.3,100,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',to_timestamp('15-OCT-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',11000,0.3,100,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_timestamp('29-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',10500,0.2,100,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (150,'Peter','Tucker','PTUCKER','011.44.1344.129268',to_timestamp('30-JAN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10000,0.3,145,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (151,'David','Bernstein','DBERNSTE','011.44.1344.345268',to_timestamp('24-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9500,0.25,145,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (152,'Peter','Hall','PHALL','011.44.1344.478968',to_timestamp('20-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9000,0.25,145,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (153,'Christopher','Olsen','COLSEN','011.44.1344.498718',to_timestamp('30-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8000,0.2,145,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',to_timestamp('09-DEC-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7500,0.2,145,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',to_timestamp('23-NOV-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7000,0.15,145,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (156,'Janette','King','JKING','011.44.1345.429268',to_timestamp('30-JAN-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10000,0.35,146,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (157,'Patrick','Sully','PSULLY','011.44.1345.929268',to_timestamp('04-MAR-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9500,0.35,146,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (158,'Allan','McEwen','AMCEWEN','011.44.1345.829268',to_timestamp('01-AUG-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9000,0.35,146,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (159,'Lindsey','Smith','LSMITH','011.44.1345.729268',to_timestamp('10-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8000,0.3,146,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (160,'Louise','Doran','LDORAN','011.44.1345.629268',to_timestamp('15-DEC-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7500,0.3,146,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (161,'Sarath','Sewall','SSEWALL','011.44.1345.529268',to_timestamp('03-NOV-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7000,0.25,146,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (162,'Clara','Vishney','CVISHNEY','011.44.1346.129268',to_timestamp('11-NOV-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10500,0.25,147,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (163,'Danielle','Greene','DGREENE','011.44.1346.229268',to_timestamp('19-MAR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9500,0.15,147,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (164,'Mattea','Marvins','MMARVINS','011.44.1346.329268',to_timestamp('24-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7200,0.1,147,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (165,'David','Lee','DLEE','011.44.1346.529268',to_timestamp('23-FEB-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6800,0.1,147,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (166,'Sundar','Ande','SANDE','011.44.1346.629268',to_timestamp('24-MAR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6400,0.1,147,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (167,'Amit','Banda','ABANDA','011.44.1346.729268',to_timestamp('21-APR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6200,0.1,147,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (168,'Lisa','Ozer','LOZER','011.44.1343.929268',to_timestamp('11-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',11500,0.25,148,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (169,'Harrison','Bloom','HBLOOM','011.44.1343.829268',to_timestamp('23-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',10000,0.2,148,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (170,'Tayler','Fox','TFOX','011.44.1343.729268',to_timestamp('24-JAN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',9600,0.2,148,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (171,'William','Smith','WSMITH','011.44.1343.629268',to_timestamp('23-FEB-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7400,0.15,148,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (172,'Elizabeth','Bates','EBATES','011.44.1343.529268',to_timestamp('24-MAR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7300,0.15,148,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (173,'Sundita','Kumar','SKUMAR','011.44.1343.329268',to_timestamp('21-APR-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6100,0.1,148,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (174,'Ellen','Abel','EABEL','011.44.1644.429267',to_timestamp('11-MAY-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',11000,0.3,149,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266',to_timestamp('19-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8800,0.25,149,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',to_timestamp('24-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8600,0.2,149,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',to_timestamp('23-APR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',8400,0.2,149,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (178,'Kimberely','Grant','KGRANT','011.44.1644.429263',to_timestamp('24-MAY-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',7000,0.15,149,null);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',to_timestamp('04-JAN-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',6200,0.1,149,80);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (180,'Winston','Taylor','WTAYLOR','650.507.9876',to_timestamp('24-JAN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3200,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (181,'Jean','Fleaur','JFLEAUR','650.507.9877',to_timestamp('23-FEB-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3100,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (182,'Martha','Sullivan','MSULLIVA','650.507.9878',to_timestamp('21-JUN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2500,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (183,'Girard','Geoni','GGEONI','650.507.9879',to_timestamp('03-FEB-08 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2800,null,120,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (184,'Nandita','Sarchand','NSARCHAN','650.509.1876',to_timestamp('27-JAN-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',4200,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (185,'Alexis','Bull','ABULL','650.509.2876',to_timestamp('20-FEB-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',4100,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (186,'Julia','Dellinger','JDELLING','650.509.3876',to_timestamp('24-JUN-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3400,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (187,'Anthony','Cabrio','ACABRIO','650.509.4876',to_timestamp('07-FEB-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3000,null,121,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (188,'Kelly','Chung','KCHUNG','650.505.1876',to_timestamp('14-JUN-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3800,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (189,'Jennifer','Dilly','JDILLY','650.505.2876',to_timestamp('13-AUG-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3600,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (190,'Timothy','Gates','TGATES','650.505.3876',to_timestamp('11-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2900,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (191,'Randall','Perkins','RPERKINS','650.505.4876',to_timestamp('19-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2500,null,122,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (192,'Sarah','Bell','SBELL','650.501.1876',to_timestamp('04-FEB-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',4000,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (193,'Britney','Everett','BEVERETT','650.501.2876',to_timestamp('03-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3900,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (194,'Samuel','McCain','SMCCAIN','650.501.3876',to_timestamp('01-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3200,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (195,'Vance','Jones','VJONES','650.501.4876',to_timestamp('17-MAR-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',2800,null,123,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (196,'Alana','Walsh','AWALSH','650.507.9811',to_timestamp('24-APR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3100,null,124,50);
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (197,'Kevin','Feeney','KFEENEY','650.507.9822',to_timestamp('23-MAY-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SH_CLERK',3000,null,124,50);

---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEES
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EMP_MEETING
--   FILTER = none used
---------------------------------------------------
REM INSERTING into EMP_MEETING

---------------------------------------------------
--   END DATA FOR TABLE EMP_MEETING
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EVALUATION
--   FILTER = none used
---------------------------------------------------
REM INSERTING into EVALUATION

---------------------------------------------------
--   END DATA FOR TABLE EVALUATION
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE INTERVIEW
--   FILTER = none used
---------------------------------------------------
REM INSERTING into INTERVIEW

---------------------------------------------------
--   END DATA FOR TABLE INTERVIEW
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE INTERVIEWEE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into INTERVIEWEE

---------------------------------------------------
--   END DATA FOR TABLE INTERVIEWEE
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE JOBS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into JOBS
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President',20080,40000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President',15000,30000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant',3000,6000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager',8200,16000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant',4200,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager',8200,16000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant',4200,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager',10000,20080);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative',6000,12008);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager',8000,15000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk',2500,5500);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager',5500,8500);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk',2008,5000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk',2500,5500);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer',4000,10000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager',9000,15000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative',4000,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative',4000,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative',4500,10500);

---------------------------------------------------
--   END DATA FOR TABLE JOBS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE JOB_HISTORY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into JOB_HISTORY
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (102,to_timestamp('13-JAN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('24-JUL-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'IT_PROG',60);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_timestamp('21-SEP-97 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('27-OCT-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_ACCOUNT',110);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_timestamp('28-OCT-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('15-MAR-05 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_MGR',110);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (201,to_timestamp('17-FEB-04 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('19-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'MK_REP',20);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (114,to_timestamp('24-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',50);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (122,to_timestamp('01-JAN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'ST_CLERK',50);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_timestamp('17-SEP-95 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('17-JUN-01 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AD_ASST',90);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_timestamp('24-MAR-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_REP',80);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_timestamp('01-JAN-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-07 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'SA_MAN',80);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_timestamp('01-JUL-02 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-DEC-06 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'AC_ACCOUNT',90);

---------------------------------------------------
--   END DATA FOR TABLE JOB_HISTORY
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE LOCATIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOCATIONS
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1000,'1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1100,'93091 Calle della Testa','10934','Venice',null,'IT');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1300,'9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2000,'40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2300,'198 Clementi North','540198','Singapore',null,'SG');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2400,'8204 Arthur St',null,'London',null,'UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');

---------------------------------------------------
--   END DATA FOR TABLE LOCATIONS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE MEETING
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MEETING

---------------------------------------------------
--   END DATA FOR TABLE MEETING
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE REGIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REGIONS
Insert into REGIONS (REGION_ID,REGION_NAME) values (1,'Europe');
Insert into REGIONS (REGION_ID,REGION_NAME) values (2,'Americas');
Insert into REGIONS (REGION_ID,REGION_NAME) values (3,'Asia');
Insert into REGIONS (REGION_ID,REGION_NAME) values (4,'Middle East and Africa');

---------------------------------------------------
--   END DATA FOR TABLE REGIONS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE REWARD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into REWARD
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (1,1,null,100,null,null,1);
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (2,1,null,300,null,null,3);
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (3,null,1,300,null,null,9);
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (4,1,null,200,null,null,4);
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (5,null,1,500,null,null,2);
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (6,1,null,100,null,null,7);
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (7,null,1,200,null,null,8);
Insert into REWARD (REWARD_ID,BONUS,PUNISHMENT,VALUE,RESULT,REASON,EMP_ID) values (8,1,null,300,null,null,5);

---------------------------------------------------
--   END DATA FOR TABLE REWARD
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE TRAINING
--   FILTER = none used
---------------------------------------------------
REM INSERTING into TRAINING

---------------------------------------------------
--   END DATA FOR TABLE TRAINING
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE TRAINING_TEAM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into TRAINING_TEAM

---------------------------------------------------
--   END DATA FOR TABLE TRAINING_TEAM
---------------------------------------------------

--------------------------------------------------------
--  Constraints for Table INTERVIEW
--------------------------------------------------------

  ALTER TABLE "INTERVIEW" ADD CONSTRAINT "INTERVIEW_INTERVIEWID_PK" PRIMARY KEY ("INTERVIEW_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table INTERVIEWEE
--------------------------------------------------------

  ALTER TABLE "INTERVIEWEE" ADD CONSTRAINT "INTERVIEWEE_EMAIL_UK" UNIQUE ("EMAIL") ENABLE;
 
  ALTER TABLE "INTERVIEWEE" ADD CONSTRAINT "INTERVIEWEE_FNAME_CK" CHECK (F_Name is not Null) ENABLE;
 
  ALTER TABLE "INTERVIEWEE" ADD CONSTRAINT "INTERVIEWEE_INTERVIEWEEID_PK" PRIMARY KEY ("INTERVIEWEE_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table EMP_MEETING
--------------------------------------------------------

  ALTER TABLE "EMP_MEETING" ADD CONSTRAINT "EMPMEETING_COMPID_PK" PRIMARY KEY ("EMP_ID", "MEETING_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "LOCATIONS" MODIFY ("CITY" CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE);
 
  ALTER TABLE "LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" MODIFY ("EMAIL" CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL") ENABLE;
 
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID") ENABLE;
 
  ALTER TABLE "EMPLOYEES" MODIFY ("HIRE_DATE" CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" MODIFY ("JOB_ID" CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" MODIFY ("LAST_NAME" CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
--------------------------------------------------------
--  Constraints for Table TRAINING_TEAM
--------------------------------------------------------

  ALTER TABLE "TRAINING_TEAM" ADD CONSTRAINT "TRAINTEAM_COMP_PK" PRIMARY KEY ("TRAINING_ID", "EMP_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table EVALUATION
--------------------------------------------------------

  ALTER TABLE "EVALUATION" ADD CONSTRAINT "EVALUATION_EVALID_PK" PRIMARY KEY ("EVAL_ID") ENABLE;
 
  ALTER TABLE "EVALUATION" ADD CONSTRAINT "EVALUATION_EVALVAL_CK" CHECK (Eval_Value > 0) ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_EMPID_PK" PRIMARY KEY ("EMP_ID") ENABLE;
 
  ALTER TABLE "EMPLOYEE" MODIFY ("F_NAME" CONSTRAINT "EMPLOYEE_FNAME_CK" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_SALARY_CK" CHECK (Salary>0) ENABLE;
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID") ENABLE;
 
  ALTER TABLE "JOBS" MODIFY ("JOB_TITLE" CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "REGIONS" MODIFY ("REGION_ID" CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE);
 
  ALTER TABLE "REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table REWARD
--------------------------------------------------------

  ALTER TABLE "REWARD" ADD CONSTRAINT "REWARD_BONUS_CK" CHECK (Bonus >= 0) ENABLE;
 
  ALTER TABLE "REWARD" ADD CONSTRAINT "REWARD_PUNISHMENT_CK" CHECK (Punishment >= 0) ENABLE;
 
  ALTER TABLE "REWARD" ADD CONSTRAINT "REWARD_REWARDID_PK" PRIMARY KEY ("REWARD_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "DEPARTMENT_DEPID_PK" PRIMARY KEY ("DEP_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table TRAINING
--------------------------------------------------------

  ALTER TABLE "TRAINING" MODIFY ("TRAINING_TITLE" CONSTRAINT "TRAINING_TITLE_CK" NOT NULL ENABLE);
 
  ALTER TABLE "TRAINING" ADD CONSTRAINT "TRAINING_TRAININGID_PK" PRIMARY KEY ("TRAINING_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID") ENABLE;
 
  ALTER TABLE "DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
 
  ALTER TABLE "JOB_HISTORY" MODIFY ("EMPLOYEE_ID" CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE);
 
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE") ENABLE;
 
  ALTER TABLE "JOB_HISTORY" MODIFY ("END_DATE" CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE);
 
  ALTER TABLE "JOB_HISTORY" MODIFY ("JOB_ID" CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE);
 
  ALTER TABLE "JOB_HISTORY" MODIFY ("START_DATE" CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEETING
--------------------------------------------------------

  ALTER TABLE "MEETING" ADD CONSTRAINT "MEETING_MEETINGID_PK" PRIMARY KEY ("MEETING_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE;
 
  ALTER TABLE "COUNTRIES" MODIFY ("COUNTRY_ID" CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Index TRAINTEAM_COMP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRAINTEAM_COMP_PK" ON "TRAINING_TEAM" ("TRAINING_ID", "EMP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOC_ID_PK" ON "LOCATIONS" ("LOCATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "EMP_MANAGER_IX" ON "EMPLOYEES" ("MANAGER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "DEPT_LOCATION_IX" ON "DEPARTMENTS" ("LOCATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JHIST_EMP_ID_ST_DATE_PK" ON "JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_DEPARTMENT_IX" ON "JOB_HISTORY" ("DEPARTMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMPLOYEE_EMPID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMPLOYEE_EMPID_PK" ON "EMPLOYEE" ("EMP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INTERVIEWEE_INTERVIEWEEID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INTERVIEWEE_INTERVIEWEEID_PK" ON "INTERVIEWEE" ("INTERVIEWEE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COUNTRY_C_ID_PK" ON "COUNTRIES" ("COUNTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_JOB_IX" ON "JOB_HISTORY" ("JOB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index REWARD_REWARDID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REWARD_REWARDID_PK" ON "REWARD" ("REWARD_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_EMPLOYEE_IX" ON "JOB_HISTORY" ("EMPLOYEE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INTERVIEW_INTERVIEWID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INTERVIEW_INTERVIEWID_PK" ON "INTERVIEW" ("INTERVIEW_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "EMP_JOB_IX" ON "EMPLOYEES" ("JOB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "LOC_CITY_IX" ON "LOCATIONS" ("CITY") 
  ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JOB_ID_PK" ON "JOBS" ("JOB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EVALUATION_EVALID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVALUATION_EVALID_PK" ON "EVALUATION" ("EVAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRAINING_TRAININGID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRAINING_TRAININGID_PK" ON "TRAINING" ("TRAINING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "LOC_STATE_PROVINCE_IX" ON "LOCATIONS" ("STATE_PROVINCE") 
  ;
--------------------------------------------------------
--  DDL for Index EMPMEETING_COMPID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMPMEETING_COMPID_PK" ON "EMP_MEETING" ("EMP_ID", "MEETING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "EMP_DEPARTMENT_IX" ON "EMPLOYEES" ("DEPARTMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMP_EMAIL_UK" ON "EMPLOYEES" ("EMAIL") 
  ;
--------------------------------------------------------
--  DDL for Index MEETING_MEETINGID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEETING_MEETINGID_PK" ON "MEETING" ("MEETING_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "EMP_NAME_IX" ON "EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index DEPARTMENT_DEPID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEPARTMENT_DEPID_PK" ON "DEPARTMENT" ("DEP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REG_ID_PK" ON "REGIONS" ("REGION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMP_EMP_ID_PK" ON "EMPLOYEES" ("EMPLOYEE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEPT_ID_PK" ON "DEPARTMENTS" ("DEPARTMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INTERVIEWEE_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INTERVIEWEE_EMAIL_UK" ON "INTERVIEWEE" ("EMAIL") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "LOC_COUNTRY_IX" ON "LOCATIONS" ("COUNTRY_ID") 
  ;
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "REGIONS" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "DEPEMP_DEPMANAGER_FK" FOREIGN KEY ("DEP_MANGER")
	  REFERENCES "EMPLOYEE" ("EMP_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "LOCATIONS" ("LOCATION_ID") ENABLE;
 
  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "EMPDEP_DEPID_FK" FOREIGN KEY ("DEP_ID")
	  REFERENCES "DEPARTMENT" ("DEP_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
 
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "JOBS" ("JOB_ID") ENABLE;
 
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMP_MEETING
--------------------------------------------------------

  ALTER TABLE "EMP_MEETING" ADD CONSTRAINT "EMPMEETEMP_EMPID_FK" FOREIGN KEY ("EMP_ID")
	  REFERENCES "EMPLOYEE" ("EMP_ID") ENABLE;
 
  ALTER TABLE "EMP_MEETING" ADD CONSTRAINT "EMPMEETINGMEETING_MEETID_FK" FOREIGN KEY ("MEETING_ID")
	  REFERENCES "MEETING" ("MEETING_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVALUATION
--------------------------------------------------------

  ALTER TABLE "EVALUATION" ADD CONSTRAINT "EVALEMP_EMPID_FK" FOREIGN KEY ("EMP_ID")
	  REFERENCES "EMPLOYEE" ("EMP_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INTERVIEW
--------------------------------------------------------

  ALTER TABLE "INTERVIEW" ADD CONSTRAINT "INTERVIEWEE_INTERVIEWEEID_FK" FOREIGN KEY ("INTERVIEWEE_ID")
	  REFERENCES "INTERVIEWEE" ("INTERVIEWEE_ID") ENABLE;
 
  ALTER TABLE "INTERVIEW" ADD CONSTRAINT "INTERVIEWEMP_HRID_FK" FOREIGN KEY ("HR_EMP_ID")
	  REFERENCES "EMPLOYEE" ("EMP_ID") ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
 
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
 
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "JOBS" ("JOB_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "COUNTRIES" ("COUNTRY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEETING
--------------------------------------------------------

  ALTER TABLE "MEETING" ADD CONSTRAINT "MEETINGEMP_METLEADER_FK" FOREIGN KEY ("MEETING_LEADER")
	  REFERENCES "EMPLOYEE" ("EMP_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table REWARD
--------------------------------------------------------

  ALTER TABLE "REWARD" ADD CONSTRAINT "REWARDEMP_EMPID_FK" FOREIGN KEY ("EMP_ID")
	  REFERENCES "EMPLOYEE" ("EMP_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table TRAINING_TEAM
--------------------------------------------------------

  ALTER TABLE "TRAINING_TEAM" ADD CONSTRAINT "TRAINTEAMEMP_EMPID_FK" FOREIGN KEY ("EMP_ID")
	  REFERENCES "EMPLOYEE" ("EMP_ID") ENABLE;
 
  ALTER TABLE "TRAINING_TEAM" ADD CONSTRAINT "TRAINTEAMTRAIN_TRAINID_FK" FOREIGN KEY ("TRAINING_ID")
	  REFERENCES "TRAINING" ("TRAINING_ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER "SECURE_EMPLOYEES" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UPDATE_JOB_HISTORY" 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER "UPDATE_JOB_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/

--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/


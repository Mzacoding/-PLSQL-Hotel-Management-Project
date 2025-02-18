
SET VERIFY OFF
SET SERVEROUTPUT ON 
-- Declaring varable 
DECLARE 
name VARCHAR2(15):='&Name';
test_mark1  NUMBER(3):=&Test_Mark1;
test_mark2  NUMBER(3):=&Test_Mark2;
age  NUMBER(3):=&Age;
test_average NUMBER(3);
total_average NUMBER(3);
application_status  VARCHAR2(10);
ATLEAST_40_YEARS_POINTS CONSTANT NUMBER:=5;
LESSTHAN_40_YEARS_POINTS CONSTANT NUMBER:=2;
total_average_required CONSTANT NUMBER:=75.0;


BEGIN

--Calculate Test Average
test_average:=(test_mark1 + test_mark2) /2;

--Adding points to Applicants based on age
IF age>39 THEN 
    total_average:=test_average + ATLEAST_40_YEARS_POINTS ;
	
ELSE 
    total_average:=test_average + LESSTHAN_40_YEARS_POINTS;
	
END IF;


--Determine Results

IF total_average>=total_average_required THEN
   application_status:='Hired';
   
ELSE 
     application_status:='Not Hired';
	 
END IF;


DBMS_OUTPUT.PUT_LINE(name  ||' Your Total Average is ' ||total_average||' AND Total Average Required is '|| total_average_required);

DBMS_OUTPUT.PUT_LINE(' Then your Application Status is '|| application_status);

END;
/

create schema alumini;
use alumini ;
-- Imported all the csv files

-- 3.	Run SQL command to see the structure of six tables

desc College_A_HS  ;
desc College_A_SE  ;
desc College_A_SJ  ;
desc College_B_HS  ;
desc College_B_SE  ;
desc College_B_SJ  ;

-- 4.	Display first 1000 rows of tables (College_A_HS, College_A_SE,
-- College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.

select * from College_A_HS limit 1000 ;--
select * from College_A_SE limit 1000 ;--
select * from College_A_SJ limit 1000 ;--
select * from College_B_HS limit 1000 ;--
select * from College_B_SE limit 1000 ;--
select * from College_B_SJ limit 1000 ;--


-- 5.	Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ,
--  College_B_HS, College_B_SE, College_B_SJ) into MS Excel.

# UNDONE


-- 6.	Perform data cleaning on table College_A_HS and store cleaned data in view 
-- College_A_HS_V, Remove null values. 
create or replace view College_A_HS_V as 
	select * from College_A_HS where 
    RollNo IS NOT NULL AND 
    LastUpdate IS NOT NULL AND 
    Name IS NOT NULL AND 
    FatherName IS NOT NULL AND 
    MotherName IS NOT NULL AND 
    Batch IS NOT NULL AND 
    Degree IS NOT NULL AND 
    PresentStatus IS NOT NULL AND 
    HSDegree IS NOT NULL AND 
    EntranceExam IS NOT NULL AND
    Institute IS NOT NULL AND 
    Location IS NOT NULL;
 --


-- 7.	Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.
create or replace view College_A_SE_V as 
	select * from College_A_SE where 
    RollNo IS NOT NULL AND 
    LastUpdate IS NOT NULL AND 
    Name IS NOT NULL AND 
    FatherName IS NOT NULL AND 
    MotherName IS NOT NULL AND 
    Batch IS NOT NULL AND 
    Degree IS NOT NULL AND 
    PresentStatus IS NOT NULL AND 
    Organization IS NOT NULL AND
    Location IS NOT NULL;

-- 8.	Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.
create or replace view College_A_SJ_V as 
	select * from College_A_SJ where 
    RollNo IS NOT NULL AND 
    LastUpdate IS NOT NULL AND 
    Name IS NOT NULL AND 
    FatherName IS NOT NULL AND 
    MotherName IS NOT NULL AND 
    Batch IS NOT NULL AND 
    Degree IS NOT NULL AND 
    PresentStatus IS NOT NULL AND 
    Organization IS NOT NULL AND 
    Designation IS NOT NULL AND 
    Location IS NOT NULL;

-- 9.	Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.
create or replace view College_B_HS_V as 
	select * from College_b_HS where 
    RollNo IS NOT NULL AND 
    LastUpdate IS NOT NULL AND 
    Name IS NOT NULL AND 
    FatherName IS NOT NULL AND 
    MotherName IS NOT NULL AND 
    Branch IS NOT NULL AND 
    Batch	IS NOT NULL AND
    Degree IS NOT NULL AND 
    PresentStatus IS NOT NULL AND 
    HSDegree IS NOT NULL AND 
    EntranceExam IS NOT NULL AND
    Institute IS NOT NULL AND 
    Location IS NOT NULL;
    
    
-- 10.	Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.
create or replace view College_B_SE_V as 
	select * from College_B_SE where 
    RollNo IS NOT NULL AND 
    LastUpdate IS NOT NULL AND 
    Name IS NOT NULL AND 
    FatherName IS NOT NULL AND 
    MotherName IS NOT NULL AND 
    Batch IS NOT NULL AND 
    Degree IS NOT NULL AND 
    PresentStatus IS NOT NULL AND 
    Organization IS NOT NULL AND 
    Location IS NOT NULL;



-- 11.	Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.
create or replace view College_B_SJ_V as 
	select * from College_B_SJ where 
    RollNo IS NOT NULL AND 
    LastUpdate IS NOT NULL AND 
    Name IS NOT NULL AND 
    FatherName IS NOT NULL AND 
    MotherName IS NOT NULL AND 
    Branch IS NOT NULL AND 
    Batch IS NOT NULL AND
    Degree IS NOT NULL AND 
    PresentStatus IS NOT NULL AND 
    Organization IS NOT NULL AND 
    Designation IS NOT NULL AND 
    Location IS NOT NULL;
    
-- 12.	Make procedure to use string function/s for converting record of Name, 
-- FatherName, MotherName into lower case for views (College_A_HS_V, College_A_SE_V,
--  College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 

delimiter $$
CREATE PROCEDURE ConvertToLower()
BEGIN
update College_A_HS_V SET Name = LOWER(Name) ,FatherName=LOWER(FatherName),MotherName=LOWER(MotherName) ; 
update College_A_SE_V SET Name = LOWER(Name) ,FatherName=LOWER(FatherName),MotherName=LOWER(MotherName) ; 
update College_A_SJ_V SET Name = LOWER(Name) ,FatherName=LOWER(FatherName),MotherName=LOWER(MotherName) ; 
update College_B_HS_V SET Name = LOWER(Name) ,FatherName=LOWER(FatherName),MotherName=LOWER(MotherName) ; 
update College_B_SE_V SET Name = LOWER(Name) ,FatherName=LOWER(FatherName),MotherName=LOWER(MotherName) ; 
update College_B_SJ_V SET Name = LOWER(Name) ,FatherName=LOWER(FatherName),MotherName=LOWER(MotherName) ; 
END $$
delimiter ;

call ConvertToLower;
 
-- 13.	Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V,
--  College_B_HS_V, College_B_SE_V, College_B_SJ_V) into MS Excel and make pivot 
-- chart for location of Alumni.
Select Location , count(Location) from college_a_hs_v group by Location order by Location;
Select Location , count(Location) from college_a_se_v group by Location order by Location;
Select Location , count(Location) from college_a_sj_v group by Location order by Location;
Select Location , count(Location) from college_b_hs_v group by Location order by Location;
Select Location , count(Location) from college_b_se_v group by Location order by Location;
Select Location , count(Location) from college_b_sj_v group by Location order by Location;


-- 14.	Write a query to create procedure get_name_collegeA using the cursor to 
-- fetch names of all students from college A.
delimiter $$
create PROCEDURE get_name_A (inout name_ LONGTEXT) 
begin
	declare finished int default 0 ;
    declare namelist varchar(400) default "" ;
	declare namedetail Cursor For
		SELECT name FROM College_A_HS_V 
        UNION
        SELECT name FROM College_A_SE_V 
        UNION
        SELECT name FROM College_A_SJ_V ;
	declare continue handler for not found set finished = 1 ;
    open namedetail;
    getname : LOOP
		fetch namedetail INTO namelist;
        if finished = 1 then 
			leave getname;
		end if ;
        set name_ = concat(namelist,",",name_) ;
		end loop getname;
        close namedetail ;
end $$
delimiter ;

set @name_ = " " ;
call get_name_A(@name_);
SELECT @name_;




-- 15.	Write a query to create procedure get_name_collegeB using the cursor to 
-- fetch names of all students from college B.
delimiter $$
create PROCEDURE get_name_B (inout name_ LONGTEXT) 
begin
	declare finished int default 0 ;
    declare namelist varchar(400) default "" ;
	declare namedetail Cursor For
		SELECT name FROM College_B_HS_V 
        UNION
        SELECT name FROM College_B_SE_V 
        UNION
        SELECT name FROM College_B_SJ_V ;
	declare continue handler for not found set finished = 1 ;
    open namedetail;
    getname : LOOP
		fetch namedetail INTO namelist;
        if finished = 1 then 
			leave getname;
		end if ;
        set name_ = concat(namelist,",",name_) ;
		end loop getname;
        close namedetail ;
end $$
delimiter ;

set @name_ = " " ;
call get_name_B(@name_);
SELECT @name_;



-- 16.	Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
-- Note: Approximate percentages are considered for career choices.

create view college_a as
SELECT name,PresentStatus,RollNo FROM College_A_HS_V 
        UNION
        SELECT name,PresentStatus,RollNo FROM College_A_SE_V 
        UNION
        SELECT name,PresentStatus,RollNo FROM College_A_SJ_V;
        
create view college_b as
SELECT name,PresentStatus FROM College_b_HS_V 
        UNION
        SELECT name,PresentStatus FROM College_b_SE_V 
        UNION
        SELECT name,PresentStatus FROM College_b_SJ_V;


create view pivot_a as
select PresentStatus,count(name)/(select count(*) total_a from college_a )*100 as CollegeA from college_a
group BY PresentStatus ;

create view pivot_b as
select PresentStatus,count(name)/(select count(*) total_a from college_b )*100 as CollegeB from college_b
group BY PresentStatus ;

select pivot_a.PresentStatus ,pivot_a.CollegeA,pivot_b.CollegeB from pivot_a inner join pivot_b on
pivot_a.PresentStatus = pivot_b.PresentStatus
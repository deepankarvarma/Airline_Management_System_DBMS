create table Emp_Pilot (
    Employee_Id number constraint emp_pilot_pk primary key,
    Gender varchar2(10) not null,
    Base_Location varchar2(20) not null,
    Address varchar2(50) not null,
    Pilot_Name varchar2(20) not null,
    Salary number not null,
    DoB date not null,
    DoJ date not null
);

desc Emp_Pilot;
drop table Emp_CC;
create table Emp_CC (
    Employee_Id number constraint emp_cc_pk primary key,
    Base_Location varchar2(20) not null,
    Address varchar2(50) not null,
    CC_Name varchar2(20) not null,
    Salary number not null,
    DoB date not null,
    DoJ date not null,
    Gender varchar2(10) not null
);

desc Emp_CC;
drop table Emp_Asst;
create table Emp_Asst ( 
    Employee_Id number constraint emp_asst_pk primary key, 
    Base_Location varchar2(20) not null, 
    Address varchar2(50) not null, 
    Asst_Name varchar2(20) not null, 
    Salary number not null, 
    DoB date not null, 
    DoJ date not null, 
    Gender varchar2(10) not null 
);
desc Emp_Asst;
drop table Emp_Pilot_Ph;
create table Emp_Pilot_Ph(
  Employee_Id number ,
  Phone_no number not null,
  CONSTRAINT Emp_pilot_Id FOREIGN KEY(Employee_Id) REFERENCES  Emp_Pilot(Employee_Id)
);
desc Emp_Pilot_Ph;
drop table Emp_CC_Ph;
create table Emp_CC_Ph(
  Employee_Id number ,
  Phone_no number not null,
  CONSTRAINT Emp_cc_Id FOREIGN KEY(Employee_Id) REFERENCES  Emp_CC(Employee_Id)
);
desc Emp_CC_Ph;
drop table Emp_Asst_Ph;
create table Emp_Asst_Ph(
  Employee_Id number ,
  Phone_no number not null,
  CONSTRAINT Emp_asst_Id FOREIGN KEY(Employee_Id) REFERENCES  Emp_Asst(Employee_Id)
);
desc Emp_Asst_Ph;
drop table AC_Model;
create table AC_Model(
    Company_Name varchar2(20) not null,
    Model_Number varchar2(10) not null,
    Engine_Number number constraint ac_model_pk primary key,
    DoC date not null,
    DoE date not null
  
);
desc AC_Model;
drop table Cargo;
create table Cargo (
    Flight_Type varchar2(15),
    Flight_Number number constraint cargo_pk primary key
);

desc Cargo;
drop table Passenger;
create table Passenger (
    Flight_Type varchar2(15),
    Flight_Number number constraint passenger_pk primary key
);
desc Passenger;
create table Maintenance (
    Service_Station varchar2(20) not null,
    Engine_Number number ,
    Flight_Number number not null,
    Model_Number varchar2(10) not null,
    Last_Service date not null,
    CONSTRAINT Main_Eng_num FOREIGN KEY (Engine_Number) REFERENCES AC_Model(Engine_Number), 
    CONSTRAINT main_pk PRIMARY KEY(Engine_Number, Flight_Number)
);
desc Maintenance;
create table overhaul(
  Engine_Number number,
  Engine_Flight_Number number,
  CONSTRAINT eng_num_fk FOREIGN KEY(Engine_Number) REFERENCES AC_Model(Engine_Number),
  CONSTRAINT eng_fl_num_fk FOREIGN KEY(Engine_Number,Engine_Flight_Number) REFERENCES Maintenance(Engine_Number, Flight_Number)
  );
  desc overhaul;
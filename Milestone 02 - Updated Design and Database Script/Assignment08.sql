--**********************************************************************************************--
-- Title: Milestone02
-- Author: IMartinez
-- Desc: This file demonstrates how to design and create tables, constraints, 
--		 views, stored procedures, and permissions for Milestone02
-- Change Log: When,Who,What
-- 2020-05-24,IMartinez,Created File
--***********************************************************************************************--
Begin Try
	Use Master;
	If Exists(Select Name From SysDatabases Where Name = 'Assignment08DB_IMartinez')
	 Begin 
	  Alter Database [Assignment08DB_IMartinez] set Single_user With Rollback Immediate;
	  Drop Database Assignment08DB_IMartinez;
	 End
	Create Database Assignment08DB_IMartinez;
End Try
Begin Catch
	Print Error_Number();
End Catch
go
Use Assignment08DB_IMartinez;



-- Create Tables --
Create Table Clinics
(ClinicID int IDENTITY(1,1)
,ClinicName nvarchar(100) NOT NULL
,ClinicPhoneNumber nvarchar(100) NOT NULL
,ClinicAddress nvarchar(100) NOT NULL
,ClinicCity nvarchar(100) NOT NULL
,ClinicState nchar(2) NOT NULL
,ClinicZipCode nvarchar(10) NOT NULL
);
go

Create Table Patients
(PatientID int IDENTITY(1,1)
,PatientFirstName nvarchar(100) NOT NULL
,PatientLastName nvarchar(100) NOT NULL
,PatientPhoneNumber nvarchar(100) NOT NULL
,PatientAddress nvarchar(100) NOT NULL
,PatientCity nvarchar(100) NOT NULL
,PatientState nchar(2) NOT NULL
,PatientZipCode nvarchar(10) NOT NULL
);
go

Create Table Doctors
(DoctorID int IDENTITY(1,1)
,DoctorFirstName nvarchar(100) NOT NULL
,DoctorLastName nvarchar(100) NOT NULL
,DoctorPhoneNumber nvarchar(100) NOT NULL
,DoctorAddress nvarchar(100) NOT NULL
,DoctorCity nvarchar(100) NOT NULL
,DoctorState nchar(2) NOT NULL
,DoctorZipCode nvarchar(10) NOT NULL
);
go

Create Table Appointments
(AppointmentID int IDENTITY(1,1)
,AppointmentDateTime datetime NOT NULL
,AppointmentPatientID int NOT NULL
,AppointmentDoctorID int NOT NULL
,AppointmentClinicID int NOT NULL
);
go



-- Add Constraints --
Alter Table Clinics
 Add Constraint pkClinics
  Primary Key (ClinicID);
go
Alter Table Clinics
 Add Constraint uqClinicName Unique (ClinicName)
go
Alter Table Clinics
  Add Constraint ckClinicPhoneNumber
    Check (ClinicPhoneNumber like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
go
Alter Table Clinics
  Add Constraint ckClinicZipCode
    Check (ClinicZipCode like '[0-9][0-9][0-9][0-9][0-9]' OR
		   ClinicZipCode like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
go

Alter Table Patients
 Add Constraint pkPatients
  Primary Key (PatientID);
go
Alter Table Patients
  Add Constraint ckPatientPhoneNumber
    Check (PatientPhoneNumber like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
go
Alter Table Patients
  Add Constraint ckPatientZipCode
    Check (PatientZipCode like '[0-9][0-9][0-9][0-9][0-9]' OR
		   PatientZipCode like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
go

Alter Table Doctors
 Add Constraint pkDoctors
  Primary Key (DoctorID);
go
Alter Table Doctors
  Add Constraint ckDoctorPhoneNumber
    Check (DoctorPhoneNumber like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
go
Alter Table Doctors
  Add Constraint ckDoctorZipCode
    Check (DoctorZipCode like '[0-9][0-9][0-9][0-9][0-9]' OR
		   DoctorZipCode like '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
go

Alter Table Appointments
 Add Constraint pkAppointments
  Primary Key (AppointmentID);
go
Alter Table Appointments
  Add Constraint fkPatientID Foreign Key (AppointmentPatientID)
    References Patients(PatientID);
go
Alter Table Appointments
  Add Constraint fkDoctorID Foreign Key (AppointmentDoctorID)
    References Doctors(DoctorID);
go
Alter Table Appointments
  Add Constraint fkClinicID Foreign Key (AppointmentClinicID)
    References Clinics(ClinicID);
go



-- Add Views --
Create View vClinics
As Select ClinicID, ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, 
		  ClinicState, ClinicZipCode
From Clinics;
go
/*
Select * From vClinics
go
--*/

Create View vPatients
As Select PatientID, PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, 
		  PatientCity, PatientState, PatientZipCode
From Patients;
go
/*
Select * From vPatients
go
--*/

Create View vDoctors
As Select DoctorID, DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, 
		  DoctorCity, DoctorState, DoctorZipCode
From Doctors;
go
/*
Select * From vDoctors
go
--*/

Create View vAppointments
As Select AppointmentID, AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, 
		  AppointmentClinicID
From Appointments;
go
/*
Select * From vAppointments
go
--*/


Create View vAppointmentsByPatientsDoctorsAndClinics
As
Select Top 100000
 a.AppointmentID as AppointmentID,
 Convert(varchar(10), a.AppointmentDateTime, 101) as AppointmentDate,
 Convert(varchar(5), a.AppointmentDateTime, 108) as AppointmentTime,
 p.PatientID as PatientID,
 p.PatientFirstName + ' ' + p.PatientLastName as PatientName,
 p.PatientPhoneNumber as PatientPhoneNumber,
 p.PatientAddress as PatientAddress,
 p.PatientCity as PatientCity,
 p.PatientState as PatientState,
 p.PatientZipCode as PatientZipCode,
 d.DoctorID as DoctorID,
 d.DoctorFirstName + ' ' + d.DoctorLastName as DoctorName,
 d.DoctorCity as DoctorCity,
 d.DoctorState as DoctorState,
 d.DoctorZipCode as DoctorZipCode,
 c.ClinicID as ClinicID,
 c.ClinicName as ClinicName,
 c.ClinicPhoneNumber as ClinicPhoneNumber,
 c.ClinicAddress as ClinicAddress,
 c.ClinicState as ClinicState,
 c.ClinicZipCode as ClinicZipCode
From Appointments as a
 Join Clinics as c
  on a.AppointmentClinicID = c.ClinicID
 Join Patients as p
  on a.AppointmentPatientID = p.PatientID
 Join Doctors as d
  on a.AppointmentDoctorID = d.DoctorID
Group By a.AppointmentID,a.AppointmentDateTime, p.PatientID, p.PatientFirstName, p.PatientLastName,
 p.PatientPhoneNumber, p.PatientAddress, p.PatientCity, p.PatientState, p.PatientZipCode, d.DoctorID,
 d.DoctorFirstName, d.DoctorLastName, d.DoctorCity, d.DoctorState, d.DoctorZipCode, c.ClinicID, c.ClinicName,
 c.ClinicPhoneNumber, c.ClinicAddress, c.ClinicState, c.ClinicZipCode
Order By a.AppointmentID;
go

-- Add Stored Procedures --
--inserts
Create Procedure pInsClinics
(@ClinicName nvarchar(100), @ClinicPhoneNumber nvarchar(100), @ClinicAddress nvarchar(100), 
 @ClinicCity nvarchar(100), @ClinicState nchar(2), @ClinicZipCode nvarchar(10))
/* Author: IMartinez
** Desc: Processes Inserts for Clinics table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Insert Into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) 
	Values(@ClinicName, @ClinicPhoneNumber, @ClinicAddress, @ClinicCity, @ClinicState, @ClinicZipCode);
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pInsPatients
(@PatientFirstName nvarchar(100), @PatientLastName nvarchar(100), @PatientPhoneNumber nvarchar(100), 
 @PatientAddress nvarchar(100), @PatientCity nvarchar(100), @PatientState nchar(2), @PatientZipCode nvarchar(10))
/* Author: IMartinez
** Desc: Processes Inserts for Patients table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Insert Into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, 
						 PatientCity, PatientState, PatientZipCode) 
	Values(@PatientFirstName, @PatientLastName, @PatientPhoneNumber, @PatientAddress, 
						 @PatientCity, @PatientState, @PatientZipCode);
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pInsDoctors
(@DoctorFirstName nvarchar(100), @DoctorLastName nvarchar(100), @DoctorPhoneNumber nvarchar(100), 
 @DoctorAddress nvarchar(100), @DoctorCity nvarchar(100), @DoctorState nchar(2), @DoctorZipCode nvarchar(10))
/* Author: IMartinez
** Desc: Processes Inserts for Doctors table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Insert Into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, 
						 DoctorCity, DoctorState, DoctorZipCode) 
	Values(@DoctorFirstName, @DoctorLastName, @DoctorPhoneNumber, @DoctorAddress, 
						 @DoctorCity, @DoctorState, @DoctorZipCode);
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pInsAppointments
(@AppointmentDateTime datetime, @AppointmentPatientID int, @AppointmentDoctorID int, @AppointmentClinicID int)
/* Author: IMartinez
** Desc: Processes Inserts for Appointments table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Insert Into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) 
	Values(@AppointmentDateTime, @AppointmentPatientID, @AppointmentDoctorID, @AppointmentClinicID);
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go


--updates
Create Procedure pUpdClinics
(@ClinicID int, @ClinicName nvarchar(100), @ClinicPhoneNumber nvarchar(100), @ClinicAddress nvarchar(100), 
 @ClinicCity nvarchar(100), @ClinicState nchar(2), @ClinicZipCode nvarchar(10))
/* Author: IMartinez
** Desc: Processes updates for Clinics table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Update Clinics 
	 Set ClinicName = @ClinicName, 
		 ClinicPhoneNumber = @ClinicPhoneNumber, 
		 ClinicAddress = @ClinicAddress, 
		 ClinicCity = @ClinicCity,
		 ClinicState = @ClinicState, 
		 ClinicZipCode = @ClinicZipCode
	 Where ClinicID = @ClinicID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pUpdPatients
(@PatientID int, @PatientFirstName nvarchar(100), @PatientLastName nvarchar(100), @PatientPhoneNumber nvarchar(100), 
 @PatientAddress nvarchar(100), @PatientCity nvarchar(100), @PatientState nchar(2), @PatientZipCode nvarchar(10))
/* Author: IMartinez
** Desc: Processes updates for Patients table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Update Patients 
	 Set PatientFirstName = @PatientFirstName, 
		 PatientLastName = @PatientLastName, 
		 PatientPhoneNumber = @PatientPhoneNumber, 
		 PatientAddress = @PatientAddress, 
		 PatientCity = @PatientCity, 
		 PatientState = @PatientState, 
		 PatientZipCode = @PatientZipCode
	 Where PatientID = @PatientID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pUpdDoctors
(@DoctorID int, @DoctorFirstName nvarchar(100), @DoctorLastName nvarchar(100), @DoctorPhoneNumber nvarchar(100), 
 @DoctorAddress nvarchar(100), @DoctorCity nvarchar(100), @DoctorState nchar(2), @DoctorZipCode nvarchar(10))
/* Author: IMartinez
** Desc: Processes updates for Doctors table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Update Doctors 
	 Set DoctorFirstName = @DoctorFirstName, 
		 DoctorLastName = @DoctorLastName, 
		 DoctorPhoneNumber = @DoctorPhoneNumber, 
		 DoctorAddress = @DoctorAddress, 
		 DoctorCity = @DoctorCity, 
		 DoctorState = @DoctorState, 
		 DoctorZipCode = @DoctorZipCode
	 Where DoctorID = @DoctorID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pUpdAppointments
(@AppointmentID int, @AppointmentDateTime datetime, @AppointmentPatientID int, @AppointmentDoctorID int, @AppointmentClinicID int)
/* Author: IMartinez
** Desc: Processes updates for Appointments table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Update Appointments 
	 Set AppointmentDateTime = @AppointmentDateTime,
		 AppointmentPatientID = @AppointmentPatientID,
		 AppointmentDoctorID = @AppointmentDoctorID,
		 AppointmentClinicID = @AppointmentClinicID
	 Where AppointmentID = @AppointmentID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go


--deletes
Create Procedure pDelClinics
(@ClinicID int)
/* Author: IMartinez
** Desc: Processes Deletes for Clinics table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Delete From Clinics Where ClinicID = @ClinicID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pDelPatients
(@PatientID int)
/* Author: IMartinez
** Desc: Processes Deletes for Patients table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Delete From Patients Where PatientID = @PatientID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pDelDoctors
(@DoctorID int)
/* Author: IMartinez
** Desc: Processes Deletes for Doctors table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Delete From Doctors Where DoctorID = @DoctorID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go

Create Procedure pDelAppointments
(@AppointmentID int)
/* Author: IMartinez
** Desc: Processes Deletes for Appointments table
** Change Log: When,Who,What
** 2020-05-24,IMartinez,Created Sproc.
*/
AS
 Begin -- Body
  Declare @RC int = 0;
  Begin Try
   Begin Transaction; 
    -- Transaction Code --
	Delete From Appointments Where AppointmentID = @AppointmentID
   Commit Transaction;
   Set @RC = +1;
  End Try
  Begin Catch
   If(@@Trancount > 0) Rollback Transaction;
   Print Error_Message();
   Set @RC = -1
  End Catch
  Return @RC;
 End -- Body
go



-- Set Permissions --
Deny Select, Insert, Update, Delete On Clinics To Public;
Deny Select, Insert, Update, Delete On Patients To Public;
Deny Select, Insert, Update, Delete On Doctors To Public;
Deny Select, Insert, Update, Delete On Appointments To Public;

Grant Select On vClinics To Public;
Grant Select On vPatients To Public;
Grant Select On vDoctors To Public;
Grant Select On vAppointments To Public;

Grant Execute On pInsClinics To Public;
Grant Execute On pInsPatients To Public;
Grant Execute On pInsDoctors To Public;
Grant Execute On pInsAppointments To Public;

Grant Execute On pUpdClinics To Public;
Grant Execute On pUpdPatients To Public;
Grant Execute On pUpdDoctors To Public;
Grant Execute On pUpdAppointments To Public;

Grant Execute On pDelClinics To Public;
Grant Execute On pDelPatients To Public;
Grant Execute On pDelDoctors To Public;
Grant Execute On pDelAppointments To Public;


-- TESTS --
--inserts
/*
Declare @Status int;
Exec @Status = pInsClinics @ClinicName = 'Solarbreeze',
						  @ClinicPhoneNumber = '941-185-3909',
						  @ClinicAddress = '1715 Russell Pass',
						  @ClinicCity = 'Bradenton',
						  @ClinicState = 'FL',
						  @ClinicZipCode = '34205';
Print @Status;
go
Select * From vClinics
go

Declare @Status int;
Exec @Status = pInsPatients @PatientFirstName = 'Bob',
						  @PatientLastName = 'Smith',
						  @PatientPhoneNumber = '215-258-5637',
						  @PatientAddress = '5 Raven Alley',
						  @PatientCity = 'Philadelphia',
						  @PatientState = 'PA',
						  @PatientZipCode = '19191';
Print @Status;
go
Select * From vPatients
go

Declare @Status int;
Exec @Status = pInsDoctors @DoctorFirstName = 'Sue',
						  @DoctorLastName = 'Smith',
						  @DoctorPhoneNumber = '812-348-9919',
						  @DoctorAddress = '29336 Bonner Avenue	',
						  @DoctorCity = 'Evansville',
						  @DoctorState = 'IN',
						  @DoctorZipCode = '47737';
Print @Status;
go
Select * From vDoctors
go

Declare @Status int;
Exec @Status = pInsAppointments @AppointmentDateTime = '05/24/2020 14:00',
						  @AppointmentPatientID = '1',
						  @AppointmentDoctorID = '1',
						  @AppointmentClinicID = '1';
Print @Status;
go
--*/


--updates
/*
Declare @Status int;
Exec @Status = pUpdClinics @ClinicID = 1, @ClinicName = 'Breeze', --Name change
						  @ClinicPhoneNumber = '941-185-3909',
						  @ClinicAddress = '1715 Russell Pass',
						  @ClinicCity = 'Bradenton',
						  @ClinicState = 'FL',
						  @ClinicZipCode = '34205';;
Print @Status;
go
Select * From vClinics
go


Declare @Status int;
Exec @Status = pUpdPatients @PatientID = 1, @PatientFirstName = 'Bobby', --Name change
						  @PatientLastName = 'Jones', --Name change
						  @PatientPhoneNumber = '215-258-5637',
						  @PatientAddress = '5 Raven Alley',
						  @PatientCity = 'Philadelphia',
						  @PatientState = 'PA',
						  @PatientZipCode = '19191';
Print @Status;
go
Select * From vPatients
go

Declare @Status int;
Exec @Status = pUpdDoctors @DoctorID = 1, @DoctorFirstName = 'Susan', --Name change
						  @DoctorLastName = 'Jones', --Name change
						  @DoctorPhoneNumber = '812-348-9919',
						  @DoctorAddress = '29336 Bonner Avenue',
						  @DoctorCity = 'Evansville',
						  @DoctorState = 'IN',
						  @DoctorZipCode = '47737';
Print @Status;
go
Select * From vDoctors
go

Declare @Status int;
Exec @Status = pUpdAppointments @AppointmentID = 1, @AppointmentDateTime = '05/24/2021 8:00', --datetime change
						  @AppointmentPatientID = '1',
						  @AppointmentDoctorID = '1',
						  @AppointmentClinicID = '1';
Print @Status;
go
Select * From vDoctors
go
--*/


--Deletes
/*
Declare @Status int;
Exec @Status = pDelAppointments @AppointmentID = 1;
Print @Status;
Select * From vAppointments
go
--*/

Select * From vAppointmentsByPatientsDoctorsAndClinics;
go
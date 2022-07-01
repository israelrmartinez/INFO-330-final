--**********************************************************************************************--
-- Title: Milestone03
-- Author: IMartinez
-- Desc: This file fills sample data into a database.
-- Change Log: When,Who,What
-- 2020-06-01,IMartinez,Created File
--***********************************************************************************************--

Use Assignment08DB_IMartinez;
go


-- Clinics Data
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Blue', '570-652-7235', '3446 Toban Avenue', 'Scranton', 'PA', '18514');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Purple', '971-257-3152', '46436 Old Shore Junction', 'Salem', 'OR', '97312');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Indigo', '719-637-5856', '9045 Homewood Drive', 'Colorado Springs', 'CO', '80940');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Goldenrod', '612-945-4247', '1 Division Circle', 'Minneapolis', 'MN', '55458');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Yellow', '314-962-0259', '3080 Miller Court', 'Saint Louis', 'MO', '63104');
go

-- Patients Data
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Carlin', 'Rembaud', '515-334-6818', '3 International Pass', 'Des Moines', 'IA', '50335');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Kelsy', 'Dronsfield', '512-972-3321', '48107 Duke Plaza', 'Austin', 'TX', '78732');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Torey', 'Domenge', '971-807-5890', '5 South Way', 'Portland', 'OR', '97232');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Auberon', 'Kilborn', '504-481-8196', '99 Duke Hill', 'New Orleans', 'LA', '70160');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Darla', 'Lourenco', '918-185-7794', '9 Arrowood Park', 'Tulsa', 'OK', '74103');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Raddie', 'Gordon-Giles', '219-358-4924', '3796 Melby Drive', 'Gary', 'IN', '46406');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Rosemonde', 'Pargiter', '512-451-9664', '313 Rockefeller Circle', 'Austin', 'TX', '78764');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Emmey', 'Grunguer', '801-189-9800', '88 Green Street', 'Salt Lake City', 'UT', '84120');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Amity', 'Lightbowne', '503-495-8629', '3 Bartelt Place', 'Portland', 'OR', '97201');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Svend', 'Shewon', '832-867-3065', '7250 Corscot Road', 'Houston', 'TX', '77055');
go

-- Doctors Data
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Annabell', 'Samsonsen', '212-862-4267', '411 Kinsman Point', 'New York City', 'NY', '10260');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Cammy', 'Hefforde', '907-771-4905', '2321 Barby Drive', 'Anchorage', 'AK', '99507');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Kassie', 'Caplan', '901-841-0730', '8723 Bellgrove Avenue', 'Memphis', 'TN', '38136');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Muire', 'Devonshire', '717-657-8276', '7 Straubel Parkway', 'Harrisburg', 'PA', '17140');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Clemence', 'Glamart', '706-945-9194', '4 Tomscot Hill', 'Augusta', 'GA', '30919');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Chelsea', 'Tweedie', '619-533-2838', '55602 Thackeray Alley', 'San Diego', 'CA', '92132');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Fiona', 'Conant', '928-697-6033', '3 Northport Road', 'Prescott', 'AZ', '86305');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Dorella', 'Pentland', '510-541-3434', '3 Petterle Drive', 'Oakland', 'CA', '94616');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Tasia', 'Bambra', '571-570-2029', '0576 Colorado Drive', 'Arlington', 'VA', '22244');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Dulcinea', 'Cud', '303-218-8402', '0541 Gerald Point', 'Boulder', 'CO', '80305');
go

-- Appointments Data
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 09:30:00', 1, 5, 1);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 08:15:00', 5, 4, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 11:00:00', 7, 3, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 10:45:00', 9, 1, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 12:15:00', 4, 5, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 13:00:00', 10, 9, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 12:30:00', 6, 10, 1);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 14:45:00', 3, 7, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 15:15:00', 8, 6, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-06-2 16:45:00', 2, 3, 1);
go

-- All views
/*
Select * From vAppointments
go

Select * From vClinics
go
Select * From vPatients
go
Select * From vDoctors
go
Select * From vAppointmentsByPatientsDoctorsAndClinics;
go
--*/


-- Reporting Views
Create View vDoctorsByAppointmentsByClinics
As
Select Top 100000
 d.DoctorID as DoctorID,
 d.DoctorFirstName + ' ' + d.DoctorLastName as DoctorName,
 Convert(varchar(10), a.AppointmentDateTime, 101) as AppointmentDate,
 Convert(varchar(5), a.AppointmentDateTime, 108) as AppointmentTime,
 c.ClinicName as ClinicName
From Appointments as a
 Join Doctors as d
  on a.AppointmentDoctorID = d.DoctorID
 Join Clinics as c
  on a.AppointmentClinicID = c.ClinicID
Group By d.DoctorID, d.DoctorFirstName, d.DoctorLastName, a.AppointmentDateTime, c.ClinicName
Order By d.DoctorID, a.AppointmentDateTime;
go
Select * From vDoctorsByAppointmentsByClinics
go

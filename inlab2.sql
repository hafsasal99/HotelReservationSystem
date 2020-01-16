drop database HotelReservation
--password
Create database inlab2;

use inlab2;

Create table Customer
(
CustomerID int ,
Name nvarchar(50),
ContactNo nvarchar(15),
MemberShipID int,
CNIC nvarchar(50),
Address nvarchar(60),
Room_Booked int,
PromotionID int,
ServiceID int,
DiscountID int,
EmailID nvarchar(50)
);
Create table Employee
(
EmployeeID int,
Name nvarchar(50),
ContactNo nvarchar(15),
Designation nvarchar(60),
Salary decimal,
HotelID int
);
Create table MemberShip
(
MemberShipID int,
MembershipDate Date,
MembershipExpiry Date,
DiscountID int,
Username nvarchar(50),
[Password] nvarchar(10)
);

create table promotions
(
	id int not null,
	name nvarchar(50) not null,
	discountPercentage int
);

create table discounts
(
	id int not null,
	name nvarchar(50) not null,
	discountAmount int
);

create table [service]
(
	id int not null,
	name nvarchar(50) not null,
	cost int
);

create Table [Floor]
(
FloorNumber int,
HotelId int, 
Type nvarchar(100),
ManagerID int
);

create Table BillingOfRooms
(
BillId int,
CheckInDate Date,
CheckOutDate Date,
AmountPaid float,
Balance float,
ModeOfPayment nvarchar(50),
CustomerId int
);

create Table FoodMenu
(
MealId int,
FoodItems nvarchar(50),
Price int,
Availability nvarchar(10),
Quantity int
);

Create Table Hotel
(
	hotelid int,
	city nvarchar(20) ,
	address nvarchar(50),
	Director int,
	phone nvarchar(12),	
);


Create Table Rooms
(
	roomid int,
	floorid int,
	hotelno int,
	availabilty int,
	customerid int,
 );

 create table roomService
 (
	roomServiceID int not null,
	roomID int,
	MealID int,
	customerID int not null
 )

 create table promoCodes
 (
	id int not null,
	code nvarchar(10) not null,
	promotionID int
 )
 create table CustomerServices
 (
	CustomerID int,
	ServiceID int
 )
 alter table CustomerServices alter Column CustomerID int not null
  alter table CustomerServices alter Column ServiceID int not null
 
	 alter table CustomerServices add constraint pk_90 primary key(CustomerID,ServiceID) 
 alter table promoCodes add constraint PK_promoCodes primary Key (ID)
 alter table promotions add primary key (id)
 alter table promoCodes add constraint FK_promoCodes foreign key (id) references promotions(id) on delete no Action on update cascade

 alter table discounts add constraint PK_discounts primary Key (id)

 alter table roomService add constraint PK_roomService primary Key (roomServiceID)
 
Alter Table Hotel alter column hotelid int NOT NULL
Alter Table Rooms alter column roomid int NOT NULL
Alter Table Rooms alter column availabilty int NOT NULL
Alter Table BillingOfRooms Alter column BillId int NOT NULL;
Alter Table BillingOfRooms alter column CheckInDate date not null;
Alter Table BillingOfRooms alter column CheckOutDate date  null;
Alter Table BillingOfRooms alter column Balance int not null;
Alter Table BillingOfRooms alter column CustomerID int not null;
Alter table Customer alter column CustomerID int NOT NULL
Alter table Employee alter column EmployeeID int NOT NULL
Alter table MemberShip alter column MemberShipID int NOT NULL
Alter table Customer alter column Name nvarchar(50) NOT NULL
Alter table Customer alter column ContactNo nvarchar(15)  NOT NULL
Alter table Customer alter column CNIC nvarchar(50)  NOT NULL
Alter table Customer alter column Room_Booked int NOT NULL
Alter table Employee alter column Name nvarchar(50) NOT NULL
Alter table Employee alter column EmployeeID int NOT NULL
Alter table Employee alter column ContactNo nvarchar(15) NOT NULL
Alter table Employee alter column Designation nvarchar(60) NOT NULL
Alter table Employee alter column Salary decimal NOT NULL
Alter table MemberShip alter column MembershipDate Date NOT NULL
Alter table MemberShip alter column MembershipExpiry Date NOT NULL
Alter table MemberShip alter column Username nvarchar(50) NOT NULL
Alter table MemberShip alter column Password nvarchar(10) NOT NULL
Alter Table FoodMenu Alter column MealId int NOT NULL;
Alter Table FoodMenu Alter column FoodItems int NOT NULL;
Alter Table FoodMenu Alter column Price int NOT NULL;
Alter Table FoodMenu Alter column Availability nvarchar(10) NOT NULL;
Alter Table FoodMenu Alter column Quantity int NOT NULL;
Alter table [service] alter column id int not null;


Alter table Customer add constraint PK_1 primary key (CustomerID)
Alter table Employee add constraint PK_2 primary key (EmployeeID)
Alter table MemberShip add constraint PK_3 primary key (MemberShipID)

Alter Table Hotel add constraint PK_Hotel primary key (hotelid)
Alter Table Rooms add constraint PK_Rooms primary key (roomid)
Alter Table BillingOfRooms add Constraint PK_BillId primary key (BillId);
Alter Table BillingOfRooms add constraint fk1 foreign key (CustomerID) references Customer(CustomerID) on delete no Action
alter table service add primary key (id)
Alter Table FoodMenu add Constraint PK_FoodId primary key (MealId);
Alter table Customer add constraint fk_55 foreign key(DiscountID) references discounts(id)




Alter table Customer add constraint FK_1 foreign key (MemberShipID) references MemberShip(MemberShipID) on delete set NULL on update cascade
Alter table Customer add constraint FK_4 foreign key (PromotionID) references promotions(id) on delete set NULL on update cascade

Alter table Customer add constraint FK_2 foreign key (Room_Booked) references Rooms(roomid) on update cascade on delete No Action
Alter table Employee add constraint FK_3 foreign key (HotelID) references Hotel(hotelid)on delete No Action on update cascade Alter table Customer alter column CustomerID int NOT NULL



Alter table Customer add constraint len_1 check (len(CNIC)=15)


Alter table Employee add constraint len_2 check(salary>10000)


Alter table MemberShip add constraint unique_1 Unique(username)



Alter Table Floor Alter column FLoorNumber int NOT NULL;
Alter Table Floor Alter column HotelID int NOT NULL;

Alter Table Floor add Constraint PK_FloorNumber_And_HotelNumber primary key (FloorNumber, HotelID);

Alter Table Floor  add Constraint Check_FloorNumber check (FloorNumber >= 1 and FloorNumber <= 3)
Alter Table Floor add Constraint Check_HotelId check (HotelId >= 1 and HotelId <= 3)
select * FROM MemberShip
Alter table Membership add constraint len_3 check(len([Password])>=7)



Alter table [service] add constraint pk_32 primary key(id);


Alter Table Hotel add constraint hotel_phone_len check(len(phone)=11)

alter table Rooms add constraint FK_Rooms_floorid_hotelid1 foreign key(floorid,hotelno) references Floor(FloorNumber, HotelID) on delete no action on update no action


alter table Rooms add constraint FK_Rooms_customerid foreign key(customerid) references Customer (CustomerID) on delete no action on update no action


 alter table CustomerServices add constraint fk_90 foreign key(CustomerID) references Customer(CustomerID)
 Alter Table Hotel add constraint fk_57 foreign key (Director) references Employee(EmployeeID) on delete no Action on update no Action
    alter table CustomerServices add constraint fk_91 foreign key(ServiceID) references [service](id)
	alter table roomService add constraint FK_roomService foreign key (roomID) references rooms(roomid) on delete set NULL on update cascade
 alter table roomService add constraint FK_roomService12 foreign key (MealID) references foodMenu(mealID) on delete set NULL on update cascade
 alter table roomService add constraint FK_roomService23 foreign key (customerID) references customer(customerID) on delete set NULL on update cascade
 Alter Table Floor add Constraint FK_ManagerId foreign key (ManagerId) references Employee (EmployeeID) on delete set null on update cascade;
 Alter Table BillingOfRooms add Constraint FK_CustomerId foreign key (CustomerId) references Customer (CustomerID) on delete cascade on update cascade;


 --INSERTIONS
 insert into Hotel values(1,'Karachi', '5A tariq Road', 1, '03004005006')
insert into Hotel values(2,'Lahore', 'Y block DHA', 2, '03246788769')
insert into Hotel values(3,'Islamabad', 'F11 Markaz', 3, '03107890987')
insert into Employee VALUES(1,'Mushtaq Ahmad','03004005006','Manager',1000000,NULL)
insert into Employee VALUES(2,'Saim Raza','03004205006','Manager',1000000,NULL)
insert into Employee VALUES(3,'Mehnaz Ali','03204705006','Manager',1000000,NULL)

insert into Employee VALUES(4,'Ali Ahmad','03004895006','Manager',1000000,1)
insert into Employee VALUES(5,'Danish Baig','03004205092','Manager',1000000,2)
insert into Employee VALUES(6,'Ayesha Mehmood','03204702004','Manager',1000000,3)
insert into Employee VALUES(7,'Zarnish Ali','03004000923','Manager',1000000,1)
insert into Employee VALUES(8,'Saima Noor','03004295006','Manager',1000000,2)
insert into Employee VALUES(9,'Mehmood Tariq','03204715006','Manager',1000000,3)

Update Employee set HotelID=1 Where EmployeeID=1
Update Employee set HotelID=2 Where EmployeeID=2
Update Employee set HotelID=3 Where EmployeeID=3
insert into Floor values(1,1,'Economy',1)
insert into Floor values(2,1,'Luxory',2)
insert into Floor values(3,1,'Business',3)
insert into Floor values(1,2,'Economy',4)
insert into Floor values(2,2,'Luxory',5)
insert into Floor values(3,2,'Business',6)
insert into Floor values(1,3,'Economy',7)
insert into Floor values(2,3,'Luxory',8)
insert into Floor values(3,3,'Business',9)
insert into Rooms values(1,1,1,0,1)
insert into Rooms values(2,1,2,0,3)
insert into Rooms values(3,2,3,0,2)
insert into Rooms values(4,3,1,0,4)
Update Customer set Room_Booked=1 WHERE CustomerID=1
Update Customer set Room_Booked=2 WHERE CustomerID=3
Update Customer set Room_Booked=3 WHERE CustomerID=2
Update Customer set Room_Booked=4 WHERE CustomerID=4
insert into BillingOfRooms VALUES(1,'2019-01-03',NULL,0,0,NULL,1)
insert into BillingOfRooms VALUES(2,'2019-05-01',NULL,0,0,NULL,2)
insert into BillingOfRooms VALUES(3,'2019-05-02',NULL,0,0,NULL,3)
insert into BillingOfRooms VALUES(4,'2019-05-04',NULL,0,0,NULL,4)
select * FROM Hotel
Select * FROM Employee
Select * FROM Floor
Select * FROM Rooms
select * FROM Customer
select * From service
select * FROM BillingOfRooms
select * FROM Membership


--s1 wifi:available for all 3 floors
--s2 spa:only for luxury
--s3 meeting rooms:only for business
--s4 live music:only for luxury
--s5 room service : available for all
--s6 airport pick up service:available for business only
--s7 laundry and dry cleaning available for all

INSERT INTO service VALUES(1,'Wifi',0)
INSERT INTO service Values(2,'Spa',15000)
INSERT INTO service Values(3,'Meeting Rooms',17500)
Insert into service values(4,'Live Music',8000)
Insert into service values(5,'Room Service',7500)
Insert into service values(6,'Airport Pick-Up',3000)
Insert into service values(7,'Laundry And Dry Cleaning',5000)
Alter table Customer drop column ServiceID
--1
select * FROM CustomerServices
drop procedure selectServices 
Create procedure selectServices @customerID int,@serviceID int, @output int OUTPUT
AS
begin
declare @floorNo int
declare @roomNo int
if(not exists (Select * FROM Customer WHERE CustomerID=@customerID))
begin
set @output=2;
return;
end
select @roomNo=Room_Booked From Customer WHERE Customer.CustomerID=@customerID
if(@roomNo is NULL)
begin
set @output=3;
return;
end
select @floorNo=floorid FROM Rooms Where Rooms.roomid=@roomNo
set @output=0;
if(@floorNo=1 AND @serviceID IN(2,3,4,6))
begin
print'The chosen service is not offered on your floor.You can only choose from the following services :'
print'ID   Service'
print'1    WIFI'
print'5    Room Service'
print'7    Laundry and Dry Cleaning' 
set @output=1;--1 means chosen service not available at the user's floor
end
else if(@floorNo=2 AND @serviceID IN(2,4))
begin
print'The chosen service is not offered on your floor.You can only choose from the following services :'
print'ID   Service'
print'1    WIFI'
print'3    Meeting Rooms'
print'5    Room Service'
print'6    Airport Pick-Up'
print'7    Laundry and Dry Cleaning'  
set @output=1;--1 means chosen service not available at the user's floor
end
else if(@floorNo=3 AND @serviceID IN(3,6))
begin
print'The chosen service is not offered on your floor.You can only choose from the following services :'
print'ID   Service'
print'1    WIFI'
print'2    Spa'
print'4    Live Music'
print'5    Room Service'
print'7    Laundry and Dry Cleaning' 
set @output=1;--1 means chosen service not available at the user's floor  
end
else
begin
Insert into CustomerServices Values (@customerID,@serviceID);
declare @serviceCharges float
select @serviceCharges=[service].cost FROM [service] where id=@serviceID
Update BillingOfRooms
set balance+=@serviceCharges
Where CustomerId=@customerID
end
end

execute selectServices @customerID=8,@serviceID=2

--2
drop procedure billing
create procedure billing @customerID int,@checkInDate Date,@output float OUTPUT
AS
begin
declare @floorNum int
declare @roomNum int
declare @sid int
declare @bid int
if(not exists (Select * FROM Customer WHERE CustomerID=@customerID))
begin
set @output=-1
return
end
if(not exists (Select * FROM BillingOfRooms WHERE customerID=@customerID AND CheckInDate=@checkInDate))
begin
set @output=-3
return
end
select @roomNum=Room_Booked From Customer WHERE Customer.CustomerID=@customerID
if(@roomNum is NULL)
begin
set @output=-2
return;
end
set @output=0
select @floorNum=floorid FROM Rooms Where Rooms.roomid=@roomNum

declare @rate float
if(@floorNum=1)
begin
set @rate=15000
end
else if(@floorNum=2)
begin
set @rate=25000 
end
else
begin 
set @rate=50000
end

select @output=balance FROM BillingOfRooms WHERE CustomerId=@customerID AND CheckInDate=@checkInDate -- for service charges
set @output+=@rate*DATEDIFF(day,@checkInDate,getDate())


--call discounts and promotions and display Total Amount Due
end

execute billing @customerID=8

--3 
drop procedure checkOut
create procedure checkOut @customerID int,@modeOfPayment nvarchar(50),@checkindate date,@totalBill float OUTPUT
as 
begin 
declare @room int;
if(not exists(Select *  FROM Customer WHERE CustomerID=@customerID))
begin
set @totalBill=-1 --cutomerID does not exist
return
end
select @room=Room_Booked from Customer WHERE CustomerID=@customerID
if(@room is NULL)
begin
set @totalBill=-2-- no room reserved yet
return
end
Update Rooms set availabilty=1 WHERE roomid=@room
--calculates bill
declare @bill float
execute billing @customerID=@customerID,@checkIndate=@checkindate,
@output=@bill OUTPUT
if(@bill >0)
begin
Update BillingOfRooms
set CheckOutDate=getDate()
Where CustomerId=@customerID AND CheckInDate=@checkindate

Update BillingOfRooms
set balance=0,AmountPaid=@bill,ModeOfPayment=@modeOfPayment
Where CustomerId=@customerID AND CheckInDate=@checkindate
set @totalBill=1;
Update Customer 
set Room_Booked=NUll WHERE CustomerID=@customerID
end
else set @totalBill=0;
end
execute checkOut @customerID=8,@modeOfPayment='credit card'
select * FROM Customer
Select * FROM BillingOfRooms
select * from rooms
select * FROM MemberShip
--4
select * FROM employee
select * FROM Hotel
drop procedure deleteUser
create procedure deleteUser @userID int ,@type nvarchar(50),@output int OUTPUT
As 
begin 
if(@type='Customer')
begin
if(exists(Select * FROM Customer Where CustomerID=@userID))
begin
set @output=1;
delete from BillingOfRooms WHERE CustomerId=@userID
Update Rooms set customerid=Null Where customerid=@userID
Delete FROM CustomerServices WHERE CustomerID=@userID
Delete FROM Customer Where CustomerID=@userID
end
end
if(@type='Employee')
begin
 if (exists( Select * FROM Employee Where EmployeeID=@userID))
begin
set @output=1;
Update Hotel set Director=NULL where Director=@userID
Delete from Employee Where EmployeeID=@userID
end
end
else
set @output=0;
end
declare @result int
exec  deleteUser @userID=2,@type='Customer',@output=@result OUTPUT
select * FROM Customer


--5 (list of available rooms in required hotel and floor)
create procedure listOFavailableRooms @hotel_id int ,@floor_id int
as 
begin

select roomid, floorid, hotelno from Rooms where (floorid = @floor_id AND  hotelno = @hotel_id and availabilty = 1)

end


exec listOFavailableRooms  @floor_id = 3, @hotel_id = 1
drop procedure listOFavailableRooms 
select * from Rooms
insert into Rooms values(2,1,2,0,1)
insert into Rooms values(3,2,3,0,1)
insert into Rooms values(4,3,1,0,1)
insert into Rooms values(5,3,1,1,1)
insert into Rooms values(6,1,1,1,1)
insert into Rooms values(7,2,1,1,1)
insert into Rooms values(8,3,1,1,1)

select * FROM Employee
select * FROM Floor
select * FROM Hotel
select * FROM Rooms
select * FROM Membership
select * FROM Customer
--6
--employees of a particular floor of a particular hotel

create procedure employeeOFfloorOFhotel @hotel_id int ,@floor_id int

as 
begin
select EmployeeID , Name , ContactNo, Designation, Salary, Employee.HotelID from Employee join Floor
on Employee.HotelID = Floor.HotelId
where Employee.HotelID = @hotel_id and FloorNumber = @floor_id

end
exec  employeeOFfloorOFhotel @floor_id = 2, @hotel_id = 3

-- 7 sign up

DROP PROCEDURE signup_user
create procedure signup_user 
@name nvarchar(50) , @email nvarchar(50) , @phone nvarchar(15), @cnic nvarchar(15) ,
 @address nvarchar(100), @uname nvarchar(50), @pswrd nvarchar(10), @output int OUTPUT
As
begin
declare @customerid int , @membershipid int
declare @expdate date
if exists (select * From MemberShip where Username=@uname)
	Begin
	set @output=0 --user id is not unique
	return
	End
set @expdate = (select DATEADD(year, 1, GETDATE()))
set @customerid  = ( select max(Customer.CustomerID) from Customer)
set @customerid  = @customerid  + 1

set @membershipid = (select max(MemberShip.MemberShipID) from MemberShip)
set @membershipid = @membershipid + 1

print ' A new row is added into the customers and now this customer can book any room.'
insert into Customer values(@customerid , @name , @phone, @membershipid , @cnic ,@address ,NULL ,NULL , NULL,@email)

print ' A new row is added into the Members and now this Member can many amazing sevices discounts and promotions.'
insert into MemberShip values (@membershipid , GETDATE() , @expdate ,0, @uname , @pswrd)
set @output=@customerid
end

declare @out int
exec signup_user @name ='abc' , @email = 'accd@gmai' , @phone = '03244545454' , @cnic = '35202-2222222-2',
 @address = 'hkggkeckgkg', @uname = 'hello123', @pswrd = '123456789', @output=@out OUT
Select @out


select * FROM MemberShip


insert into MemberShip values (1, '12-12-12', '12-12-12', 2, 'Ahmad', 'Ahmad123')

insert into MemberShip values(2, '12-12-12', '12-12-13', 3, 'Owais', 'Owais123')

--8
drop procedure Login_For_Members

create procedure Login_For_Members
@username varchar(50), @password varchar(10), @message int output

as
begin
if exists (select Username from MemberShip where Username = @username)
begin
if exists (select [Password] from MemberShip where [Password] = @password and Username = @username)
begin
set @message =  1 --'Logged in successfully.'
print @message
end
else 
begin
set @message = 0 --'Incorrect Password.'
print @message
end
end
else
begin
set @message = -1 --'Incorrect Username.'
print @message
end
end

declare @message1 int

exec Login_For_Members
@username = 'Ahmad',
@password = 'AhmadFaraz123',
@message = @message1 output

select @message1 as Message


select * from floor
Update Floor set Type='Luxury' WHERE Type='Luxory'
select * FROM Hotel
select * FROM Rooms
select * FROM Customer

--9	
drop procedure RoomReservation

create procedure RoomReservation
@floorType nvarchar(100), @city nvarchar(20),
@check_in_date date, @check_out_date date, @name nvarchar(50), @contactNo nvarchar(15),@cnic nvarchar(50), @address nvarchar(60), @emailId nvarchar(50), @output int output
as 
begin 
declare @a int;
declare @custId int;
declare @newBillId int


declare @floorid int,@hotelid int
select @floorid=FloorNumber from Floor where [Type]=@floorType
select @hotelid=HotelId from Hotel where city=@city

declare @roomid int
if(Exists(Select * FROM Rooms WHERE availabilty=1 AND floorid=@floorid AND hotelno=@hotelid))
begin
set @output=1
Select @roomid=roomid FROM Rooms WHERE availabilty=1 AND floorid=@floorid AND hotelno=@hotelid
update Rooms set Rooms.availabilty = 0 where roomId = @roomid and floorId = @floorid and hotelno = @hotelid
select @custId = max(customerid) from Customer 
set @custId=@custId+1
insert into Customer values(@custId, @name, @contactNo,NULL, @cnic, @address, @roomId,NULL,NULL, @emailId)
update Rooms set customerid = @custId where roomId = @roomid
select @newBillId = max(BillId)+1 from BillingOfRooms
update BillingOfRooms set CheckInDate = @check_in_date where CustomerId = @custId
update BillingOfRooms set CheckOutDate = @check_out_date where CustomerId = @custId
insert into BillingOfRooms values(@newBillId,@check_in_date,@check_out_date,0,0,'',@custId)

return
end
set @output=0 -- no vacancies
end

select * FROM Rooms
update rooms set availabilty=1 where roomid=3
select * FROM Customer
select * From Floor 
select * from Hotel 
select * FROM BillingOfRooms
declare @param int
exec RoomReservation
@floorType='Luxury',
@city='Islamabad',
@check_in_date = '2019-03-24',
@check_out_date = '2019-03-26',
@name = 'Aima Rehman', 
@contactNo = '03236445152', 
@cnic = '36103-3103160-7',
@address = '67-c Model Town', 
@emailId = 'abc@gmail.com',
@output=@param OUTPUT
select @param

--
drop procedure RoomReservation
select * FROM Customer
select * FROM Rooms
select * from Hotel
select * from MemberShip
create procedure MemberRoomReservation
@floorType nvarchar(100), @city nvarchar(20),
@check_in_date date, @check_out_date date,@customerID int, @output int output
as 
begin 
declare @a int;
declare @newBillId int


declare @floorid int,@hotelid int
select @floorid=FloorNumber from Floor where [Type]=@floorType
select @hotelid=HotelId from Hotel where city=@city
declare @roomid int
select @roomid=Room_Booked From Customer WHERE CustomerID=@customerID
if(@roomid is NOT NULL)
begin
set @output=-2--already has a room booked
return
end 
if(Exists(Select * FROM Rooms WHERE availabilty=1 AND floorid=@floorid AND hotelno=@hotelid))
begin
set @output=1
Select @roomid=roomid FROM Rooms WHERE availabilty=1 AND floorid=@floorid AND hotelno=@hotelid
update Rooms set Rooms.availabilty = 0 where roomId = @roomid and floorId = @floorid and hotelno = @hotelid

update Rooms set customerid = @customerID where roomId = @roomid
select @newBillId = max(BillId)+1 from BillingOfRooms
insert into BillingOfRooms values(@newBillId,@check_in_date,@check_out_date,0,0,'',@customerID)

return
end
set @output=0 -- no vacancies
end

--10
create procedure foodOrder
@customerID int
as begin
declare @price int
select @price=price from roomService
join FoodMenu on roomService.MealID = FoodMenu.MealId
where roomService.customerID = @customerID

Update BillingOfRooms
set Balance= Balance+@price
Where CustomerId=@customerID

end


execute foodOrder
@customerID = 1

--11
create procedure ApplyDiscount
@memberID int
as begin
declare @joinDate date
declare @expireDate date
declare @discountID int
declare @discountAmount int
declare @amountDue int
declare @amountDueAfterDiscount int
declare @customerID int

select @joinDate=MembershipDate,@expireDate = MembershipExpiry from MemberShip
where MemberShipID = @memberID
if( ((year(GETDATE())-year(@joinDate))>1) and @expireDate>GETDATE() )
begin 
update Customer
set discountID = 1 
where MemberShipID = @memberID

if exists(select discountID from Customer where CustomerID=@customerID)
begin
select @discountID = discountID from Customer where CustomerID=@customerID
select @customerID = CustomerID from Customer
where MemberShipID = @memberID

select @discountAmount=discountAmount from discounts
join MemberShip on MemberShip.DiscountID = discounts.id
join Customer on Customer.MemberShipID = MemberShip.MemberShipID
where discounts.id=@discountID and Customer.CustomerID=@customerID

select @amountDue = balance from BillingOfRooms
where BillingOfRooms.CustomerId = @customerID

set @amountDueAfterDiscount = @amountDue-@discountAmount
Update BillingOfRooms
set Balance=@amountDueAfterDiscount
Where CustomerId=@customerID
end

end

else 
begin
print'User is not eligible for discount'
end

end

execute ApplyDiscount
@memberID=1

--12
create procedure applyPromoCode
@code nvarchar(10),
@customerID int
as begin
if exists(select code from promoCodes where code=@code)
begin
declare @PromotionID int
select @promotionID = promotionID from promoCodes
where code = @code

declare @discountPercentage int
declare @amountDue int
declare @amountDueAfterDiscount int

select @discountPercentage=discountPercentage from promotions
join Customer on Customer.PromotionID = promotions.id
where promotions.id=@PromotionID and Customer.CustomerID=@customerID

select @amountDue = balance from BillingOfRooms
where BillingOfRooms.CustomerId = @customerID

set @amountDueAfterDiscount = @amount
Due-(@amountDue*(@discountPercentage/100))

Update BillingOfRooms
set Balance=@amountDueAfterDiscount
Where CustomerId=@customerID

end

else

begin
print'Promo code you entered is incorrect'
end

end

execute applyPromoCode
@code = '12345678',@customerID=1


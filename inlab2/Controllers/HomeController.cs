using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using inlab2.Models;

namespace inlab2.Controllers
{
    public class HomeController : Controller
    {





        public ActionResult login()
        {
            return View();
        }

        //public ActionResult allMembers()
        //{
        //    List<Member> memberList = CRUD.getAllMembers();
        //    return View(memberList);
        //}

        public ActionResult authenticate(string Username, string Password)
        {
            int result = CRUD.checkUserCredentials(Username, Password);
            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("Login", (object)data);
            }
            else if (result == 0)
            {

                String data = "Incorrect Password";
                return View("Login", (object)data);
            }
            else if (result == -2)
            {

                String data = "Incorrect Username";
                return View("Login", (object)data);
            }

            Session["userId"] = Username;
            return View("getStarted");



        }
        public ActionResult getStarted()
        {
            return View();
        }

        public ActionResult homePage()
        {
            return View();
        }
        public ActionResult signup()
        {
            return View();
        }
        public ActionResult addNewMember(string Name, string EmailID, string UserName, string Password, string contactNum, string Address, string CNIC)
        {

            int result = CRUD.populateWithData(Name, EmailID, UserName, Password, contactNum, Address, CNIC);

            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("signup", (object)data);

            }
            else if (result == 0)
            {

                String data = "UserName already taken";
                return View("signup", (object)data);
            }


            Session["userId"] = UserName;
            String id = result.ToString();
            String message = "Your Customer ID is ";
            message = String.Concat(message, id);
            return View("homePage", (object)message);


        }
        public ActionResult Services()
        {
            return View();

        }
        public ActionResult selectService(string CustomerID, string ServiceID)
        {
            int result = CRUD.addNewService(CustomerID, ServiceID);
            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database";
                return View("Services", (object)data);

            }
            if (result == 1)
            {
                String data = "The chosen service is not available at your floor.";
                return View("Services", (object)data);
            }
            if (result == 2)
            {
                String data = "Invalid CustomerID";
                return View("Services", (object)data);

            }
            if (result == 0)
            {
                String data = "Service Activated";
                return View("Services", (object)data);
            }
            if (result == 3)
            {
                String data = "No Room Booked Yet.Go back to reserve a room first";
                return View("Services", (object)data);
            }
            return View("Services");
        }
        public ActionResult Billing()
        {
            return View();
        }
        public ActionResult viewBill(String CustomerID,DateTime CheckInDate)
        {
            float result = CRUD.getBill(CustomerID, CheckInDate);
            if(result==-5)
            {
                String data = "Error while connecting with databse";
                return View("Billing", (object)data);
            }
            if(result==-1)
            {
                String data = "Invalid Customer ID";
                return View("Billing", (object)data);
            }
            if (result == -3)
            {
                String data = "Make sure you checked in at the given date.";
                return View("Billing", (object)data);
            }
            if (result == -2)
            {
                String data = "You currently have no room booked to check out of.";
                return View("Billing", (object)data);
            }
            String value = result.ToString();
            String data1 = "Your total bill is ";
            data1 = String.Concat(data1, value);
            return View("checkout",(object)data1);
        }
        public ActionResult BillPaid(String Password, String CustomerID, String ModeOfPayment,DateTime CheckInDate)
        {
            float result = CRUD.payment(Password, CustomerID, ModeOfPayment,CheckInDate);
            if(result==-1)
            {
                String data = "Invalid Customer ID";
                return View("checkout", (object)data);
            }
            if (result == -3)
            {
                String data = "Error while connecting with the database";
                return View("checkout", (object)data);
            }
            if (result == -2)
            {
                String data = "You currently have no room booked to check out of.";
                return View("checkout", (object)data);
            }
            return View();
        }
        public ActionResult restricted()
        {
            return View();
        }
        public ActionResult delete(String Password,String UserID,String UserType)
        {
            int result = CRUD.deleteUser(UserID,UserType);
            if (result == -1)
            {
                String data = "Error while connecting with the database";
                return View("restricted", (object)data);
            }
            if (result == 0)
            {
                String data = "Given User does not exist";
                return View("restricted", (object)data);
            }
            return View();
        }

  
public ActionResult ReserveRoom(String name,String emailId,String contactNumber,String address,String cnic,String FloorType,String HotelCity,DateTime checkInDate,DateTime checkOutDate)
        {
            int result = CRUD.ReservationOfRooms(name,emailId,contactNumber,address,cnic,FloorType,HotelCity,checkInDate,checkOutDate);
            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("ReservationOfRooms", (object)data);
            }
            if(result==0)
            {
                String data = "No vacancies";
                return View("ReservationOfRooms", (object)data);
            }
            return View("RoomReserved");
        }

        //public ActionResult RoomReserved()
        //{
        //    return View();
        //}
        public ActionResult ReservationOfRooms()
        {
            return View();
        }
        public ActionResult RoomReserved()
        {
            return View();
        }
        public ActionResult MemberReservation()
        {
            return View();
        }
        public ActionResult ReserveMember(String customerID, String FloorType, String HotelCity, DateTime checkInDate, DateTime checkOutDate)
         {
            int result = CRUD.reserve(customerID, FloorType, HotelCity, checkInDate, checkOutDate);
            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("MemberReservation", (object)data);
            }
            if (result == 0)
            {
                String data = "No vacancies";
                return View("MemberReservation", (object)data);
            }
            if (result == -2)
            {
                String data = "You already have a room booked.Can't book more than one rooms";
                return View("MemberReservation", (object)data);
            }
            return View("RoomReserved");
         
        }

     

 public ActionResult roomsAvailable()
        {
            return View();
        }
        public ActionResult AvailableRooms(string HotelID, string FloorID)
        {
            List<rooms> Rooms = CRUD.availableRooms(HotelID, FloorID);
            if (Rooms == null)
            {
                String data = "No Rooms Available ";
                return View("roomsAvailable", (object)data);
            }
            Console.Write(Rooms);
            return View(Rooms);
        }
        public ActionResult listOFempl()
        {
            return View();
        }

        public ActionResult emplList(string HotelID, string FloorID)
        {
            List<Employee> emp = CRUD.emplOfaFloor(HotelID, FloorID);
            if (emp == null)
            {
                RedirectToAction("listOFempl");
            }
            Console.Write(emp);
            return View(emp);
        }
     

    }
}
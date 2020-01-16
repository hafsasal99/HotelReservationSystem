using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
namespace inlab2.Models
{
    public class CRUD
    {
        public static string connectionString = "data source=LAPTOP-VG8VDC95\\nSQLExpress; initial Catalog=inlab2; integrated security=true";



        public static int ReservationOfRooms(String name, String emailId, String contactNumber, String address, String cnic, String FloorType, String HotelCity, DateTime checkInDate, DateTime checkOutDate)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result;
            try
            {
                cmd = new SqlCommand("RoomReservation", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;




                cmd.Parameters.Add("@floorType", SqlDbType.NVarChar, 100).Value = FloorType;
                cmd.Parameters.Add("@city", SqlDbType.NVarChar, 20).Value = HotelCity;
                cmd.Parameters.Add("@check_in_date", SqlDbType.Date).Value = checkInDate;
                cmd.Parameters.Add("@check_out_date", SqlDbType.Date).Value = checkOutDate;
                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = name;
                cmd.Parameters.Add("@contactNo", SqlDbType.NVarChar, 15).Value = contactNumber;

                cmd.Parameters.Add("@cnic", SqlDbType.NVarChar, 50).Value = cnic;
                cmd.Parameters.Add("@address", SqlDbType.NVarChar, 60).Value = address;

                cmd.Parameters.Add("@emailId", SqlDbType.NVarChar, 50).Value = emailId;




                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@output"].Value);


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static int reserve(String customerID, String FloorType, String HotelCity, DateTime checkInDate, DateTime checkOutDate)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result;
            try
            {
                cmd = new SqlCommand("MemberRoomReservation", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;




                cmd.Parameters.Add("@floorType", SqlDbType.NVarChar, 100).Value = FloorType;
                cmd.Parameters.Add("@city", SqlDbType.NVarChar, 20).Value = HotelCity;
                cmd.Parameters.Add("@check_in_date", SqlDbType.Date).Value = checkInDate;
                cmd.Parameters.Add("@check_out_date", SqlDbType.Date).Value = checkOutDate;
                cmd.Parameters.Add("@customerID", SqlDbType.Int).Value = customerID;





                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@output"].Value);


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }



        public static int addNewService(string CustomerID, string ServiceID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result;
            try
            {
                cmd = new SqlCommand("selectServices", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;



                cmd.Parameters.Add("@customerID", SqlDbType.Int).Value = CustomerID;
                cmd.Parameters.Add("@serviceID", SqlDbType.Int).Value = ServiceID;

                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@output"].Value);


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }

        public static int populateWithData(string name, string email, string uname, string password, string phone, string address, string cnic)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result;
            try
            {
                cmd = new SqlCommand("signup_user ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;



                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = name;
                cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 15).Value = phone;
                cmd.Parameters.Add("@cnic", SqlDbType.NVarChar, 15).Value = cnic;
                cmd.Parameters.Add("@address", SqlDbType.NVarChar, 100).Value = address;
                cmd.Parameters.Add("@uname", SqlDbType.NVarChar, 50).Value = uname;
                cmd.Parameters.Add("@pswrd", SqlDbType.NVarChar, 10).Value = password;
                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@output"].Value);


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        //public static List<Member> getAllMembers()
        //{
        //    return Members;
        //}


        //    public static int deleteUser(int id)
        //{
        //    int result;
        //    SqlConnection con = new SqlConnection(connectionString);
        //    con.Open();
        //    SqlCommand cmd;
        //    cmd = new SqlCommand("delteUser", con);

        //    try
        //    {
        //        cmd.Parameters.Add("id", SqlDbType.int).value = id
        //        cmd.ExecuteNonQuery();
        //        result = Convert.ToInt32(cmd.Parameters["@deleted"].value);
        //    }
        //    catch
        //    {
        //        println("error");
        //    }
        //}

        public static int checkUserCredentials(string ID, string password)
        {


            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = -1;

            try
            {
                cmd = new SqlCommand("Login_For_Members", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = ID;
                cmd.Parameters.Add("@password", SqlDbType.VarChar, 10).Value = password;


                cmd.Parameters.Add("@message", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@message"].Value);



            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static float getBill(String customerID, DateTime checkindate)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = -5;

            try
            {
                cmd = new SqlCommand("billing", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@customerID", SqlDbType.Int).Value = customerID;
                cmd.Parameters.Add("@checkInDate", SqlDbType.Date).Value = checkindate;


                cmd.Parameters.Add("@output", SqlDbType.Float).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@output"].Value);



            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -5; //-5 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;


        }
        public static float payment(String Password, String CustomerID, String ModeOfPayment, DateTime CheckInDate)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = -3;

            try
            {
                cmd = new SqlCommand("checkOut", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@customerID", SqlDbType.Int).Value = CustomerID;
                cmd.Parameters.Add("@modeOfPayment", SqlDbType.NVarChar, 50).Value = ModeOfPayment;
                cmd.Parameters.Add("@checkindate", SqlDbType.Date).Value = CheckInDate;

                cmd.Parameters.Add("@totalBill", SqlDbType.Float).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@totalBill"].Value);



            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -3; //-3 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static int deleteUser(String UserID, String UserType)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = -1;

            try
            {
                cmd = new SqlCommand("deleteUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@userID", SqlDbType.Int).Value = UserID;
                cmd.Parameters.Add("@type", SqlDbType.NVarChar, 50).Value = UserType;

                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@output"].Value);



            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-3 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }



        public static List<rooms> availableRooms(string HotelID, string FloorID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            //int result;
            try
            {
                cmd = new SqlCommand("listOFavailableRooms", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@hotel_id", SqlDbType.Int).Value = Int32.Parse(HotelID);
                cmd.Parameters.Add("@floor_id", SqlDbType.Int).Value = Int32.Parse(FloorID);

                SqlDataReader rdr = cmd.ExecuteReader();

                List<rooms> list = new List<rooms>();

                while (rdr.Read())
                {
                    rooms Room = new rooms();

                    Room.roomId = rdr["roomId"].ToString();
                    Room.floorId = rdr["floorId"].ToString();
                    Room.hotelId = HotelID;

                    list.Add(Room);
                }
                rdr.Close();
                con.Close();

                return list;

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
        }
        //public static User getUserByUserName(String rollNum)
        //{
        //    foreach (User u in users)
        //    {
        //        if (u.rollNum == rollNum)
        //            return u;
        //    }
        //    return null;
        //}
        // }
        public static List<Employee> emplOfaFloor(string HotelID, string FloorID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("employeeOFfloorOFhotel", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@hotel_id", SqlDbType.Int).Value = Int32.Parse(HotelID);
                cmd.Parameters.Add("@floor_id", SqlDbType.Int).Value = Int32.Parse(FloorID);
                SqlDataReader rdr = cmd.ExecuteReader();
                List<Employee> list = new List<Employee>();

                while (rdr.Read())
                {
                    Employee emp = new Employee();

                    emp.EmployeeID = rdr["EmployeeID"].ToString();
                    emp.Name = rdr["Name"].ToString();
                    emp.ContactNo = rdr["ContactNo"].ToString();
                    emp.Designation = rdr["Designation"].ToString();
                    emp.Salary = rdr["Salary"].ToString();
                    emp.HotelID = rdr["HotelID"].ToString();

                    list.Add(emp);
                }
                rdr.Close();
                con.Close();

                return list;

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }

        }
    }
    
    }
    

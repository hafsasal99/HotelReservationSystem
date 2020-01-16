using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace inlab2.Models
{
    public class Member
    {
        static int  count=0;
        public int MemberID;
        public string password;
        public string EmailID;
        public string Name;
        public string contactNum;
        public string CNIC;
        public string Address;
        public string MembershipDate;
        public Member(string Name, string EmailID, string Password, string contactNum="", string Address="", string CNIC="")
        {
            this.EmailID = EmailID;
            this.password = Password;
            this.Name = Name;
            this.MembershipDate = DateTime.Now.ToShortDateString();
            this.contactNum = contactNum;
            this.CNIC = CNIC;
            this.Address = Address;
        }
    }
   
}
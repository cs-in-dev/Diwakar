using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Mail;

namespace CyraShop
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string InsertQuery(Query1 Query)
        {
            try
            {
                //string QueryDate = DateTime.Now.ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                SqlCommand cmd = new SqlCommand("Insert Into Requestquery(Name,Email,Subject,[Description],QueryDate) values(@Name,@Email,@Subject,@Description,getdate())", con);
                cmd.Parameters.AddWithValue("@Name", Query.name);
                cmd.Parameters.AddWithValue("@Email", Query.email);
                cmd.Parameters.AddWithValue("@Subject", Query.Sub);
                cmd.Parameters.AddWithValue("@Description", Query.discription);
               // cmd.Parameters.AddWithValue("@QueryDate", QueryDate);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                string Msg = "Name : " + Query.name + ", Email id : " + Query.email + ", Message : " + Query.discription + "";
                Gen obj = new Gen();
               // obj.SendEmail("Info@diwakarretail.com", Msg, "Contact us Query", "diwakarretail2017@gmail.com");
              
            }
            catch (Exception ex)
            {
            }
            return "success";


        }

        public class Query1
        {
            public string name  { get; set; }
            public string email { get; set; }
            public string Sub { get; set; }
            public string discription { get; set; }


        }
    }
}
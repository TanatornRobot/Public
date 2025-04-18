using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
namespace Public.View
{
	public partial class PersonalDetailsLisView : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string phone = txtPhone.Text.Trim();

            if (firstName == "" || lastName == "" || phone == "")
            {
                lblMessage.Text = "กรุณากรอกข้อมูลให้ครบถ้วน";
                return;
            }

            string connString = "Host=switchyard.proxy.rlwy.net;Port=40989;Username=postgres;Password=huMpIDFFLPuxIzdfHSgoDUhYxwpwBbkW;Database=railway";

            using (NpgsqlConnection conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                string sql = "INSERT INTO pesonaldata2 (first_name, last_name, phone) VALUES (@fname, @lname, @phone)";
                using (NpgsqlCommand cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("fname", firstName);
                    cmd.Parameters.AddWithValue("lname", lastName);
                    cmd.Parameters.AddWithValue("phone", phone);
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "บันทึกข้อมูลเรียบร้อยแล้ว!";
            }

        }
    }
}
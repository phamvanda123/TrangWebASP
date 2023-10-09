using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP.admin
{
    public partial class QuanLyKhachHang : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void ThemSP_Click(object sender, EventArgs e)
        {
            string taiKhoan = txtTaiKhoan.Text;
            string matKhau = txtMatKhau.Text;
            string hoTen = txtHoTen.Text;
            string diaChi = txtDiaChi.Text;
            string sdt = txtSDT.Text;
            string email = txtEmail.Text;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO KhachHang (TaiKhoan, MatKhau, HoTen, DiaChi, SDT, Email) " +
                               "VALUES (@TaiKhoan, @MatKhau, @HoTen, @DiaChi, @SDT, @Email)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
                command.Parameters.AddWithValue("@MatKhau", matKhau);
                command.Parameters.AddWithValue("@HoTen", hoTen);
                command.Parameters.AddWithValue("@DiaChi", diaChi);
                command.Parameters.AddWithValue("@SDT", sdt);
                command.Parameters.AddWithValue("@Email", email);
                try
                {
                    command.ExecuteNonQuery();
                    txtTaiKhoan.Text = string.Empty;
                    txtMatKhau.Text = string.Empty;
                    txtHoTen.Text = string.Empty;
                    txtDiaChi.Text = string.Empty;
                    txtSDT.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Thêm Khách hàng thành công');", true);
                    Response.Redirect(Request.RawUrl);
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Thêm Khách hàng không thành công');", true);
                }
                connection.Close();
            }
           

        }
    }
}
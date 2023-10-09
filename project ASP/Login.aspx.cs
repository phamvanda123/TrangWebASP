using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];

            // Kiểm tra cookie có tồn tại hay không
            if (userInfo != null)
            {
                Response.Redirect("NguoiDung.aspx");
            }
        }

        protected void btn_DangNhap_Click(object sender, EventArgs e)
        {
            if(txt_TaiKhoan.Text =="admin" && txt_MatKhau.Text == "123")
            {
                Response.Redirect("~/admin/Home.aspx");
            }
            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
            conn.Open();
            string query = "SELECT COUNT(*) FROM KhachHang WHERE TaiKhoan = @TaiKhoan AND MatKhau = @MatKhau";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@TaiKhoan", txt_TaiKhoan.Text);
            command.Parameters.AddWithValue("@MatKhau", txt_MatKhau.Text);
            int count = (int)command.ExecuteScalar();
            if (count > 0)
            {
                HttpCookie userInfo = new HttpCookie("UserInfo");
                userInfo["TaiKhoan"] = txt_TaiKhoan.Text;
                userInfo["MatKhau"] = txt_MatKhau.Text;
                userInfo.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(userInfo);
                ShowSweetAlert("Thông báo", "Bạn Đã Đăng Nhập Thành Công", "success", 1);
            }
            else
            {
                ShowSweetAlert("Thông Báo", "Đăng nhập không thành công", "error", 2);
            }

            conn.Close();

        }
        protected void ShowSweetAlert(string title, string message, string type, int link)
        {
            string script = "";
            if (link == 1)
            {
                script = $@"
    <script>
        swal({{
            title: '{title}',
            text: '{message}',
            type: '{type}',
            confirmButtonText: 'OK'
        }}).then(function() {{
            window.location.href = 'NguoiDung.aspx';
        }});
    </script>";
            }
            else if (link == 2)
            {
                script = $@"
    <script>
        swal({{
            title: '{title}',
            text: '{message}',
            type: '{type}',
            confirmButtonText: 'OK'
        }}).then(function() {{
        }});
    </script>";
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, false);
        }


    }
}
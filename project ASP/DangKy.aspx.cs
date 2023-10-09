using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (KiemTraTaiKhoanTonTai(txt_TaiKhoan.Text))
            {
                ShowSweetAlert("Lỗi", "Đăng Ký không Thành Công tài khoản đã tồn tại", "error");
            }
            else
            {
                try
                {
                    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
                    conn.Open();
                    string sql = "INSERT INTO KhachHang (TaiKhoan, MatKhau, HoTen, DiaChi, SDT, Email) VALUES (@TaiKhoan, @MatKhau, @HoTen, @DiaChi, @SDT, @Email)";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@TaiKhoan", txt_TaiKhoan.Text);
                    cmd.Parameters.AddWithValue("@MatKhau", txt_MatKhauDangKy.Text);
                    cmd.Parameters.AddWithValue("@HoTen", txt_HoTen.Text);
                    cmd.Parameters.AddWithValue("@DiaChi", txt_DiaChi.Text);
                    cmd.Parameters.AddWithValue("@SDT", txt_SDT.Text);
                    cmd.Parameters.AddWithValue("@Email", txt_Email.Text);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    ShowSweetAlert("Thông Báo", "Đăng Ký Thành Công", "success");
                }
                catch (Exception ex)
                {
                    ShowSweetAlert("Lỗi", "Đăng Ký không Thành Công lỗi " + ex.Message, "error");
                }
            }
           


        }
        protected void ShowSweetAlert(string title, string message, string type)
        {
            string script = $@"
                <script>
                    swal({{
                        title: '{title}',
                        text: '{message}',
                        type: '{type}',
                        confirmButtonText: 'OK'
                    }}).then(function() {{
                        
                    }});
                </script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, false);
        }
        public bool KiemTraTaiKhoanTonTai(string taiKhoan)
        {
            bool taiKhoanTonTai = false;
            try
            {
                SqlConnection conn = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
                conn.Open();
                string sql = "SELECT COUNT(*) FROM KhachHang WHERE TaiKhoan = @TaiKhoan";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    taiKhoanTonTai = true;
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                
            }
            return taiKhoanTonTai;
        }

    }
}
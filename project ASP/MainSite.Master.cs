using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class MainSite : System.Web.UI.MasterPage
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            if (userInfo != null)
            {
                string taiKhoan = userInfo["TaiKhoan"];
                connection.Open();
                string query = "SELECT Sum(SoLuong) FROM GioHang WHERE TaiKhoan = @TaiKhoan";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
                object kq = command.ExecuteScalar();
                if(kq != null)
                {
                    try
                    {
                        int soluong = (int)kq;
                        SoluongSP.Attributes["count"] = soluong.ToString();
                    }
                    catch
                    {

                    }
                   
                }
            }
            
        }
    }
}
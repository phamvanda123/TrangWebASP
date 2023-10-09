using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP.admin
{
    public partial class Home : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        void LoadData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Tổng số lượng đơn đặt hàng
                string queryTongDonHang= "SELECT COUNT(*) FROM DonDatHang";
                SqlCommand command = new SqlCommand(queryTongDonHang, connection);
                int TongSLDon = (int)command.ExecuteScalar();

                // Tổng tiền bán được
                string queryTongTien = "SELECT SUM(TongTien) FROM DonDatHang";
                command = new SqlCommand(queryTongTien, connection);
                int TongTienBanDuoc = 0;
                object result = command.ExecuteScalar();
                if (result != DBNull.Value)
                {
                    TongTienBanDuoc = Convert.ToInt32(result);
                }
                string queryTongTaiKhoan = "SELECT COUNT(*) FROM khachHang";
                command = new SqlCommand(queryTongTaiKhoan, connection);
                int TongTaiKhoan = (int)command.ExecuteScalar();
                string querySoLuongTon = "SELECT Sum(SoLuong) FROM SanPham";
                command = new SqlCommand(querySoLuongTon, connection);
                int SoLuongTon = (int)command.ExecuteScalar();

                connection.Close();
                SanPhamTon.InnerText = SoLuongTon.ToString()+ " Sản Phẩm";
                SLTaiKhoan.InnerText = TongTaiKhoan.ToString()+" Tài Khoản";
                // Hiển thị thông tin tổng kết
                TongDonDatHang.InnerText = TongSLDon.ToString()+" Đơn";
                TongDoanhThu.InnerText = TongTienBanDuoc.ToString("N0")+"Đ";
            }
        }
    }
}
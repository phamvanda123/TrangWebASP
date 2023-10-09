using project_ASP.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class GioHang : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDaTa();
        }
        void LoadDaTa()
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            if (userInfo == null)
            {
                return;
            }
            string taiKhoan = userInfo["TaiKhoan"];
            string query = "select SanPham.MaSP,GioHang.SoLuong,TenSP,ImageSanPham,DonGia from GioHang,SanPham where giohang.MaSP = SANPHAM.MaSP and  TaiKhoan = '"+taiKhoan+"'";
            List<GioHangClass> listSP = new List<GioHangClass>();
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                GioHangClass sp = new GioHangClass();
                sp.MaSP = reader.GetString(reader.GetOrdinal("MaSP"));
                sp.TenSP = reader.GetString(reader.GetOrdinal("TenSP"));
                sp.DonGia = reader.GetInt32(reader.GetOrdinal("DonGia")).ToString("N0");
                sp.ImageSanPham = reader.GetString(reader.GetOrdinal("ImageSanPham"));
                sp.SoLuong = reader.GetInt32(reader.GetOrdinal("SoLuong"));
                sp.TongTien = (reader.GetInt32(reader.GetOrdinal("SoLuong"))* reader.GetInt32(reader.GetOrdinal("DonGia"))).ToString("N0");
                listSP.Add(sp);
            }
            connection.Close();
            Repeater1.DataSource = listSP;
            Repeater1.DataBind();
        }
        protected void DeleteSP(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            LinkButton btn = (LinkButton)sender;
            string maSP = btn.CommandArgument;
            string taiKhoan = userInfo["TaiKhoan"];
            connection.Open();
            string query = "delete from giohang WHERE TaiKhoan = @TaiKhoan AND MaSP = @MaSP";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
            command.Parameters.AddWithValue("@MaSP", maSP);
            object kq = command.ExecuteNonQuery();
            Response.Redirect(Request.RawUrl);
        }
        protected void TangSP(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            LinkButton btn = (LinkButton)sender;
            string maSP = btn.CommandArgument;
            string taiKhoan = userInfo["TaiKhoan"];
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT SoLuong FROM GioHang WHERE TaiKhoan=@taiKhoan AND MaSP=@maSP", connection);
            cmd.Parameters.AddWithValue("@taiKhoan", taiKhoan);
            cmd.Parameters.AddWithValue("@maSP", maSP);
            int soLuong = Convert.ToInt32(cmd.ExecuteScalar());
            soLuong++;
            cmd = new SqlCommand("UPDATE GioHang SET SoLuong=@soLuong WHERE TaiKhoan=@taiKhoan AND MaSP=@maSP", connection);
            cmd.Parameters.AddWithValue("@soLuong", soLuong);
            cmd.Parameters.AddWithValue("@taiKhoan", taiKhoan);
            cmd.Parameters.AddWithValue("@maSP", maSP);
            cmd.ExecuteNonQuery();
            connection.Close();
            Response.Redirect(Request.RawUrl);
        }
        protected void GiamSP(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            LinkButton btn = (LinkButton)sender;
            string maSP = btn.CommandArgument;
            string taiKhoan = userInfo["TaiKhoan"];
            connection.Open();
            // Lấy số lượng sản phẩm hiện có trong giỏ hàng
            SqlCommand cmd = new SqlCommand("SELECT SoLuong FROM GioHang WHERE TaiKhoan=@taiKhoan AND MaSP=@maSP", connection);
            cmd.Parameters.AddWithValue("@taiKhoan", taiKhoan);
            cmd.Parameters.AddWithValue("@maSP", maSP);
            int soLuong = Convert.ToInt32(cmd.ExecuteScalar());

            // Giảm số lượng sản phẩm trong giỏ hàng
            if (soLuong > 0)
            {
                soLuong--;
                cmd = new SqlCommand("UPDATE GioHang SET SoLuong=@soLuong WHERE TaiKhoan=@taiKhoan AND MaSP=@maSP", connection);
                cmd.Parameters.AddWithValue("@soLuong", soLuong);
                cmd.Parameters.AddWithValue("@taiKhoan", taiKhoan);
                cmd.Parameters.AddWithValue("@maSP", maSP);
                cmd.ExecuteNonQuery();
            }

            // Xóa hàng hóa khỏi giỏ hàng nếu số lượng bằng 0
            if (soLuong == 0)
            {
                cmd = new SqlCommand("DELETE FROM GioHang WHERE TaiKhoan=@taiKhoan AND MaSP=@maSP", connection);
                cmd.Parameters.AddWithValue("@taiKhoan", taiKhoan);
                cmd.Parameters.AddWithValue("@maSP", maSP);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect(Request.RawUrl);
            connection.Close();
        }

    }
}
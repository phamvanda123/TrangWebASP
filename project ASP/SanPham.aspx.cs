using project_ASP.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class SanPham : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDaTa();

        }
        void LoadDaTa()
        {
            string query = "SELECT * FROM SanPham";
            List<SanPhamClass> listSP = new List<SanPhamClass>();
            connection.Open();
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                SanPhamClass sp = new SanPhamClass();
                sp.MaSP = reader.GetString(reader.GetOrdinal("MaSP"));
                sp.TenSP = reader.GetString(reader.GetOrdinal("TenSP"));
                sp.DonGia = reader.GetInt32(reader.GetOrdinal("DonGia"));
                sp.KhuyenMai = reader.GetInt32(reader.GetOrdinal("KhuyenMai"));
                sp.ImageSanPham = reader.GetString(reader.GetOrdinal("ImageSanPham"));
                sp.DanhGia = convertDanhGia(reader.GetInt32(reader.GetOrdinal("DanhGia")));
                listSP.Add(sp);
            }
            connection.Close();
            Repeater1.DataSource = listSP;
            Repeater1.DataBind();
        }
        protected void btn_addtocart_Click(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            Button btn = (Button)sender;
            string maSP = btn.CommandArgument;
            // Kiểm tra cookie có tồn tại hay không
            if (userInfo == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Bạn phải đăng nhập để thêm vào giỏ hàng');", true);
                return;
            }
            string taiKhoan = userInfo["TaiKhoan"];
            connection.Open();
            string query = "SELECT SoLuong FROM GioHang WHERE TaiKhoan = @TaiKhoan AND MaSP = @MaSP";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
            command.Parameters.AddWithValue("@MaSP", maSP);
            object kq = command.ExecuteScalar();
            if (kq!=null)
            {
                int soLuongHienTai = (int)kq;
                int soLuongMoi = soLuongHienTai + 1;
                SqlCommand updateCommand = new SqlCommand("UPDATE GioHang SET SoLuong = @SoLuong WHERE TaiKhoan = @TaiKhoan AND MaSP = @MaSP", connection);
                updateCommand.Parameters.AddWithValue("@SoLuong", soLuongMoi);
                updateCommand.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
                updateCommand.Parameters.AddWithValue("@MaSP", maSP);
                updateCommand.ExecuteNonQuery();
            }
            else
            {
                SqlCommand insertCommand = new SqlCommand("INSERT INTO GioHang (TaiKhoan, MaSP, SoLuong) VALUES (@TaiKhoan, @MaSP, @SoLuong)", connection);
                insertCommand.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
                insertCommand.Parameters.AddWithValue("@MaSP", maSP);
                insertCommand.Parameters.AddWithValue("@SoLuong", 1);
                insertCommand.ExecuteNonQuery();
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Thêm vào giỏ hàng thàng công');", true);
            connection.Close();
        }

        protected void XemChiTiet_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string maSP = btn.CommandArgument;
            string url = "ChiTietSanPham.aspx?MaSP=" + HttpUtility.UrlEncode(maSP);
            Response.Redirect(url);
        }
        string convertDanhGia(int danhgia)
        {
            string DanhGiaString = "";
            for (int index = 1; index < 6; index++)
            {
                if (index <= danhgia)
                {
                    DanhGiaString += "<i class=\"fa-solid fa-star\"></i>";
                }
                else
                {
                    DanhGiaString += "<i class=\"fa-regular fa-star\"></i>";
                }
            }
            return DanhGiaString;
        }

    }


}
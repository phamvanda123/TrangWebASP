using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456";
        protected void Page_Load(object sender, EventArgs e)
        {
            string maSP = Request.QueryString["MaSP"];
            if (maSP != null)
            {
               loadSP(maSP);
                loadTenSP(maSP);
            }
        }
        void loadSP(string maSP)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM ChiTietSanPham WHERE MaSP = @maSP";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@maSP", maSP);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    ManHinh.InnerHtml = reader.GetString(reader.GetOrdinal("ManHinh"));
                    HeDieuHanh.InnerText = reader.GetString(reader.GetOrdinal("HeDieuHanh"));
                    CameraSau.InnerText = reader.GetString(reader.GetOrdinal("CameraSau"));
                    CameraTruoc.InnerText = reader.GetString(reader.GetOrdinal("CameraTruoc"));
                    Chip.InnerText = reader.GetString(reader.GetOrdinal("Chip"));
                    Ram.InnerText = reader.GetString(reader.GetOrdinal("Ram"));
                    DungLuong.InnerText = reader.GetString(reader.GetOrdinal("DungLuong"));
                    LuuTru.InnerText = reader.GetString(reader.GetOrdinal("Pin"));
                    expandedImg.Src = reader.GetString(reader.GetOrdinal("ImageMoTa1"));
                    ImageChiTiet1.Src = reader.GetString(reader.GetOrdinal("ImageMoTa1"));
                    ImageChiTiet2.Src = reader.GetString(reader.GetOrdinal("ImageMoTa2"));
                    ImageChiTiet3.Src = reader.GetString(reader.GetOrdinal("ImageMoTa3"));
                    ImageChiTiet4.Src = reader.GetString(reader.GetOrdinal("ImageMoTa4"));
                }
                reader.Close();
            }
        }

        void loadTenSP(string maSP)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM SanPham WHERE MaSP = @maSP";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@maSP", maSP);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    NameSP.InnerText = reader.GetString(reader.GetOrdinal("TenSP"));
                    GiaKM.InnerText = reader.GetInt32(reader.GetOrdinal("DonGia")).ToString("N0")+"VNĐ";
                    int giaCoKhuyenMai = reader.GetInt32(reader.GetOrdinal("DonGia")) + reader.GetInt32(reader.GetOrdinal("DonGia")) * reader.GetInt32(reader.GetOrdinal("KhuyenMai")) / 100;
                    GiaCKM.InnerText = giaCoKhuyenMai.ToString("N0") + "VNĐ";
                    DanhGia.InnerHtml = convertDanhGia(reader.GetInt32(reader.GetOrdinal("DanhGia")));
                }
                reader.Close();
            }
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

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            string maSP = Request.QueryString["MaSP"];
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
            if (kq != null)
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
    }
}
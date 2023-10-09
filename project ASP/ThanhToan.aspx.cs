using project_ASP.model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        int TongTien=0;
        List<GioHangClass> listSP = new List<GioHangClass>();
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
        protected void Page_Load(object sender, EventArgs e)
        {
                connection.Open();
                HttpCookie userInfo = Request.Cookies["UserInfo"];
                string taiKhoan = userInfo["TaiKhoan"];
                string query = "SELECT DiaChi FROM KhachHang where Taikhoan=N'"+taiKhoan+"'";

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                // Gán danh sách địa chỉ vào dropdownlist
                if(reader.Read())
                {
                    DiaChi.InnerHtml = reader["DiaChi"].ToString();
                }
                // Đóng kết nối
                reader.Close();
            string query2 = "select sum(GioHang.SoLuong*DonGia) TongCong from GioHang,SanPham where giohang.MaSP = SANPHAM.MaSP and  TaiKhoan = '" + taiKhoan + "'";
            SqlCommand command2 = new SqlCommand(query2, connection);
            SqlDataReader reader2 = command2.ExecuteReader();

            if (reader2.Read())
            {
                try
                {
                    TongTien = (int)reader2["TongCong"];
                }
                catch
                {

                }
                TongCong.InnerHtml = TongTien.ToString("N0") + "đ";
            }
            // Đóng kết nối
            reader.Close();
            connection.Close();
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
            string query = "select SanPham.MaSP,GioHang.SoLuong,TenSP,ImageSanPham,DonGia from GioHang,SanPham where giohang.MaSP = SANPHAM.MaSP and  TaiKhoan = '" + taiKhoan + "'";
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
                sp.TongTien = (reader.GetInt32(reader.GetOrdinal("SoLuong")) * reader.GetInt32(reader.GetOrdinal("DonGia"))).ToString("N0");
                listSP.Add(sp);
            }
            connection.Close();
            lissp.DataSource = listSP;
            lissp.DataBind();
        }
        protected void DatHang_Click(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            if (userInfo == null)
            {
                return;
            }
            string taiKhoan = userInfo["TaiKhoan"];
            connection.Open();
            SqlTransaction transaction = connection.BeginTransaction();
            try
            {
                // Thêm đơn đặt hàng mới
                SqlCommand command = new SqlCommand("INSERT INTO DonDatHang (TaiKhoan, NgayGiao, TongTien, TinhTrang) VALUES (@TaiKhoan, @NgayGiao, @TongTien, @TinhTrang); SELECT SCOPE_IDENTITY()", connection, transaction);
                command.Parameters.AddWithValue("@TaiKhoan", taiKhoan); 
                command.Parameters.AddWithValue("@NgayGiao", DateTime.Now.AddDays(3)); 
                command.Parameters.AddWithValue("@TongTien", TongTien); 
                command.Parameters.AddWithValue("@TinhTrang", "Đang xử lý");
                int maDDH = Convert.ToInt32(command.ExecuteScalar());
                // Thêm chi tiết đơn đặt hàng
                for(int i = 0; i < listSP.Count; i++)
                {
                    SqlCommand command1 = new SqlCommand("INSERT INTO ChiTietDonDatHang VALUES (@MaDDH, @MaSP, @SoLuong)", connection, transaction);
                    command1.Parameters.AddWithValue("@MaDDH", maDDH);
                    command1.Parameters.AddWithValue("@MaSP", listSP[i].MaSP); // Thay bằng mã sản phẩm tương ứng
                    command1.Parameters.AddWithValue("@SoLuong", listSP[i].SoLuong); // Thay bằng số lượng tương ứng
                    command1.ExecuteNonQuery();
                }
                // Xóa bản giỏ hàng
                string queryXoa = "delete from giohang where TaiKhoan = N'" + taiKhoan + "'";
                command = new SqlCommand(queryXoa, connection, transaction);
                command.ExecuteNonQuery();
                // Hoàn thành transaction
                transaction.Commit();
            }
            catch (Exception ex)
            {
                // Nếu có lỗi xảy ra, rollback transaction
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                
                connection.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Đặt hàng thành công');", true);
                Response.Redirect(Request.RawUrl);

            }
        }
        protected void ShowSweetAlert(string title, string message, string type)
        {
            string script  = $@"
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
            Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, false);
        }
    }
    
}
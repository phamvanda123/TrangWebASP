using project_ASP.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP
{
    public partial class NguoiDung : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456");
        List<DonDatHang> donDatHangList = new List<DonDatHang>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie userInfo = Request.Cookies["UserInfo"];
                string taiKhoan = userInfo["TaiKhoan"];
                SqlCommand cmd = new SqlCommand("SELECT HoTen, Email, SDT, DiaChi FROM KhachHang WHERE TaiKhoan = @TaiKhoan", con);
                cmd.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Ten.InnerText = reader["HoTen"].ToString();
                    TenKH.InnerText = reader["HoTen"].ToString();
                    InPutHoTen.Value = reader["HoTen"].ToString();
                    Email.InnerText = reader["Email"].ToString();
                    InputEmail.Value = reader["Email"].ToString();
                    SDT.InnerText = reader["SDT"].ToString();
                    InputSDT.Value= reader["SDT"].ToString();
                    DiaChi.InnerText = reader["DiaChi"].ToString();
                    InPutDiaChi.Value = reader["DiaChi"].ToString();
                }

                // Close the SqlDataReader and the database connection
                reader.Close();
                con.Close();
                DSDonDatHang.DataSource = LoadListDonDatHangFromDatabase(taiKhoan);
                DSDonDatHang.DataBind();
            }
           
        }
        public List<DonDatHang> LoadListDonDatHangFromDatabase(string taikhoan)
        {
            List<DonDatHang> danhSachDonDatHang = new List<DonDatHang>();

            // Kết nối tới cơ sở dữ liệu
            using (con)
            {
                con.Open();

                // Tạo câu truy vấn SQL để lấy thông tin đơn đặt hàng
                string query = "SELECT MaDDH, NgayDat, NgayGiao, TongTien, TinhTrang FROM DonDatHang where TaiKhoan=N'"+taikhoan+"'";
                // Tạo một đối tượng Command để thực hiện truy vấn
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    // Thực hiện truy vấn và đọc dữ liệu
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Đọc thông tin đơn đặt hàng từ mỗi hàng và tạo đối tượng DonDatHang
                            int maDDH = Convert.ToInt32(reader["MaDDH"]);
                            DateTime ngayDat = Convert.ToDateTime(reader["NgayDat"]);
                            DateTime ngayGiao = Convert.ToDateTime(reader["NgayGiao"]);
                            int tongTien = Convert.ToInt32(reader["TongTien"]);
                            string tinhTrang = reader["TinhTrang"].ToString();

                            DonDatHang donDatHang = new DonDatHang
                            {
                                MaDDH = maDDH,
                                NgayDat = ngayDat,
                                NgayGiao = ngayGiao,
                                TongTien = tongTien,
                                TinhTrang = tinhTrang,
                                ChiTietDonDatHang = new List<ChiTietDatHang>()
                            };

                            danhSachDonDatHang.Add(donDatHang);
                        }
                    }
                }
                for (int i = 0; i < danhSachDonDatHang.Count; i++)
                {
                    List<ChiTietDatHang> chiTietDatHangs = new List<ChiTietDatHang>();
                    query = "select DonGia,ChiTietDonDatHang.SoLuong,ImageSanPham,TenSP from ChiTietDonDatHang,sanpham where sanpham.maSP=ChiTietDonDatHang.maSP and maDDH=" + danhSachDonDatHang[i].MaDDH.ToString();
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                    int donGia = Convert.ToInt32(reader["DonGia"]);
                                    int soLuong = Convert.ToInt32(reader["SoLuong"]);
                                    string imageSanPham = reader["ImageSanPham"].ToString();
                                    string tenSP = reader["TenSP"].ToString();

                                    ChiTietDatHang chiTiet = new ChiTietDatHang
                                    {
                                        DonGia = donGia,
                                        SoLuong = soLuong,
                                        ImageSanPham = imageSanPham,
                                        TenSP = tenSP
                                    };
                                    chiTietDatHangs.Add(chiTiet);
                            }
                            danhSachDonDatHang[i].ChiTietDonDatHang = chiTietDatHangs;
                        }

                    }
                }
               
            }

            return danhSachDonDatHang;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            HttpCookie myCookie = new HttpCookie("UserInfo");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
            Response.Redirect("Login.aspx");
        }

        protected void OK_Click(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["UserInfo"];
            string taiKhoan = userInfo["TaiKhoan"];
            con.Open();
            SqlCommand command = new SqlCommand("UPDATE KhachHang SET HoTen=@HoTen, DiaChi=@DiaChi, SDT=@SDT, Email=@Email WHERE TaiKhoan=@TaiKhoan", con);
            command.Parameters.AddWithValue("@HoTen", InPutHoTen.Value);
            command.Parameters.AddWithValue("@DiaChi", InPutDiaChi.Value);
            command.Parameters.AddWithValue("@SDT", InputSDT.Value);
            command.Parameters.AddWithValue("@Email", InputEmail.Value);
            command.Parameters.AddWithValue("@TaiKhoan", taiKhoan);
            int rowsAffected = command.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Sửa thành công');", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Sửa không thành công');", true);

            }
            con.Close();
        }
    }
}
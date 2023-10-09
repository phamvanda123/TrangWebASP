using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_ASP.admin
{
    public partial class QuanLySanPham : System.Web.UI.Page
    {
        string connectionString = "Data Source=DESKTOP-86P3HHV\\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;User ID=sa;Password=123456";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Lấy các controls trong GridView để cập nhật dữ liệu
            Label MaSP = GridView1.Rows[e.RowIndex].FindControl("MaSP") as Label;
            TextBox TenSP = GridView1.Rows[e.RowIndex].FindControl("txt_TenSP") as TextBox;
            TextBox DonGia = GridView1.Rows[e.RowIndex].FindControl("txt_DonGia") as TextBox;
            TextBox SoLuong = GridView1.Rows[e.RowIndex].FindControl("txt_SoLuong") as TextBox;
            TextBox KhuyenMai = GridView1.Rows[e.RowIndex].FindControl("txt_KhuyenMai") as TextBox;
            FileUpload image = GridView1.Rows[e.RowIndex].FindControl("FileImage") as FileUpload;
            DropDownList DanhGia = GridView1.Rows[e.RowIndex].FindControl("cb_DanhGia") as DropDownList;
            DropDownList MaHang = GridView1.Rows[e.RowIndex].FindControl("cb_Hang") as DropDownList;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "";
                SqlCommand command = null;
                if (!image.HasFile)
                {
                    query = "UPDATE SANPHAM SET TenSP = @TenSP, DonGia = @DonGia, SoLuong = @SoLuong, DanhGia = @DanhGia, KhuyenMai = @KhuyenMai, MaHang = @MaHang WHERE MaSP = @MaSP";
                    command = new SqlCommand(query, connection);
                }
                else
                {
                    query = "UPDATE SANPHAM SET TenSP = @TenSP, DonGia = @DonGia, SoLuong = @SoLuong, ImageSanPham = @ImageSanPham, DanhGia = @DanhGia, KhuyenMai = @KhuyenMai, MaHang = @MaHang WHERE MaSP = @MaSP";
                    command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ImageSanPham", image.FileName);
                }

                // Tạo đối tượng Command và thiết lập các tham số
                command.Parameters.AddWithValue("@TenSP", TenSP.Text);
                command.Parameters.AddWithValue("@DonGia", Convert.ToInt32(DonGia.Text));
                command.Parameters.AddWithValue("@SoLuong", Convert.ToInt32(SoLuong.Text));
                command.Parameters.AddWithValue("@DanhGia", Convert.ToInt32(DanhGia.SelectedValue));
                command.Parameters.AddWithValue("@KhuyenMai", Convert.ToInt32(KhuyenMai.Text));
                command.Parameters.AddWithValue("@MaHang", MaHang.SelectedValue);
                command.Parameters.AddWithValue("@MaSP", MaSP.Text);
                command.ExecuteNonQuery();
                string filePath = Server.MapPath("~/admin/ImagesUpLoad/") + image.FileName;
                try
                {
                    image.SaveAs(filePath);
                }
                catch
                {

                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Sửa thành công');", true);
                Response.Redirect(Request.RawUrl);
                // Đóng kết nối cơ sở dữ liệu
                connection.Close();
            }
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            // Lấy các controls trong GridView để cập nhật dữ liệu
            TextBox MaSP = GridView1.FooterRow.FindControl("MaSPinsert") as TextBox;
            TextBox TenSP = GridView1.FooterRow.FindControl("TenSP") as TextBox;
            TextBox DonGia = GridView1.FooterRow.FindControl("DonGia") as TextBox;
            TextBox SoLuong = GridView1.FooterRow.FindControl("SoLuong") as TextBox;
            TextBox KhuyenMai = GridView1.FooterRow.FindControl("KhuyenMai") as TextBox;
            FileUpload image = GridView1.FooterRow.FindControl("HinhAnh") as FileUpload;
            DropDownList DanhGia = GridView1.FooterRow.FindControl("DanhGia") as DropDownList;
            DropDownList MaHang = GridView1.FooterRow.FindControl("Hang") as DropDownList;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO SANPHAM (MaSP, TenSP, DonGia, SoLuong, ImageSanPham, DanhGia, KhuyenMai, MaHang) " +
                   "VALUES (@MaSP, @TenSP, @DonGia, @SoLuong, @ImageSanPham, @DanhGia, @KhuyenMai, @MaHang)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@MaSP", MaSP.Text);
                    command.Parameters.AddWithValue("@TenSP", TenSP.Text);
                    command.Parameters.AddWithValue("@DonGia", Convert.ToInt32(DonGia.Text));
                    command.Parameters.AddWithValue("@SoLuong", Convert.ToInt32(SoLuong.Text));
                    command.Parameters.AddWithValue("@ImageSanPham", image.FileName);
                    command.Parameters.AddWithValue("@DanhGia", Convert.ToInt32(DanhGia.SelectedValue));
                    command.Parameters.AddWithValue("@KhuyenMai", Convert.ToInt32(KhuyenMai.Text));
                    command.Parameters.AddWithValue("@MaHang", MaHang.SelectedValue);
                    command.ExecuteNonQuery();
                    string filePath = Server.MapPath("~/admin/ImagesUpLoad/") + image.FileName;
                    image.SaveAs(filePath);
                    connection.Close();
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('thêm thành công');", true);
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Thêm không thành công');", true);
            }
            
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label MaSP = GridView1.Rows[e.RowIndex].FindControl("LabelMaSP") as Label;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM SANPHAM WHERE MaSP=@MaSP";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MaSP", MaSP.Text);
                command.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('xóa thành công');", true);
                Response.Redirect(Request.RawUrl);
            }
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

        }

        protected void DropDownHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource= SqlDataSource3;
            GridView1.DataBind();
        }
    }
}
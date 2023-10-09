using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace project_ASP.model
{
    public class MyClass
    {
    }
    public class SanPhamClass
    {
        public string MaSP { get; set; }
        public string TenSP { get; set; }
        public int DonGia { get; set; }
        public int SoLuong { get; set; }
        public int KhuyenMai { get; set; }
        public string ImageSanPham { get; set; }
        public string DanhGia { get; set; }

    }
    public class GioHangClass
    {
        public string MaSP { get; set; }
        public string TaiKhoan { get; set; }
        public int SoLuong { get; set; }
        public string TenSP { get; set; }
        public string ImageSanPham { get; set; }
        public string DonGia { get; set; }
        public string TongTien { get; set; }   

    }
    public class DonDatHang
    {
        public int MaDDH { get; set; }
        public DateTime NgayDat { get; set; }
        public DateTime NgayGiao { get; set; }
        public int TongTien { get; set; }
        public string TinhTrang { get; set; }
        public List<ChiTietDatHang> ChiTietDonDatHang { get; set; }

    }
    public class ChiTietDatHang
    {
        public int DonGia { get; set; }
        public int SoLuong { get; set; }
        public string ImageSanPham { get; set; }
        public string TenSP { get; set; }
    }
}
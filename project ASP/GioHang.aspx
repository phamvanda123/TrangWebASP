<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="project_ASP.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="ss-gio-hang text-white mybackgroundMain py-3">
      <div class="container">
        <div class="table-cart">
          <div class="d-flex justify-content-center">
            <h3
              class="pt-4 text-danger"
              style="font-family: 'Dancing Script', cursive"
            >
              <b>Danh Sách Sản Phẩm</b>
            </h3>
          </div>
          <div class="d-flex justify-content-center">
            <hr style="width: 30%" />
          </div>
          <div class="row mycolorMain">
            <div class="col-sm-2"></div>
            <div class="col-sm-2 text-center"><b>Sản Phẩm </b></div>
            <div class="col-sm-2 text-center"><b>Đơn Giá </b></div>
            <div class="col-sm-2 text-center"><b>Số lượng </b></div>
            <div class="col-sm-2 text-center"><b>Tổng Tiền </b></div>
            <div class="col-sm-2 text-center"><b>Thao tác </b></div>
          </div>
          <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                     <div class="row my-2" >
            <div class="col-sm-2 d-flex justify-content-center flex-column"><img style="max-width:100px" src="<%# "admin/ImagesUpLoad/"+Eval("ImageSanPham") %>"></div>
            <div class="col-sm-2 d-flex justify-content-center flex-column ten-hang"><%# Eval("TenSP") %></div>
            <div class="col-sm-2 d-flex justify-content-center flex-column text-center"><%# Eval("DonGia") %></div>
            <div class="col-sm-2 d-flex justify-content-center flex-column text-center"><div class='d-flex justify-content-center'><asp:LinkButton runat="server" OnClick="TangSP" CommandArgument='<%# Eval("MaSP") %>' CssClass="butonThaoTac" Text="+"/><div class="mx-2"><%# Eval("SoLuong") %></div><asp:LinkButton runat="server" OnClick="GiamSP" CommandArgument='<%# Eval("MaSP") %>' CssClass="butonThaoTac" Text="-"/></div></div>
            <div class="col-sm-2 d-flex justify-content-center flex-column text-center"><%# Eval("TongTien") %></div>
            <div class="col-sm-2 d-flex justify-content-center text-center pt-4"><asp:LinkButton runat="server" OnClick="DeleteSP" CommandArgument='<%# Eval("MaSP") %>' Height="50" CssClass="text-center" Width="50" Text="Xóa"/></div>
            </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- <div class="d-flex justify-content-center">
                <hr style="width: 80%; border-width: 3px;">
            </div> -->
        <div class="d-flex justify-content-end pe-5">
          <div class="d-flex justify-content-center flex-column"></div>
          <a class="pe-5" href="ThanhToan.aspx">
            <div
              style="width: 100%"
              class="btn btn-thanh-toan btn-my-basic ms-3 me-4 mb-2"
            >
              <b>Thanh Toán</b>
            </div>
          </a>
        </div>
      </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>

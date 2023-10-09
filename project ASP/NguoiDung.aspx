<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="NguoiDung.aspx.cs" Inherits="project_ASP.NguoiDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="ss-tt-khachHang py-5 text-white mybackgroundMain">
      <div class="container">
        <div class="row">
          <div class="col-sm-5">
            Khách Hàng : <span id="TenKH" runat="server"></span> | <asp:LinkButton ID="btnLogout" runat="server" Text="Đăng xuất" OnClick="btnLogout_Click"></asp:LinkButton>
              <div>
                <h3 class="text-center"><b>Thông tin Khách hàng</b></h3>
              </div>
              <table>
                <tr>
                  <td>Họ và tên:</td>
                  <td id="Ten" runat="server"></td>
                </tr>
                <tr>
                  <td>Email:</td>
                  <td id="Email" runat="server"></td>
                </tr>
                <tr>
                  <td>SDT:</td>
                  <td id="SDT" runat="server"></td>
                </tr>
                <tr>
                  <td>Địa chỉ nhận Hàng:</td>
                  <td id="DiaChi" runat="server"></td>
                </tr>
              </table>
              <div class="btn btn-danger" id="chinhSuaTen">Chỉnh Sửa</div>
          </div>
            
          <div class="col-sm-6">
            <h3>Đơn Hàng Của Tôi</h3>
            <div class="card"></div>
              <asp:Repeater runat="server" ID="DSDonDatHang">
    <ItemTemplate>
        <div class="card my-3" style="background-color: antiquewhite">
            <div class="card-header" style="color: red"><b>Đơn hàng <%# Eval("MaDDH") %></b></div>
            <div class="card-body" style="color: black">
                <table class="table table-striped" style="width: 100%">
                    <tr>
                        <td>Mã Đơn Hàng</td>
                        <td class="text-end"><%# Eval("MaDDH") %></td>
                    </tr>
                    <tr>
                        <td>Ngày Đặt</td>
                        <td class="text-end"><%# Eval("NgayDat", "{0:dd/MM/yyyy}") %></td>
                    </tr>
                    <tr>
                        <td>Ngày Giao</td>
                        <td class="text-end"><%# Eval("NgayGiao", "{0:dd/MM/yyyy}") %></td>
                    </tr>
                    <tr>
                        <td>Sản Phẩm</td>
                        <td class="text-end">
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-3 text-center">Tên SP</div>
                                <div class="col-sm-3 text-center">Số lượng</div>
                                <div class="col-sm-3 text-center">Tổng Giá</div>
                            </div>
                            <asp:Repeater runat="server" DataSource='<%# Eval("ChiTietDonDatHang") %>'>
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <img src='<%# "admin/ImagesUpLoad/"+Eval("ImageSanPham") %>' alt="" style="max-width: 30px" />
                                        </div>
                                        <div class="col-sm-3"><%# Eval("TenSP") %></div>
                                        <div class="col-sm-3 text-center"><%# Eval("SoLuong") %></div>
                                        <div class="col-sm-3 text-center"><%# (int.Parse(Eval("SoLuong").ToString()) * int.Parse(Eval("DonGia").ToString())).ToString("N0") %>đ</div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                    <tr>
                        <td>Tổng Tiền</td>
                        <td class="text-end"><%# Eval("TongTien", "{0:N0}") %>đ</td>
                    </tr>
                    <tr>
                        <td>Trạng Thái</td>
                        <td class="text-end"><%# Eval("TinhTrang") %></td>
                    </tr>
                    <tr>
                        <td></td>
                        <%--<td class="text-end">
                            <asp:Button runat="server" Text="Hủy đơn" CssClass="btn btn-danger" CommandName="HuyDon" CommandArgument='<%# Eval("MaDDH") %>' />
                        </td>--%>
                    </tr>
                </table>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
          </div>
        </div>
      </div>
    </section>
    <div class="modal fade" id="ModalSua" >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-body">
            <h2 class="py-4 text-center">
              <b><span id="msg">Thông tin Khách hàng</span></b>
            </h2>
              <table style="width: 100%;">
                <tr>
                  <td>Họ và Tên</td>
                  <td><input style="width: 300px;" runat="server" id="InPutHoTen"/>
                </tr>
                <tr>
                  <td>Email</td>
                  <td><input  style="width: 300px;" runat="server" id="InputEmail"></td>
                </tr>
                <tr>
                  <td>SDT</td>
                  <td><input  style="width: 300px;" runat="server" type="text" id="InputSDT"></td>
                </tr>
                <tr>
                  <td>Địa Chỉ nhận Hàng</td>
                  <td><input  style="width: 300px;" runat="server" type="text" id="InPutDiaChi"></td>
                </tr>
              </table>
            <hr style="width: 100%" />
            <div class="d-flex justify-content-center">
              <asp:Button
                runat="server"
                id="OK"
                CssClass="btn btn-danger text-end"
                Text="Ok"
                OnClick="OK_Click"
              />
            
              <div
                class="btn btn-danger mx-3 text-end"
                data-bs-dismiss="modal"
              >
                Hủy
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script>
        document.getElementById("chinhSuaTen").addEventListener("click", function () {
            $("#ModalSua").modal("show");
        })
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="project_ASP.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="css/styleThanhToan.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="thanhToan text-white pt-5 mybackgroundMain">
      <div class="container">
        <div class="row">
          <div class="col-sm-7">
            <div class="row" style="border: black solid 1px">
              <div class="card" style="background-color: transparent">
                <div class="card-header">
                  <div class="row">
                    <div class="col-sm-6">Địa chỉ giao hàng</div>
                    <div class="col-sm-6 d-flex justify-content-end">
                      <a href="NguoiDung.aspx">Chỉnh sửa</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div><span id="tenKH"></span> <span id="SDT"></span></div>
                  <div class="d-flex">
                    <div
                      class="text-center mt-2"
                      style="
                        background-color: red;
                        width: 15%;
                        border-radius: 20px;
                      "
                    >
                      Nhà Riêng
                    </div>
                    <div
                      id="DiaChi"
                      class="d-flex ms-3 justify-content-center flex-column"
                        runat="server"
                    ></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row mt-2" style="border: black solid 1px">
              <div>
                <h3>Thông tin sản phẩm</h3>
              </div>
              <div class="table-cart">
                <div class="row mycolorMain">
                  <div class="col-sm-2"></div>
                  <div class="col-sm-4 text-center"><b>Sản Phẩm </b></div>
                  <div class="col-sm-2 text-center"><b>Đơn Giá </b></div>
                    <div class="col-sm-2 text-center"><b>Số lượng </b></div>
                    <div class="col-sm-2 text-center"><b>Tổng Tiền </b></div>
                    <asp:Repeater runat="server" ID="lissp">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-sm-2 d-flex justify-content-center flex-column">
                                    <img src="<%# "admin/ImagesUpLoad/"+Eval("ImageSanPham") %>">
                                </div>
                                <div class="col-sm-4 d-flex justify-content-center flex-column ten-hang"><%# Eval("TenSP") %></div>
                                <div class="col-sm-2 d-flex justify-content-center flex-column text-center"><%# Eval("DonGia") %></div>
                                <div class="col-sm-2 d-flex justify-content-center flex-column text-center"><%# Eval("SoLuong") %></div>
                                <div class="col-sm-2 d-flex justify-content-center flex-column text-center"><%# Eval("TongTien") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
              </div>
            </div>
          </div>
          <div
            class="col-sm-4 my-4 mx-3 mybackground1 col-thu-2 p-3 ms-5 mb-5"
            style="border: black solid 1px"
          >
            <h4 class="mt-3">Chọn phương thức thanh toán</h4>
            <div class="card">
              <div class="card-body" style="background-color: #b44808">
                <div class="row">
                  <div class="col-sm-9 d-flex">
                    <img style="width: 15%" src="/images/momo.png" alt="" />
                    <h4 class="ms-2">Ví MOMO</h4>
                  </div>
                  <div class="col-sm-3 d-flex justify-content-end">
                    <input
                      type="radio"
                      class="option-input radio"
                      name="example"
                      checked
                    />
                  </div>
                </div>
              </div>
              <div class="card-footer mybackground1">
                Kết nối tài khoản momo
              </div>
            </div>
            <div class="card mt-3">
              <div class="card-body" style="background-color: #b44808">
                <div class="row">
                  <div class="col-sm-9 d-flex">
                    <img style="width: 15%" src="/images/card.webp" alt="" />
                    <h4 class="ms-2">Thẻ tính dụng/thẻ ghi nợ</h4>
                  </div>
                  <div class="col-sm-3 d-flex justify-content-end">
                    <input
                      type="radio"
                      class="option-input radio"
                      name="example"
                      checked
                    />
                  </div>
                </div>
              </div>
              <div class="card-footer mybackground1">
                Chọn để thanh toán bằng thẻ
              </div>
            </div>
            <h4 class="mt-3">Mã Giảm Giá</h4>
            <div class="row d-flex justify-content-center">
              <div class="col-sm-8 d-flex justify-content-center flex-column">
                <input
                  style="width: 100%"
                  placeholder="Nhập mã giảm giá"
                  type="text"
                  id="fname"
                  name="fname"
                />
              </div>
              <div class="col-sm-4 mt-3">
                <button class="btn btn-danger">Áp dụng</button>
              </div>
              <h4 class="mt-3">Thông tin đơn hàng</h4>
              <div class="mt-3">
                <div class="row">
                  
                  <div class="col-sm-6">
                    <div class="d-flex justify-content-end">
                      <span class="" id="tong-tien"></span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="mt-3 mb-2">
                <div class="row">
                  <div class="col-sm-6">Phí Giao hàng</div>
                  <div class="col-sm-6">
                    <div class="d-flex justify-content-end">200000 đ</div>
                  </div>
                </div>
              </div>
              <hr />
              <div>
                <div class="row">
                  <div class="col-sm-6">Tổng cộng</div>
                  <div class="col-sm-6">
                    <div id="TongCong" runat="server" class="d-flex justify-content-end"></div>
                  </div>
                </div>
              </div>
              <div class="d-flex justify-content-center">
                <asp:Button runat="server"
                  class="btn btn-DatHang btn-my-basic mt-3"
                  Text="Đặt Hàng"
                    ID="DatHang"
                   OnClick="DatHang_Click"
                />
                  
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="project_ASP.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/styleLogin.css">    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="ss-login justify-content-center d-flex text-white py-5">
        <%--Đây là from đăng Ký--%>
       <div
            class="card p-1 from-dang-ky"
            style="width: 38%; top: -200%">
            <div class="card-body px-3 py-5">
                <h2 class="text-center">Đăng Ký</h2>
                <div class="row mt-4 px-3">
                    <div class="form-floating" style="color: red">
                        <asp:TextBox ID="txt_TaiKhoan" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight:bold; color: black; opacity:100%;" for="txt_TaiKhoanDangKy">Tài Khoản</label>
                        <asp:RequiredFieldValidator  ID="KiemTraLoiDangKy1" runat="server" ForeColor="" ControlToValidate="txt_TaiKhoan" ErrorMessage="Tài Khoản Không được bỏ trống"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="KiemTraLoiDangKy5" runat="server" ControlToValidate="txt_TaiKhoan" ValidationExpression="^.{6,}$" ErrorMessage="Tài khoản phải hơn 6 ký tự"></asp:RegularExpressionValidator>                        
                    </div>
                </div>
                <div class="row mt-4 px-3">
                    <div class="form-floating" style="color: red">
                       <asp:TextBox ID="txt_Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight:bold; color: black; opacity:100%;" for="txt_EmailDangKy">Email</label>
                        <asp:RequiredFieldValidator ID="KiemTraLoiDangKy2"  runat="server" ForeColor="" ControlToValidate="txt_Email" ErrorMessage="Email Không được bỏ trống"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  runat="server" ControlToValidate="txt_Email" ErrorMessage="Địa chỉ Email không đúng" ValidationExpression="^[a-zA-Z0-9._%+-]+@gmail\.com$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row mt-4 px-3">
                    <div class="form-floating" style="color: red">
                       <asp:TextBox ID="txt_DiaChi" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight:bold; color: black; opacity:100%;" for="txt_DiaChi">Dịa chỉ</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ForeColor="" ControlToValidate="txt_DiaChi" ErrorMessage="Địa chỉ Không được bỏ trống"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mt-4 px-3">
                    <div class="form-floating" style="color: red">
                       <asp:TextBox ID="txt_HoTen" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight:bold; color: black; opacity:100%;" for="txt_HoTen">Họ Tên</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ForeColor="" ControlToValidate="txt_HoTen" ErrorMessage="Họ tên Không được bỏ trống"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="row mt-4 px-3">
                    <div class="form-floating" style="color: red">
                       <asp:TextBox ID="txt_SDT" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight:bold; color: black; opacity:100%;" for="txt_SDT">SDT</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server" ForeColor="" ControlToValidate="txt_SDT" ErrorMessage="Số điện thoại Không được bỏ trống"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mt-4 px-3">
                   <div class="form-floating" style="color: red">
                       <asp:TextBox ID="txt_MatKhauDangKy" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight:bold; color: black; opacity:100%;" for="txt_MatKhauDangKy">Mật Khẩu</label>
                        <asp:RequiredFieldValidator ID="KiemTraLoiDangKy4" runat="server" ForeColor="" ControlToValidate="txt_MatKhauDangKy" ErrorMessage="Tài Khoản Không được bỏ trống"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="KiemTraLoiDangKy6"  runat="server" ControlToValidate="txt_MatKhauDangKy" ValidationExpression="^.{6,}$" ErrorMessage="Tài khoản phải hơn 6 ký tự"></asp:RegularExpressionValidator>                        
                   </div>
                </div>
                <div class="row mt-4 px-3">
                   <div class="form-floating" style="color: red">
                       <asp:TextBox ID="txt_MatKhauDangKy1" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight:bold; color: black; opacity:100%;" for="txt_MatKhauDangKy1">Nhập Lại Mật khẩu</label>
                       <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txt_MatKhauDangKy" ControlToCompare="txt_MatKhauDangKy1" Operator="Equal" Type="String"  runat="server" ErrorMessage="Mật Khẩu nhập lại không trùng khớp"></asp:CompareValidator>
                   </div>
                </div>
                <div class="row mt-4 px-3">
                    <div class="col-sm-6 dang-nhap" style="cursor: pointer">
                        <a href="javascript:void(0)">Đăng nhập </a>
                    </div>
                    <div
                        class="col-sm-6 text-end quen-mat-khau"
                        style="cursor: pointer"
                        data-bs-toggle="modal"
                        data-bs-target="#myModalQuenMatKhau">
                        <a href="javascript:void(0)">Quên Mật Khẩu ? </a>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    
                    <asp:Button CausesValidation="true" runat="server" Text="Đăng ký" Width="300" CssClass="btn btn-danger mt-4" OnClick="Unnamed1_Click">
                    </asp:Button>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
     <script>
         document.querySelector(".dang-nhap").addEventListener("click", function () {
             window.location.href = "Login.aspx";
         })
     </script>
</asp:Content>

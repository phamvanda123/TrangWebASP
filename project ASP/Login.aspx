<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="project_ASP.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/styleLogin.css">    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="ss-login justify-content-center d-flex text-white py-5">
        <%--Đây là from đăng nhập--%>
        <div
            class="card p-1 from-dang-nhap"
            style="width: 38%; position: relative">
            <div class="card-body px-3 py-5">
                <h2 class="text-center">Đăng nhập</h2>
                <div class="row px-3 mt-4 px-3">
                    <div class="form-floating" style="color: red">
                        <asp:TextBox ID="txt_TaiKhoan" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight: bold; color: black; opacity: 100%;" for="txt_TaiKhoan">Tài Khoản</label>
                        <asp:RequiredFieldValidator  ID="KiemTraLoiDangNhap1" runat="server" ForeColor="" ControlToValidate="txt_TaiKhoan" ErrorMessage="Tài Khoản Không được bỏ trống"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row px-3 mt-4 px-3">
                    <div class="form-floating" style="color: red">
                        <asp:TextBox ID="txt_MatKhau" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                        <label style="font-weight: bold; color: black; opacity: 100%;" for="txt_MatKhau">Mật Khẩu</label>
                        <asp:RequiredFieldValidator ID="KiemTraLoiDangNhap2" runat="server" ForeColor="" ControlToValidate="txt_MatKhau" ErrorMessage="Mật khẩu Không được bỏ trống"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mt-4 px-3">
                    <div class="col-sm-6 dang-ky" style="cursor: pointer">
                        <a href="javascript:void(0)">Đăng ký </a>
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
                   <asp:Button ID="btn_DangNhap" Width="300" CausesValidation="true" CssClass="btn btn-danger mt-4" runat="server" Text="Đăng Nhập" OnClick="btn_DangNhap_Click" />
                </div>
            </div>
        </div>
        <%--Đây là from đăng Ký--%>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script>
        document.querySelector(".dang-ky").addEventListener("click", function () {
            window.location.href = "DangKy.aspx"

        })
    </script>
</asp:Content>

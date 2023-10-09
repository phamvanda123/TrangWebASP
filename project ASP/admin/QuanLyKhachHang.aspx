<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyKhachHang.aspx.cs" Inherits="project_ASP.admin.QuanLyKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Quản Lý Khách Hàng</h1>
    <div class="d-flex justify-content-center my-5">
        <table>
    <tr>
        <th colspan="2" class="text-center">Thêm Khách hàng</th>
        
    </tr>
    <tr>
        <td>Tài khoản:</td>
        <td><asp:TextBox runat="server" ID="txtTaiKhoan"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Mật khẩu:</td>
        <td><asp:TextBox runat="server" ID="txtMatKhau"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Họ tên:</td>
        <td><asp:TextBox runat="server" ID="txtHoTen"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Địa chỉ:</td>
        <td><asp:TextBox runat="server" ID="txtDiaChi"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Số điện thoại:</td>
        <td><asp:TextBox runat="server" ID="txtSDT"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><asp:TextBox runat="server" ID="txtEmail"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="text-center" colspan="2"><asp:Button ID="ThemSP" Text="Thêm Khách Hàng" runat="server" OnClick="ThemSP_Click" /> </td>
    </tr>
</table>

    </div>

    <div class="d-flex justify-content-center">

   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="TaiKhoan" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="TaiKhoan" HeaderText="TaiKhoan" ReadOnly="True" SortExpression="TaiKhoan" />
                <asp:BoundField DataField="MatKhau" HeaderText="MatKhau" SortExpression="MatKhau" />
                <asp:BoundField DataField="HoTen" HeaderText="HoTen" SortExpression="HoTen" />
                <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" SortExpression="DiaChi" />
                <asp:BoundField DataField="SDT" HeaderText="SDT" SortExpression="SDT" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DESKTOP-86P3HHV\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;Integrated Security=True" DeleteCommand="DELETE FROM [KhachHang] WHERE [TaiKhoan] = @TaiKhoan" InsertCommand="INSERT INTO [KhachHang] ([TaiKhoan], [MatKhau], [HoTen], [DiaChi], [SDT], [Email]) VALUES (@TaiKhoan, @MatKhau, @HoTen, @DiaChi, @SDT, @Email)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [KhachHang]" UpdateCommand="UPDATE [KhachHang] SET [MatKhau] = @MatKhau, [HoTen] = @HoTen, [DiaChi] = @DiaChi, [SDT] = @SDT, [Email] = @Email WHERE [TaiKhoan] = @TaiKhoan">
            <DeleteParameters>
                <asp:Parameter Name="TaiKhoan" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TaiKhoan" Type="String" />
                <asp:Parameter Name="MatKhau" Type="String" />
                <asp:Parameter Name="HoTen" Type="String" />
                <asp:Parameter Name="DiaChi" Type="String" />
                <asp:Parameter Name="SDT" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MatKhau" Type="String" />
                <asp:Parameter Name="HoTen" Type="String" />
                <asp:Parameter Name="DiaChi" Type="String" />
                <asp:Parameter Name="SDT" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TaiKhoan" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

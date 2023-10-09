<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="project_ASP.admin.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="d-flex justify-content-center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" ShowFooter="True" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Mã Sản Phẩm">
                        <EditItemTemplate>
                            <asp:Label ID="MaSP" runat="server" Text='<%# Eval("MaSP") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="MaSPinsert" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelMaSP" runat="server" Text='<%# Eval("MaSP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên Sản Phẩm">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_TenSP" runat="server" Text='<%# Eval("TenSP") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TenSP" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đơn Giá">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_DonGia" runat="server" Text='<%# Eval("DonGia") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="DonGia" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("DonGia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng tồn">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_SoLuong" runat="server" Width="50" Text='<%# Eval("SoLuong") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="SoLuong" runat="server"  Width="50"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("SoLuong") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hình ảnh">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileImage" Width="100" runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:FileUpload ID="HinhAnh" runat="server" Width="100" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Image Width="50" ID="Image1" runat="server" ImageUrl='<%# "ImagesUpload/"+ Eval("ImageSanPham") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đánh giá">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cb_DanhGia" runat="server" SelectedValue='<%# Eval("DanhGia") %>'>
                                <asp:ListItem>
                                    1
                                </asp:ListItem>
                                <asp:ListItem>
                                    2
                                </asp:ListItem>
                                <asp:ListItem>
                                    3
                                </asp:ListItem>
                                <asp:ListItem>
                                    4
                                </asp:ListItem>
                                <asp:ListItem>
                                    5
                                </asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="DanhGia" runat="server" >
                                <asp:ListItem>
                                    1
                                </asp:ListItem>
                                <asp:ListItem>
                                    2
                                </asp:ListItem>
                                <asp:ListItem>
                                    3
                                </asp:ListItem>
                                <asp:ListItem>
                                    4
                                </asp:ListItem>
                                <asp:ListItem>
                                    5
                                </asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DanhGia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Khuyến Mãi">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_KhuyenMai" runat="server" Width="50" Text='<%# Eval("KhuyenMai") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="KhuyenMai" runat="server" Width="50"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server"  Text='<%# Eval("KhuyenMai") %>'>%</asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hãng">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cb_Hang" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenHang" DataValueField="MaHang">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="Hang" runat="server" DataSourceID="SqlDataSource2" DataTextField="MaHang" DataValueField="MaHang">
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("MaHang") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update" OnClientClick="if (!confirm('Bạn có chắc chắn muốn sữa dữ liệu này?')) return false;">Update</asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <div class="auto-style1">
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Edit" OnClick="LinkButton5_Click">Thêm</asp:LinkButton>
                            </div>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Sửa</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" OnClientClick="if (!confirm('Bạn có chắc chắn muốn xóa dữ liệu này?')) return false;">Xóa</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
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

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-86P3HHV\SQLEXPRESS;Initial Catalog=QuanLyTrangWebASP;Integrated Security=True" DeleteCommand="DELETE FROM [SANPHAM] WHERE [MaSP] = @MaSP" InsertCommand="INSERT INTO [SANPHAM] ([MaSP], [TenSP], [DonGIa], [SoLuong], [ImageSanPham], [DanhGia], [KhuyenMai], [MaHang]) VALUES (@MaSP, @TenSP, @DonGIa, @SoLuong, @ImageSanPham, @DanhGia, @KhuyenMai, @MaHang)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [SANPHAM]" UpdateCommand="UPDATE [SANPHAM] SET [TenSP] = @TenSP, [DonGIa] = @DonGIa, [SoLuong] = @SoLuong, [ImageSanPham] = @ImageSanPham, [DanhGia] = @DanhGia, [KhuyenMai] = @KhuyenMai, [MaHang] = @MaHang WHERE [MaSP] = @MaSP">
            <DeleteParameters>
                <asp:Parameter Name="MaSP" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaSP" Type="String" />
                <asp:Parameter Name="TenSP" Type="String" />
                <asp:Parameter Name="DonGIa" Type="Int32" />
                <asp:Parameter Name="SoLuong" Type="Int32" />
                <asp:Parameter Name="ImageSanPham" Type="String" />
                <asp:Parameter Name="DanhGia" Type="Int32" />
                <asp:Parameter Name="KhuyenMai" Type="Int32" />
                <asp:Parameter Name="MaHang" Type="String" />
            </InsertParameters>
           
            <UpdateParameters>
                <asp:Parameter Name="TenSP" Type="String" />
                <asp:Parameter Name="DonGIa" Type="Int32" />
                <asp:Parameter Name="SoLuong" Type="Int32" />
                <asp:Parameter Name="ImageSanPham" Type="String" />
                <asp:Parameter Name="DanhGia" Type="Int32" />
                <asp:Parameter Name="KhuyenMai" Type="Int32" />
                <asp:Parameter Name="MaHang" Type="String" />
                <asp:Parameter Name="MaSP" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

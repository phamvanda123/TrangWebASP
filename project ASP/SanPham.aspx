<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="project_ASP.SanPham" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="demo" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/images/imagesMain/backroundGiaDien.jpg" alt="Slied-1" class="d-block image-carousel vh-100" style="width: 100%;">
                <div class="carousel-caption carousel-2 d-flex flex-column justify-content-center" style="height: 90vh;">
                    <div class="image">
                    </div>
                    <div>
                        <img class="" src="/images/logo.png" alt="">
                    </div>
                    <h1><b class="scan-text">VDSHOP</b></h1>
                    <h5>Chuyên bán các loại điện thoại</h5>
                    <h3><b>Giá rẻ bất ngờ</b></h3>
                    <div class="divbtn">
                        <div class="btn btn-outline-danger mb-3">Khám Phá Ngay</div>
                    </div>
                    <img src="/images/item Shop/item1.png" alt="" class="imgItemShow itemShow1">
                    <img src="images/item Shop/item2.png" alt="" class="imgItemShow itemShow2">
                    <img src="/images/item Shop/item3.png" alt="" class="imgItemShow itemShow3">
                    <img src="images/item Shop/item4.png" alt="" class="imgItemShow itemShow4">
                    <img src="images/item Shop/item5.png" alt="" class="imgItemShow itemShow5">
                </div>
            </div>
            <div class="carousel-item">
                <img src="/images/imagesMain/backroundGiaDien.jpg" alt="Slied-1" class="d-block image-carousel vh-100" style="width: 100%;">
                <div class="carousel-caption vh-100 d-flex justify-content-center flex-column carousel-1">
                    <div class="row" style="height: 50%;">
                        <div class="col-sm-6 d-flex justify-content-end" style="height: 100%;">
                            <div class="img d-flex justify-content-center" style="width: 100%;">
                                <img src="/images/imagesMain/headphone.png" alt="">
                            </div>
                        </div>
                        <div class="col-sm-6 d-flex justify-content-center flex-column text-reponsive" style="height: 100%;">
                            <h2 class="text-end"><b>40% OFF</b></h2>
                            <h1 style="font-size: 70px;" class="text-end"><b class="animate-charcter">BLACK FRIDAY</b></h1>
                            <h3 class="text-end">Giảm giá từ 10-40% Các loại sản phẩm có trên shop</h3>
                            <div class="btn btn-outline-danger mt-5">Khám Phá Ngay</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/images/imagesMain/backroundGiaDien.jpg" alt="New York" class="d-block image-carousel vh-100" style="width: 100%;">
                <div class="carousel-caption carousel-3 vh-100 d-flex justify-content-center flex-column">
                    <div class="row" style="height: 50vh;">
                        <div class="col-sm-6 item-reponsive">
                            <div class="carousel-my-item d-flex" data-aos="zoom-in-right" style="height: 100%;">
                                <div class="card me-2">
                                    <img src="/images/item Shop/item11.png" alt=""></div>
                                <div class="card card-2 me-2">
                                    <img src="/images/item Shop/item3.png" alt=""></div>
                                <div class="card card-3">
                                    <img src="/images/item Shop/item6.png" alt=""></div>
                            </div>
                        </div>
                        <div class="col-sm-6 d-flex justify-content-center flex-column text-reponsive1">
                            <div>
                                <h1 class="text-end"><span class="animate-charcter"><b>ĐIỆN THOẠI CHÍNH HÃNG</b></span></h1>
                            </div>
                            <div class="d-flex justify-content-end mb-4">
                                <h2 class="text-center me-5" style="font-family: 'Dancing Script', cursive;">mua điện thoại tặng phụ kiện chính hãng
                                    <br>
                                    nhận ưu đãi bất ngờ</h2>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <div class="btn btn-my-basic mb-4 btn-my-active">Mua Ngay</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <section class="ss-loc mybackgroundMain pt-2 pb-5">
        <h1 class="title text-center mb-3 text-white">Lọc sản phẩm</h1>
        <div class="container d-flex justify-content-center">
            <div class="dropdown mx-2">
                <button type="button" id="reload" class="btn btn-primary">
                    <i class="fa-solid fa-filter"></i>Tất cả sản phẩm
                </button>
            </div>
            <div class="dropdown mx-2">
                <button
                    type="button"
                    class="btn btn-primary dropdown-toggle"
                    data-bs-toggle="dropdown">
                    Hãng
                </button>
                <ul class="dropdown-menu" id="TenHang"></ul>
            </div>
            <div class="dropdown mx-2">
                <button
                    type="button"
                    class="btn btn-primary dropdown-toggle"
                    data-bs-toggle="dropdown">
                    Giá
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="?id=2&data=1">2.000.000đ - 4.000.000đ</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="?id=2&data=2">4.000.000đ - 6.000.000đ</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="?id=2&data=3">Trên 6.000.000đ</a>
                    </li>
                </ul>
            </div>
            <div class="dropdown mx-2">
                <button
                    type="button"
                    class="btn btn-primary dropdown-toggle"
                    data-bs-toggle="dropdown">
                    RAM
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="?id=3&data=1">2GB</a></li>
                    <li><a class="dropdown-item" href="?id=3&data=2">3GB</a></li>
                    <li><a class="dropdown-item" href="?id=3&data=3">4GB</a></li>
                    <li><a class="dropdown-item" href="?id=3&data=4">6GB</a></li>
                    <li><a class="dropdown-item" href="?id=3&data=5">8GB</a></li>
                    <li><a class="dropdown-item" href="?id=3&data=6">12GB</a></li>
                </ul>
            </div>
            <div class="dropdown mx-2">
                <button
                    type="button"
                    class="btn btn-primary dropdown-toggle"
                    data-bs-toggle="dropdown">
                    Dung lượng lưu trữ
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="?id=4&data=1">32GB</a></li>
                    <li><a class="dropdown-item" href="?id=4&data=2">64GB</a></li>
                    <li><a class="dropdown-item" href="?id=4&data=3">128GB</a></li>
                    <li><a class="dropdown-item" href="?id=4&data=4">256GB</a></li>
                    <li><a class="dropdown-item" href="?id=4&data=5">512GB</a></li>
                    <li><a class="dropdown-item" href="?id=4&data=6">1T</a></li>
                </ul>
            </div>
            <div class="dropdown mx-2">
                <button
                    type="button"
                    class="btn btn-primary dropdown-toggle"
                    data-bs-toggle="dropdown">
                    Pin
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="?id=5&data=1">Pin dưới 5000</a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="?id=5&data=2">Pin khủng trên 5000</a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <section class="ss-san-pham mybackgroundMain pb-5">
        <div id="ContentSanPham" class="container">
            <h1 class="title text-center mb-3 text-white">Sản Phẩm</h1>
            <div class="row d-flex justify-content-center">
            <asp:Repeater ID="Repeater1" runat="server" >
                <ItemTemplate>
                    <div class="col-sm-3 my-2" data-aos="zoom-in">
                        <div class="card card-item" khuyenmai="Giảm <%# Eval("KhuyenMai") %>%">
                            <div class="card-body">
                                <div class="image-item mb-5">
                                    <img src=" <%# "admin/ImagesUpLoad/"+Eval("ImageSanPham") %>" alt="" />
                                </div>
                                <asp:Button  CssClass="add-to-cart btn-my-basic mt-3 btn text-dark" CommandArgument='<%# Eval("MaSP") %>' OnClick="btn_addtocart_Click" runat="server" Text="Thêm vào giỏ hàng" />
                                <asp:Button runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="XemChiTiet_Click" class="btn btn-my-basic btn-xem-chi-tiet text-dark mt-2" Text="Xem Chi Tiết"/>
                                <div class="my-3" style="opacity: 0">.</div>
                                <div class="name-item mt-1">
                                    <%# Eval("TenSP") %>
                                </div>
                                <div class="danh-gia mt-1 mycolorMain">
                                    <%#  HttpUtility.HtmlDecode(Eval("DanhGia").ToString()) %>
                                </div>
                                <div class="don-gia-item mt-2">
                                    <span id="donGia"> <%# int.Parse(Eval("DonGia").ToString()).ToString("N0") %></span>đ
                    <span class="text-danger text-gach"> <%# (int.Parse(Eval("DonGia").ToString())+int.Parse(Eval("DonGia").ToString())*int.Parse(Eval("KhuyenMai").ToString())/100).ToString("N0") %>đ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                     <%# (Container.ItemIndex + 1) % 3 == 0 ? "</div> <div class='row d-flex justify-content-center'>" : "" %>
                </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script>
        AOS.init();
    </script>
</asp:Content>

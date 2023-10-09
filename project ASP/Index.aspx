<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="project_ASP.Index" %>
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
                                <div class="card me-2"><img src="/images/item Shop/item11.png" alt=""></div>
                                <div class="card card-2 me-2"><img src="/images/item Shop/item3.png" alt=""></div>
                                <div class="card card-3"><img src="/images/item Shop/item6.png" alt=""></div>
                            </div>
                        </div>
                        <div class="col-sm-6 d-flex justify-content-center flex-column text-reponsive1">
                            <div>
                                <h1 class="text-end"><span class="animate-charcter"><b>ĐIỆN THOẠI CHÍNH HÃNG</b></span></h1>
                            </div>
                            <div class="d-flex justify-content-end mb-4">
                                <h2 class="text-center me-5" style="font-family: 'Dancing Script', cursive;">mua điện thoại tặng phụ kiện chính hãng <br> nhận ưu đãi bất ngờ</h2>
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
    <div class="container-fluid py-3 mybackgroundMain d-flex justify-content-center">
        <marquee class="flicker" style="width: 90%; font-size: larger;"><i class="fa-solid fa-triangle-exclamation fa-fade"></i> <span class="animate-charcter"><b>Rất nhiều khuyến mãi đang đợi bạn</b></span><i class="fa-solid fa-triangle-exclamation fa-fade"></i></marquee>
    </div>
    <section class="ss-sale mybackgroundMain pb-5">
        <div class="container">
            <div class="row ">
                <div class="col-sm-3 my-5 py-3">
                    <div class="flip-box">
                        <div class="flip-box-inner">
                            <div class="flip-box-front">
                                <img src="images/11.11.jpg" alt="Paris " style="width:100%;">
                            </div>
                            <div class="flip-box-back d-flex justify-content-center flex-column">
                                <h2>Giảm giá thêm 10%</h2>
                                <p>Giảm giá thêm 10% mỗi sản phẩm nếu nhập mã: PHAMVANDASHOP</p>
                                <p>nhanh tay nhập ngay</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-5 py-3">
                    <div class="flip-box ">
                        <div class="flip-box-inner">
                            <div class="flip-box-front">
                                <img src="images/2.jpg" alt="Paris " style="width:100%;">
                            </div>
                            <div class="flip-box-back d-flex justify-content-center flex-column">
                                <h2>Back Friday</h2>
                                <p>mua hàng vào ngày thứ 6 21/11/2003 Giảm giá đặc quyền từ 10% đến 40% tất cả các loại Sản phẩm trên shop</p>
                                <p>nhanh tay mua ngay</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-5 py-3">
                    <div class="flip-box ">
                        <div class="flip-box-inner">
                            <div class="flip-box-front">
                                <img src="images/3.jpg" alt="Paris " style="width:100%;">
                            </div>
                            <div class="flip-box-back d-flex justify-content-center flex-column">
                                <h2>Giảm giá thêm 30%</h2>
                                <p>Giảm giá thêm 30% cho đơn hàng từ 1 triệu đồng trở lên khi nhập mã 1TRDONG</p>
                                <p>nhanh tay nhập ngay</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-5 py-3">
                    <div class="flip-box ">
                        <div class="flip-box-inner">
                            <div class="flip-box-front">
                                <img src="images/4.jpg" alt="Paris " style="width:100%;">
                            </div>
                            <div class="flip-box-back d-flex justify-content-center flex-column">
                                <h2>Ưu đãi quà tặng</h2>
                                <p>Tặng kèm phụ kiện khi mua điện thoại trên shop</p>
                                <p>nhanh tay mua ngay</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ss-1 mybackgroundMain text-white">
        <div class="container py-3">
            <div class="row">
                <div class="col-sm-6" data-aos-duration="1500" data-aos="fade-left">
                    <h1><b>Miễn Phí Giao hàng</b></h1>
                    <h3>Mua ngay hôm nay</h3>
                    <p class="mt-3"> Hãy tận hưởng ưu đãi đặc biệt của chúng tôi và tiết kiệm chi phí giao hàng với mỗi đơn hàng trên 500.000đ. Không chỉ tiết kiệm tiền của bạn, chúng tôi còn đảm bảo giao hàng miễn phí trên toàn quốc, đến tận tay bạn một cách nhanh chóng và an toàn. Hãy đặt hàng ngay hôm nay và trải nghiệm dịch vụ chất lượng của chúng tôi!</p>
                </div>
                <div class="col-sm-6 d-flex justify-content-center " data-aos-duration="1500" data-aos="fade-right">
                    <img src="/images/imagesMain/Đỏ Hình minh họa Tờ rơi quảng cáo (2).gif" style="width: 80%; height: 70vh;" alt="">
                </div>
            </div>
        </div>
        <div class="container py-3">
            <div class="row">
                <div class="col-sm-6">
                </div>
                <div class="col-sm-6"></div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script>
        AOS.init();
    </script>
</asp:Content>

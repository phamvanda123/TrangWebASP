<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="project_ASP.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/styleAboutUs.css">       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="ss-aboutUs myfont" style="width: 100vw; overflow: hidden">
      <div
        class="container pt-4 aboutUs-1 vh-100 d-flex justify-content-center flex-column"
      >
        <div class="row py-4 d-flex justify-content-center">
          <div class="col-sm-6 d-flex justify-content-center flex-column p-3">
            <h1 class="text-center mb-3">Giới thiệu về Pham Van Da Shop</h1>
            <h4 style="text-align: justify">
              là thành quả nghiên cứu và phát triển của đội ngũ chuyên gia
              Caesar. Trải nghiệm mua hàng trên trang web một cách tiện nghi và
              hứng khởi được hình thành bởi sự kết hợp kỹ thuật – mĩ thuật hiện
              đại. Các sản phẩm bán trên shop đa dạng về phong cách thiết kế,
              trang thiết bị; phụ kiện tiên tiến, dịch vụ hoàn chỉnh và tận tâm.
              Tất cả chỉ có tại Pham Van Da shop.
            </h4>
          </div>
          <div class="col-sm-1"></div>
          <div class="col-sm-5">
            <div class="img">
              <div class="img1 actionRight"></div>
              <div class="img2 actionLeft"></div>
              <img
                class="actionTop imgMain1"
                style="width: 70%; transform: translateY(200)"
                src="/images/aboutUs2.jpg"
                alt=""
              />
            </div>
          </div>
        </div>
      </div>
      <div
        class="container mt-5 mb-5 pt-4 aboutUs-2 vh-100 d-flex justify-content-center flex-column"
      >
        <div class="row">
          <div class="col-sm-5 img2-reponsive d-flex justify-content-center">
            <div class="img" style="position: relative">
              <div class="img3 actionRight"></div>
              <div class="img4 actionLeft"></div>
              <img
                class="actionBottom imgMain2"
                style="width: 70%"
                src="/images/abouUs1.jpg"
                alt=""
              />
            </div>
          </div>
          <div class="col-sm-5">
            <h2 style="text-align: justify">
              Chúng tôi luôn luông tập trung vào việc đảm bảo quyền lợi và cố
              gắng làm cho trãi nghiệm của khách hàng đối với chúng tôi là tốt
              nhất
            </h2>
            <h4 style="text-align: justify">
              Trang web VD shop tạo một giao diện dễ sử dụng cho người dùng và
              đảm bảo quyền lợi là tốt nhất cho khách hàng, lấy uy tín làm đầu,
              với những chính sách trả hàng, chính sách khuyến mãi, giúp cho
              trãi nghiệm của khách hàng khi đến với trang web của chúng tôi
              luôn là tốt nhất
            </h4>
          </div>
        </div>
      </div>
      <div class="container mt-5 mb-5 pt-4 aboutUs-2">
        <div class="row my-5 py-5">
          <div class="col-sm-5 d-flex justify-content-center">
            <div
              class="imgMain3"
              data-aos="fade-right"
              data-aos-duration="1500"
              style="position: relative"
            >
              <div
                class="img5"
                data-aos="fade-left"
                data-aos-duration="750"
              ></div>
              <div class="actionImg3">
                <img
                  src="/images/AboutUsê.jpg"
                  style="width: 100%; height: 100%"
                  alt=""
                />
              </div>
              <img
                class="actionImg"
                style="width: 70%; opacity: 0; z-index: -999"
                src="/images/abouUs1.jpg"
                alt=""
              />
            </div>
          </div>
          <div class="col-sm-5 ms-5">
            <div class="imgMain2" style="position: relative">
              <img
                style="width: 70%; opacity: 0"
                src="/images/abouUs1.jpg"
                alt=""
              />
              <div class="hinhTron" data-aos="zoom-in-left"></div>
              <div class="img6 p-3" data-aos="fade-up" data-aos-duration="1500">
                <h1 class="text-center">Điều khoản sử dụng</h1>
                <p class="text-white" style="text-align: justify">
                  Khi quý khách hàng truy cập vào trang website của chúng tôi có
                  nghĩa là quý khách đồng ý với các điều khoản này. Trang web có
                  quyền thay đổi, chỉnh sửa, thêm hoặc lược bỏ bất kỳ phần nào
                  trong Điều khoản mua bán hàng hóa này, vào bất cứ lúc nào. Các
                  thay đổi có hiệu lực ngay khi được đăng trên trang web mà
                  không cần thông báo trước. Và khi quý khách tiếp tục sử dụng
                  trang web, sau khi các thay đổi về Điều khoản này được đăng
                  tải, có nghĩa là quý khách chấp nhận với những thay đổi đó.
                  Quý khách hàng vui lòng kiểm tra thường xuyên để cập nhật
                  những thay đổi của chúng tôi.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="my-5 ss-cuoi">
      <div class="container-fluid ss-end-element" style="width: 100%"></div>
      <div class="ss-end d-flex justify-content-center">
        <img
          data-aos="fade-down"
          data-aos-easing="linear"
          data-aos-duration="1000"
          style="width: 70%; border-radius: 10px"
          src="images/Add Description Here.png"
          alt=""
        />
      </div>
      <div class="btn ket-noi btn-my-basic" data-aos="fade-left">kết nối</div>
    </section>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
     <script>
         AOS.init();
         window.addEventListener("scroll", function () {
             const x = this.pageYOffset
             if (x > this.window.innerHeight) {
                 document.querySelector(".img1").classList.remove("actionRight")
                 document.querySelector(".img2").classList.remove("actionLeft")
                 document.querySelector(".imgMain1").classList.remove("actionTop")
             } else {
                 document.querySelector(".img1").classList.add("actionRight")
                 document.querySelector(".img2").classList.add("actionLeft")
                 document.querySelector(".imgMain1").classList.add("actionTop")
             }
             if (x < (this.window.innerHeight * 2) && x > (this.window.innerHeight / 4)) {
                 document.querySelector(".img3").classList.add("actionRight")
                 document.querySelector(".img4").classList.add("actionLeft")
                 document.querySelector(".imgMain2").classList.add("actionTop")

             } else {
                 document.querySelector(".img3").classList.remove("actionRight")
                 document.querySelector(".img4").classList.remove("actionLeft")
                 document.querySelector(".imgMain2").classList.remove("actionTop")
             }
         })
     </script>
    
</asp:Content>

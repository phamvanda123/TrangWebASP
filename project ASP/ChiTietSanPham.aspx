<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.Master" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="project_ASP.ChiTietSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Style the tab */

@media (max-width:430px) {
    #expandedImg {
        height: 50vh !important;
    }
}

.tab {
    overflow: hidden;
}


/* Style the buttons inside the tab */

.tab button {
    background-color: bisque;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    transition: 0.3s;
    font-size: 17px;
}


/* Change background color of buttons on hover */

.tab button:hover {
    background-color: #ddd;
}


/* Create an active/current tablink class */

.tab button.active {
    background-color: #ccc;
}


/* Style the tab content */

.tabcontent {
    display: none;
    padding: 6px 12px;
    -webkit-animation: fadeEffect 1s;
    animation: fadeEffect 1s;
}
.fistContent{
    display: block;
}


/* Fade in tabs */

@-webkit-keyframes fadeEffect {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes fadeEffect {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.column img {
    opacity: 0.8;
    cursor: pointer;
}

.column img:hover {
    opacity: 1;
}


/* Clear floats after the columns */

.row:after {
    content: "";
    display: table;
    clear: both;
}


/* The expanding image container (positioning is needed to position the close button and the text) */

.container1 {
    position: relative;
}


/* Expanding image text */

#imgtext {
    position: absolute;
    bottom: 15px;
    left: 15px;
    color: white;
    font-size: 20px;
}
/* #CauHinh tr:nth-of-type(odd){
    color: black;
    background-color: #f2f2f2;
} */
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="ss-chi-tiet-sp mybackgroundMain">
      <div class="container py-3 text-white">
        <div class="row">
          <div class="col-sm-6">
            <div class="container1 d-flex justify-content-center">
              <!-- Expanded image -->
              <img id="expandedImg" runat="server" src="" style="width: 100%; height: 25vw" />
              <!-- Image text -->
              <!-- <div id="imgtext"></div> -->
            </div>
            <!-- The grid: four columns -->
            <div class="row mt-3 px-2">
              <div class="column" style="width: 25%">
                <img
                  src="" runat="server"
                  id="ImageChiTiet1"
                  style="width: 100%; height: 100%"
                  alt="Nature"
                  onclick="myFunction(this);"
                />
              </div>
              <div class="column" style="width: 25%">
                <img
                  src="" runat="server"
                  id="ImageChiTiet2"
                  style="width: 100%; height: 100%"
                  alt="Snow" runat="server"
                  onclick="myFunction(this);"
                />
              </div>
              <div class="column" style="width: 25%">
                <img
                  src="" runat="server"
                  id="ImageChiTiet3"
                  style="width: 100%; height: 100%"
                  alt="Mountains"
                  onclick="myFunction(this);"
                />
              </div>
              <div class="column" style="width: 25%">
                <img
                  src=""
                  id="ImageChiTiet4" runat="server"
                  style="width: 100%; height: 100%"
                  alt="Lights"
                  onclick="myFunction(this);"
                />
              </div>
            </div>
          </div>
          <div class="col-sm-6 d-flex justify-content-center">
            <div>
              <h3 class="mt-5">
                <b id="NameSP" runat="server"></b>
              </h3>
              <h2 class="mt-3">
                <span class="text-danger" id="GiaKM" runat="server"></span>
                <span class="text-gach" id="GiaCKM" runat="server"></span>
              </h2>
              <p>
                <br />
                Đánh Giá:
                <span class="mycolorMain" id="DanhGia" runat="server"> </span>
              </p>
              <p>THÔNG TIN SẢN PHẨM:</p>
              <table id="CauHinh">
                  <tr>
    <td>Màn hình:</td>
    <td class="text-end" id="ManHinh" runat="server"></td>
    </tr>
    <tr>
    <td>Hệ Điều Hành:</td>
    <td class="text-end" id="HeDieuHanh" runat="server"></td>
    </tr>
    <tr>
    <td>Camera Sau:</td>
    <td class="text-end" id="CameraSau" runat="server"></td>
    </tr>
    <tr>
    <td>Camera Trước:</td>
    <td class="text-end" id="CameraTruoc" runat="server"></td>
    </tr>
    <tr>
    <td>Chip:</td>
    <td class="text-end" id="Chip" runat="server"></td>
    </tr>
    <tr>
    <td>Ram:</td>
    <td class="text-end" id="Ram" runat="server"></td>
    </tr>
    <tr>
    <td>Dung Lượng Lưu Trữ:</td>
    <td class="text-end" id="DungLuong" runat="server"></td>
    </tr>
    <tr>
    <td>Pin</td>
    <td class="text-end" id="LuuTru" runat="server"></td>
    </tr>
              </table>
              <div class="row px-3 mt-4">
                <div class="col-sm-6">
                  <asp:Button runat="server" 
                    Width="200"
                    CssClass="add-to-cart btn btn-my-basic mb-4"
                      Text="Thêm Vào Giỏ Hàng"
                      OnClick="Unnamed_Click"
                  />
                    
                </div>
                <div class="col-sm-4 mx-3">
                  <a href="ThanhToan.aspx">
                    <div index="3" style="width: 200px" class="btn btn-my-basic add-to-cart">
                      Mua Ngay
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid">
        <div class="mybackgroundMain py-3 px-5 text-white ms-5">
          <div class="tab">
            <div
              style="border-radius: 5px 0 0 5px"
              class="tablinks btn btn-success"
              onclick="openCity(event, 'London')"
            >
              Sản Phẩm
            </div>
            <div
              style="border-radius: 0 5px 5px 0"
              class="tablinks btn btn-success"
              onclick="openCity(event, 'Paris')"
            >
              Đánh giá của khách hàng
            </div>
          </div>
          <div id="London" class="tabcontent fistContent">
            <h3 class="text-center my-5">Thông tin sản Phẩm</h3>
            <div class="row my-5">
              <div class="col-sm-6" id="MoTa1">
                  iPhone 14 Pro Max một siêu phẩm trong giới smartphone được nhà Táo tung ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.
Thiết kế cao cấp bền bỉ
iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng.


              </div>
              <div class="col-sm-6">
                <div class="d-flex justify-content-center">
                  <img src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" alt="" id="ImageMoTa1" style="max-width: 100%" />
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-6">
                <div class="d-flex justify-content-center">
                  <img id="ImageMoTa2" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-041222-103242.jpg" style="max-width: 100%" alt="" />
                </div>
              </div>
              <div class="col-sm-6" id="MoTa2">
                  Dòng Pro năm nay được ra mắt với nhiều tùy chọn màu sắc và trong đó nổi bật nhất có lẽ là phiên bản Deep Purple (tím), bởi vì đây là một màu mới nên mang lại độ nhận diện khá cao.
Nổi bật với thiết kế màn hình mới
Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.
              </div>
            </div>
          </div>
          <div id="Paris" class="tabcontent">
            <div class="row ms-1">
              <div class="img py-1" style="width: 8%">
                <img src="images/item Shop/1.png" alt="" style="width: 100%" />
              </div>
              <div class="d-flex flex-column" style="width: 30%">
                Lê Văn Toàn <br />
                <span class="mycolorMain">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  5.0
                  <span class="text-secondary" style="font-size: small"
                    >3 Ngày trước</span
                  >
                </span>
              </div>
            </div>
            <div class="ms-1 mt-2">Sản Phẩm rất tốt rất đáng để mua</div>
            <div class="row ms-1 mt-4">
              <div class="img py-1" style="width: 8%">
                <img src="images/item Shop/2.png" alt="" style="width: 100%" />
              </div>
              <div class="d-flex flex-column" style="width: 30%">
                Phạm thị Trúc <br />
                <span class="mycolorMain">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  5.0
                  <span class="text-secondary" style="font-size: small"
                    >3 Ngày trước</span
                  >
                </span>
              </div>
            </div>
            <div class="ms-1 mt-2">
              Mua trúng đợt shop ưu đãi giảm giá, vải chất lượng đã vậy còn được
              giảm giá nữa chứ, thích quá thích
            </div>
            <div class="row ms-1 mt-4">
              <div class="img py-1" style="width: 8%">
                <img src="images/item Shop/3.png" alt="" style="width: 100%" />
              </div>
              <div class="d-flex flex-column" style="width: 30%">
                Phạm Văn Dã<br />
                <span class="mycolorMain">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  5.0
                  <span class="text-secondary" style="font-size: small"
                    >3 Ngày trước</span
                  >
                </span>
              </div>
            </div>
            <div class="ms-1 mt-2">
              Sản phẩm tốt, ổn áp trong tầm giá như vậy, mình đã mua ở rất nhiều
              nơi rồi mà không nơi nào làm mình hài lòng như nơi này cả
            </div>
            <div class="row ms-1 mt-4">
              <div class="img py-1" style="width: 8%">
                <img src="images/item Shop/1.png" alt="" style="width: 100%" />
              </div>
              <div class="d-flex flex-column" style="width: 30%">
                Lê Văn Khánh <br />
                <span class="mycolorMain">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  5.0
                  <span class="text-secondary" style="font-size: small"
                    >3 Ngày trước</span
                  >
                </span>
              </div>
            </div>
            <div class="ms-1 mt-2">
              Dịch vụ chăm sóc khách hàng ở shop này rất tốt luôn mọi người ạ,
              sản phẩm lại còn ổn áp nữa chứ
            </div>
            <button class="btn btn-primary my-3">
              <i class="fa-solid fa-star"></i> Viết đánh giá
            </button>
          </div>
        </div>
      </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script>
      function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
          evt.currentTarget.className += " active";
          
      }
      // img
      function myFunction(imgs) {
        // Get the expanded image
        var expandImg = document.getElementById("expandedImg");
        // Get the image text
        // var imgText = document.getElementById("imgtext");
        // Use the same src in the expanded image as the image being clicked on from the grid
        expandImg.src = imgs.src;
        // Use the value of the alt attribute of the clickable image as text inside the expanded image
        imgText.innerHTML = imgs.alt;
        // Show the container element (hidden with CSS)
        expandImg.parentElement.style.display = "block";
      }
    </script>
</asp:Content>

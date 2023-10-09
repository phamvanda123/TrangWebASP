<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="project_ASP.admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row mt-5 ms-3">
                    <div class="col-xl-5 col-lg-6">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body">
                                        <div class="float-end">
                                            <i class="mdi mdi-account-multiple widget-icon"></i>
                                        </div>
                                        <h5 class="text-muted fw-normal mt-0" title="Number of Customers">
                                            Số lượng tài khoản
                                        </h5>
                                        <h3 class="mt-3 mb-3" id="SLTaiKhoan" runat="server">36,254</h3>
                                        <p class="mb-0 text-muted">
                                        </p>
                                    </div>
                                    <!-- end card-body-->
                                </div>
                                <!-- end card-->
                            </div>
                            <!-- end col-->

                            <div class="col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body">
                                        <div class="float-end">
                                            <i class="mdi mdi-cart-plus widget-icon"></i>
                                        </div>
                                        <h5 class="text-muted fw-normal mt-0" title="Number of Orders">
                                            Tổng Số Đơn Hàng
                                        </h5>
                                        <h3 class="mt-3 mb-3" id="TongDonDatHang" runat="server">5,543</h3>
                                        <p class="mb-0 text-muted">
                                        </p>
                                    </div>
                                    <!-- end card-body-->
                                </div>
                                <!-- end card-->
                            </div>
                            <!-- end col-->
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body">
                                        <div class="float-end">
                                            <i class="mdi mdi-currency-usd widget-icon"></i>
                                        </div>
                                        <h5 class="text-muted fw-normal mt-0" title="Average Revenue">
                                            Tổng Doanh Thu
                                        </h5>
                                        <h3 class="mt-3 mb-3"  id="TongDoanhThu" runat="server">$6,254</h3>
                                        <p class="mb-0 text-muted">

                                        </p>
                                    </div>
                                    <!-- end card-body-->
                                </div>
                                <!-- end card-->
                            </div>
                            <!-- end col-->

                            <div class="col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body">
                                        <div class="float-end">
                                            <i class="mdi mdi-pulse widget-icon"></i>
                                        </div>
                                        <h5 class="text-muted fw-normal mt-0" title="Growth">
                                            Sản Phẩm Tồn
                                        </h5>
                                        <h3 class="mt-3 mb-3" id="SanPhamTon" runat="server">+ 30.56%</h3>
                                        <p class="mb-0 text-muted">

                                        </p>
                                    </div>
                                    <!-- end card-body-->
                                </div>
                                <!-- end card-->
                            </div>
                            <!-- end col-->
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end col -->
                </div>
</asp:Content>

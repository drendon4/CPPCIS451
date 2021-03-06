﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel-group category-products" id="accordian">
    </div>
    <!-- MAIN-CONTENT-SECTION START -->
    <section class="main-content-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- BSTORE-BREADCRUMB START -->
                    <div class="bstore-breadcrumb">
                        <a href="default.aspx">Home</a>
                        <span><i class="fa fa-caret-right"></i></span>
                    </div>
                    <!-- BSTORE-BREADCRUMB END -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <!-- PRODUCT-LEFT-SIDEBAR START -->
                    <div class="product-left-sidebar">
                        <h2 class="left-title pro-g-page-title">Catalog</h2>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <!-- ALL CATEGORY-PRODUCT START -->
                    <div class="all-gategory-product">
                        <div class="row">
                            <asp:Label ID="lblCategoryName" runat="server" Text=""></asp:Label>
                            <ul class="gategory-product">
                                <asp:SqlDataSource ID="SqlDSFeaturedProduct" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand=""></asp:SqlDataSource>
                                <asp:Repeater ID="rpFeaturedProduct" runat="server" DataSourceID="SqlDSFeaturedProduct">
                                    <ItemTemplate>
                                        <!-- SINGLE ITEM START -->
                                        <li class="gategory-product-list col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="single-product-item">
                                                <div class="product-image">
                                                    <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>">
                                                        <img src="images/<%# Eval("ProductName")%>.jpg" alt="images/<%# Eval("ProductName") %>.jpg" /></a>
                                                    <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>" class="new-mark-box">new</a>
                                                </div>
                                                <div class="product-info">
                                                    <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><%# Eval("ProductID")%><br />
                                                        <%# Eval("ProductName")%></a>
                                                    <div class="price-box">
                                                        <span class="price"><%# Eval("Price")%></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- SINGLE ITEM END -->
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                    <!-- ALL CATEGORY-PRODUCT END -->
                </div>
            </div>
        </div>
    </section>
</asp:Content>

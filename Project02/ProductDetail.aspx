<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ProductDetail.aspx.vb" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- MAIN-CONTENT-SECTION START -->
    <section class="main-content-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- BSTORE-BREADCRUMB START -->
                    <div class="bstore-breadcrumb">
                        <%-- <a href="default.aspx">Home</a>

                        <asp:HyperLink ID="hlBCMainCategory" runat="server" NavigateUrl=".">
                            <asp:Label ID="lblBCMainCategory" runat="server" Text=""></asp:Label>
                        </asp:HyperLink>

                        <asp:HyperLink ID="hlBCSubCategory" runat="server" NavigateUrl=".">
                            <asp:Label ID="lblBCSubCategory" runat="server" Text=""></asp:Label>
                        </asp:HyperLink>--%>
                    </div>
                    <!-- BSTORE-BREADCRUMB END -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <!-- SINGLE-PRODUCT-DESCRIPTION START -->
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
                            <div class="single-product-view">
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="thumbnail_1">
                                        <div class="single-product-image">
                                            <a class="new-mark-box" href="#">new</a>
                                            <asp:Image ID="imgProduct" runat="server" ImageUrl="." AlternateText="." ImageAlign="Middle"></asp:Image>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-8 col-xs-12">
                            <div class="single-product-descirption">
                                <h2>
                                    <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label>
                                </h2>
                                <div class="single-product-condition">
                                    <p>
                                        Reference: 
                                        <span>
                                            <asp:Label ID="lblProductID" runat="server" Text=""></asp:Label>
                                        </span>
                                    </p>
                                </div>
                                <div class="single-product-price">
                                    <h2>$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></h2>
                                </div>
                                <div class="single-product-desc">
                                    <p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you're ready for summer!</p>
                                    <div class="product-in-stock">
                                        <p>300 Items<span>In stock</span></p>
                                    </div>
                                </div>
                                <div class="single-product-quantity">
                                    <p class="small-title">Quantity</p>
                                    <div class="cart-quantity">
                                        <div class="cart-plus-minus-button single-qty-btn">
                                            <asp:TextBox ID="tbQuantity" runat="server" CssClass="cart-plus-minus sing-pro-qty" value="1"></asp:TextBox>                                           
                                        </div>  
                                    </div>
                                </div>
                                <asp:CompareValidator ID="ValidateInt" runat="server" Operator="DataTypeCheck" Type="Integer" 
                                                ControlToValidate="tbQuantity" ErrorMessage="Value must be a whole number" />
                                            <asp:CompareValidator ID="ValidatePositive" runat="server" Operator="GreaterThan" Type="Integer"
                                                ControlToValidate="tbQuantity" ErrorMessage="Must be whole number greater than 0" ValueToCompare="0" />
                                <div class="single-product-add-cart">
                                    <asp:Button ID="btnAddtoCart" runat="server" Text="Add to Cart" CssClass="add-cart-text" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- SINGLE-PRODUCT-DESCRIPTION END -->
                </div>
            </div>
        </div>
    </section>
    <!-- MAIN-CONTENT-SECTION END -->
</asp:Content>

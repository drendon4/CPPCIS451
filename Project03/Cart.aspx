<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Cart" %>

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
                        <a href="default.aspx">HOME</a>
                        <span><i class="fa fa-caret-right"></i></span>
                        <span>Your shopping cart</span>
                    </div>
                    <!-- BSTORE-BREADCRUMB END -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- SHOPPING-CART SUMMARY START -->
                    <h1>
                        <span>
                            <asp:Label ID="lblPage" runat="server" Text="" CssClass="page-title" Font-Size="20px"></asp:Label>
                        </span>
                    </h1>
                    <asp:Button ID="btnClear" runat="server" Text="Clear Cart" CssClass="add-cart-text" OnClick="btnClear_Click" Visible="false" />
                    <asp:Label ID="lblCartTotal" runat="server" Text=""></asp:Label>
                    <!-- SHOPPING-CART SUMMARY END -->
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- CART TABLE_BLOCK START -->
                    <div class="table-responsive">
                        <asp:SqlDataSource ID="SqlDSCart" runat="server" DataSourceMode="DataSet"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                        <asp:ListView ID="lvCart" runat="server" DataSourceID="SqlDSCart"
                            OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="CartID,ProductID"
                            CellSpacing="0" RepeatColumns="1" DataKeyNames="CartID">
                            <LayoutTemplate>
                                <!-- TABLE START -->
                                <table class="table table-bordered" id="cart-summary">
                                    <!-- TABLE HEADER START -->
                                    <thead>
                                        <tr>
                                            <th class="cart-product">Product</th>
                                            <th class="cart-description">Description</th>
                                            <th class="cart-unit text-right">Unit price</th>
                                            <th class="cart_quantity text-center">Qty</th>
                                            <th class="cart-total text-right">Total</th>
                                        </tr>
                                    </thead>
                                    <!-- TABLE HEADER END -->
                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder" />
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                            </GroupTemplate>

                            <ItemTemplate>
                                <!-- TABLE BODY START -->
                                <tr>
                                    <td class="cart-product">
                                        <img src="images/<%# Eval("ProductName")%>.jpg" alt="images/<%# Eval("ProductName") %>.jpg" /></a>
                                    </td>
                                    <td class="cart-description">
                                        <h4 class="product-name"><%# Eval("ProductName")%></h4>
                                        <p>Web ID: <%# Eval("ProductID")%></p>
                                    </td>
                                    <td class="cart-unit">
                                        <ul class="price text-right">
                                            <li class="price">$<%# Eval("Price")%></li>
                                        </ul>
                                    </td>
                                    <td class="cart_quantity text-center">
                                        <div>
                                            <asp:TextBox ID="tbQuantity" runat="server" CssClass="single-product-quantity" value='<%# Eval("Quantity")%>'></asp:TextBox>
                                            <asp:LinkButton runat="server" ID="lbUpdate" CssClass="cart-plus-minus" Text="UPDATE" CommandName="cmdUpdate" CommandArgument='<%# Eval("ProductID")%>' />
                                            <asp:LinkButton runat="server" ID="lbDelete" CssClass="cart-plus-minus" Text="DELETE" CommandName="cmdDelete" CommandArgument='<%# Eval("ProductID")%>' />
                                        </div>
                                        <asp:CompareValidator ID="ValidateInt" runat="server" Operator="DataTypeCheck" Type="Integer"
                                            ControlToValidate="tbQuantity" ErrorMessage="Value must be a whole number" />
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">$<%# Eval("Quantity") * Eval("Price")%></p>
                                    </td>
                                </tr>
                                <!-- TABLE BODY END -->
                            </ItemTemplate>
                        </asp:ListView>
                        <!-- TABLE END -->
                        <!-- SHOPPING-CART SUMMARY START -->
                    </div>
                    <!-- CART TABLE_BLOCK END -->
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- RETURNE-CONTINUE-SHOP START -->
                    <div class="returne-continue-shop">
                        <a href="default.aspx" class="continueshoping"><i class="fa fa-chevron-left"></i>Continue shopping</a>
                        <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout >" CssClass="btn main-btn procedtocheckout"></asp:Button>
                    </div>
                    <!-- RETURNE-CONTINUE-SHOP END -->
                </div>
            </div>
        </div>
    </section>
    <!-- MAIN-CONTENT-SECTION END -->
</asp:Content>

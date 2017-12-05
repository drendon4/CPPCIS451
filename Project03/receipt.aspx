<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Receipt.aspx.vb" Inherits="receipt" %>

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
                        <span>Receipt</span>
                    </div>
                    <!-- BSTORE-BREADCRUMB END -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- CART TABLE_BLOCK START -->
                    <div class="table-responsive">
                        <asp:SqlDataSource ID="SqlDSOrder" runat="server" DataSourceMode="DataSet"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                        <asp:ListView ID="lvOrderHead" runat="server" DataSourceID="SqlDSOrder" footer="true"
                           CellPadding="3" DataKeyField="CartID"
                            CellSpacing="0" RepeatColumns="1" DataKeyNames="CartID">
                            <LayoutTemplate>
                                <!-- TABLE START -->
                                <table class="table table-bordered" id="cart-summary">
                                    <!-- TABLE HEADER START -->
                                    <thead>
                                        <tr>
                                            <th class="cart-description">First Name</th>
                                            <th class="cart-description">Last Name</th>
                                            <th class="cart-description">Street</th>
                                            <th class="cart-description">City</th>
                                            <th class="cart-description">State</th>
                                            <th class="cart-description">Zip</th>
                                            <th class="cart-description">Email</th>
                                            <th class="cart-description">Phone</th>
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
                                    <td class="cart-description">
                                        <p><%#Eval("FirstName") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("LastName") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("Street1") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("City") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("State") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("Zip") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("Email") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("Phone") %></p>
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
                    <!-- CART TABLE_BLOCK START -->
                    <div class="table-responsive">
                        <asp:SqlDataSource ID="SqlDSCart" runat="server" DataSourceMode="DataSet"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
                        <asp:ListView ID="lvCart" runat="server" DataSourceID="SqlDSCart" footer="true"
                           CellPadding="3" DataKeyField="CartID,ProductID"
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
                                            <label id="quantity" class="product-info"><%# Eval("Quantity") %></label>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="price text-right">$<%# Eval("Quantity") * Eval("Price")%></p>
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
                    <div class="table-responsive">
                        <asp:ListView ID="lvOrderFoot" runat="server" DataSourceID="SqlDSOrder" footer="true"
                            CellPadding="3" DataKeyField="CartID"
                            CellSpacing="0" RepeatColumns="1" DataKeyNames="CartID">
                            <LayoutTemplate>
                                <!-- TABLE START -->
                                <table class="table table-bordered" id="cart-summary">
                                    <!-- TABLE HEADER START -->
                                    <thead>
                                        <tr>
                                            <th class="cart-description">Subtotal</th>
                                            <th class="cart-description">Shipping</th>
                                            <th class="cart-description">Tax</th>
                                            <th class="cart-description">Grand Total</th>
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
                                    <td class="cart-description">
                                        <p><%#Eval("Subtotal") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("Shipping") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("Tax") %></p>
                                    </td>
                                    <td class="cart-description">
                                        <p><%#Eval("Grandtotal") %></p>
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
                    </div>
                    <!-- RETURNE-CONTINUE-SHOP END -->
                </div>
            </div>
        </div>
    </section>
    <!-- MAIN-CONTENT-SECTION END -->
</asp:Content>

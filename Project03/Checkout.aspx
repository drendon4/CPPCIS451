<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>

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
                        <span>Authentication</span>
                        <asp:Label ID="errMsg" runat="server" Visible="false" CssClass="required-field"></asp:Label>
                    </div>
                    <!-- BSTORE-BREADCRUMB END -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="first_item primari-box">
                        <!-- DELIVERY ADDRESS START -->
                        <ul class="address">
                            <li>
                                <h3 class="page-subheading box-subheading">Your delivery address</h3>
                            </li>
                            <li>
                                <label for="lblFirstName">First Name <sup>*</sup></label>
                                <asp:TextBox ID="tbFirstName" runat="server" CssClass="form-control input-feild"></asp:TextBox></li>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFirstName" ErrorMessage="First Name is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                            <li>
                                <label for="lblLastName">Last Name <sup>*</sup></label>
                                <asp:TextBox ID="tbLastName" runat="server" CssClass="form-control input-feild"></asp:TextBox></li>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbLastName" ErrorMessage="Last Name is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                            <li>
                                <label for="lblStreet">Street Address<sup>*</sup></label>
                                <asp:TextBox ID="tbStreet" runat="server" CssClass="form-control input-feild"></asp:TextBox></li>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbStreet" ErrorMessage="Street Address is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                            <li>
                                <label for="lblCity">City<sup>*</sup></label>
                                <asp:TextBox ID="tbCity" runat="server" CssClass="form-control input-feild"></asp:TextBox></li>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbCity" ErrorMessage="City is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                            <li>
                            <li>
                                <label for="lblState">State<sup>*</sup></label>
                                <div class="single-product-size">
                                    <asp:DropDownList ID="ddState" runat="server" OnTextChanged="ddState_TextChanged" AutoPostBack="true" CssClass="form-control input-feild">
                                        <asp:ListItem Text="Alabama"></asp:ListItem>
                                        <asp:ListItem Text="Alaska"></asp:ListItem>
                                        <asp:ListItem Text="Arizona"></asp:ListItem>
                                        <asp:ListItem Text="Arkansas"></asp:ListItem>
                                        <asp:ListItem Text="California"></asp:ListItem>
                                        <asp:ListItem Text="Colorado"></asp:ListItem>
                                        <asp:ListItem Text="Connecticut"></asp:ListItem>
                                        <asp:ListItem Text="Delaware"></asp:ListItem>
                                        <asp:ListItem Text="Florida"></asp:ListItem>
                                        <asp:ListItem Text="Georgia"></asp:ListItem>
                                        <asp:ListItem Text="Hawaii"></asp:ListItem>
                                        <asp:ListItem Text="Idaho"></asp:ListItem>
                                        <asp:ListItem Text="Illinois"></asp:ListItem>
                                        <asp:ListItem Text="Indiana"></asp:ListItem>
                                        <asp:ListItem Text="Iowa"></asp:ListItem>
                                        <asp:ListItem Text="Kansas"></asp:ListItem>
                                        <asp:ListItem Text="Kentucky"></asp:ListItem>
                                        <asp:ListItem Text="Louisiana"></asp:ListItem>
                                        <asp:ListItem Text="Maine"></asp:ListItem>
                                        <asp:ListItem Text="Maryland"></asp:ListItem>
                                        <asp:ListItem Text="Massachusetts"></asp:ListItem>
                                        <asp:ListItem Text="Michigan"></asp:ListItem>
                                        <asp:ListItem Text="Minnesota"></asp:ListItem>
                                        <asp:ListItem Text="Mississippi"></asp:ListItem>
                                        <asp:ListItem Text="Missouri"></asp:ListItem>
                                        <asp:ListItem Text="Montana"></asp:ListItem>
                                        <asp:ListItem Text="Nebraska"></asp:ListItem>
                                        <asp:ListItem Text="Nevada"></asp:ListItem>
                                        <asp:ListItem Text="New Hampshire"></asp:ListItem>
                                        <asp:ListItem Text="New Jersey"></asp:ListItem>
                                        <asp:ListItem Text="New Mexico"></asp:ListItem>
                                        <asp:ListItem Text="New York"></asp:ListItem>
                                        <asp:ListItem Text="North Carolina"></asp:ListItem>
                                        <asp:ListItem Text="North Dakota"></asp:ListItem>
                                        <asp:ListItem Text="Ohio"></asp:ListItem>
                                        <asp:ListItem Text="Oklahoma"></asp:ListItem>
                                        <asp:ListItem Text="Oregon"></asp:ListItem>
                                        <asp:ListItem Text="Pennsylvania"></asp:ListItem>
                                        <asp:ListItem Text="Rhode Island"></asp:ListItem>
                                        <asp:ListItem Text="South Carolina"></asp:ListItem>
                                        <asp:ListItem Text="South Dakota"></asp:ListItem>
                                        <asp:ListItem Text="Tennessee"></asp:ListItem>
                                        <asp:ListItem Text="Texas"></asp:ListItem>
                                        <asp:ListItem Text="Utah"></asp:ListItem>
                                        <asp:ListItem Text="Vermont"></asp:ListItem>
                                        <asp:ListItem Text="Virginia"></asp:ListItem>
                                        <asp:ListItem Text="Washington"></asp:ListItem>
                                        <asp:ListItem Text="West Virginia"></asp:ListItem>
                                        <asp:ListItem Text="Wisconsin"></asp:ListItem>
                                        <asp:ListItem Text="Wyoming"></asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddState" ErrorMessage="State is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <label for="lblZip">Zip <sup>*</sup></label>
                                <asp:TextBox ID="tbZip" runat="server" CssClass="form-control input-feild"></asp:TextBox></li>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbZip" ErrorMessage="Zip is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="tbZip" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Zip is only numbers" ForeColor="Red"></asp:CompareValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="Tbzip" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{5,5}$" runat="server" ErrorMessage="Zip is 5 numbers"></asp:RegularExpressionValidator>
                            <li>
                                <label for="lblPhone">Phone Number <sup>*</sup></label>
                                <asp:TextBox ID="TbPhone" runat="server" CssClass="form-control input-feild"></asp:TextBox></li>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbPhone" ErrorMessage="Phone is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="tbPhone" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Phone is only numbers" ForeColor="Red"></asp:CompareValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TbPhone" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{10,10}$" runat="server" ErrorMessage="Phone is 10 numbers"></asp:RegularExpressionValidator>
                            <li>
                                <label for="email">Email<sup>*</sup></label>
                                <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control input-feild"></asp:TextBox></li>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </ul>
                        <!-- DELIVERY ADDRESS END -->
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="second_item primari-box">
                        <!-- BILLING ADDRESS START -->
                        <ul class="address">
                            <li>
                                <h3 class="page-subheading box-subheading">Your Billing Information</h3>
                            </li>
                            <li>
                                <label id="lblSubTotal">SUBTOTAL:</label>
                                <asp:Label ID="lblSubTotalValue" runat="server"></asp:Label>
                            </li>
                            <li>
                                <label id="lblTax">TAX</label>
                                <asp:Label ID="lblTaxValue" runat="server"></asp:Label>
                            </li>
                            <li>
                                <label id="lblShipping">SHIPPING</label>
                                <asp:Label ID="lblShippingValue" runat="server">0.00</asp:Label>
                            </li>
                            <li>
                                <label id="lblGrandTotal">GRAND TOTAL</label>
                                <asp:Label ID="lblGrandTotalValue" runat="server"></asp:Label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="second_item primari-box">
                        <!-- BILLING ADDRESS START -->
                        <ul class="address">
                            <li>
                                <label for="lblCC">Credit Card<sup>*</sup></label>
                                <asp:TextBox ID="tbCC" runat="server" CssClass="form-control input-feild"></asp:TextBox>
                                <asp:label ID="tbCCValid" runat="server" ForeColor="Red" text="" ></asp:label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbcc" ErrorMessage="Credit Card is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="tbcc" ErrorMessage="Credit Card is only numbers" ForeColor="Red"></asp:CompareValidator>
                            </li>
                            <li>
                                <label for="lblExpDate">Expiration Date<sup>*</sup></label>
                                <div class="single-product-size">
                                    <asp:DropDownList ID="ddMonth" runat="server"></asp:DropDownList>
                                    <asp:DropDownList ID="ddYear" runat="server"></asp:DropDownList>
                                </div>
                            </li>
                        </ul>
                        <!-- BILLING ADDRESS END -->
                    </div>
                    <div class="submit-button p-info-submit-button">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn main-btn"></asp:Button>
                        <span><i class="fa fa-chevron-right "></i></span>
                        <span class="required-field"><sup>*</sup>Required field</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- MAIN-CONTENT-SECTION END -->
</asp:Content>

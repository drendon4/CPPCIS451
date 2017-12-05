Imports System.Data
Imports System.Data.SqlClient
Partial Class Cart
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not HttpContext.Current.Request.Cookies("CartID") Is Nothing Then
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            Dim strCartID As String = CookieBack.Value
            SqlDSCart.SelectCommand = "Select * from Cart Where CartID = '" & strCartID & "'"
            getTotal(strCartID)
            btnClear.Visible = True
            lblCartTotal.Text = "Cart Total: $" & getTotal(strCartID)
        Else
            btnClear.Visible = False
            lblPage.Text = "No Items in Cart"
        End If
    End Sub
    Protected Sub lvCart_OnItemCommand(ByVal sender As Object, ByVal e As ListViewCommandEventArgs)
        If e.CommandName = "cmdUpdate" Then
            ' get CartID from cookies, productid, and quantity
            Dim strCartID As String
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            strCartID = CookieBack.Value
            Dim strProductID As String = e.CommandArgument
            Dim tbQuantity As TextBox = CType(e.Item.FindControl("tbQuantity"), TextBox)
            Dim strSQL As String = "Update Cart set Quantity = '" & CInt(tbQuantity.Text) & "' where ProductID = '" & strProductID & "' and CartID = '" & strCartID & "'"
            ' update
            Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Dim connCart As SqlConnection
            Dim cmdCart As SqlCommand
            Dim drCart As SqlDataReader
            connCart = New SqlConnection(strConn)
            cmdCart = New SqlCommand(strSQL, connCart)
            connCart.Open()
            drCart = cmdCart.ExecuteReader(CommandBehavior.CloseConnection)
            SqlDSCart.DataBind()
            lvCart.DataBind()
            Response.Redirect("Cart.aspx")
        ElseIf e.CommandName = "cmdDelete" Then
            Dim strCartID As String
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            strCartID = CookieBack.Value
            Dim strProductID As String = e.CommandArgument
            Dim strSQL As String = "Delete From Cart where ProductID = '" & strProductID & "' and CartID = '" & strCartID & "'"
            Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Dim connCart As SqlConnection
            Dim cmdCart As SqlCommand
            Dim drCart As SqlDataReader
            connCart = New SqlConnection(strConn)
            cmdCart = New SqlCommand(strSQL, connCart)
            connCart.Open()
            drCart = cmdCart.ExecuteReader(CommandBehavior.CloseConnection)
            SqlDSCart.DataBind()
            lvCart.DataBind()
            If countCart(strCartID) = 0 Then
                deleteCookie()
            End If
            Response.Redirect("Cart.aspx")
        End If

    End Sub

    'Protected Sub DataPager1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataPager1.PreRender
    '    Dim total_pages As Integer
    '    Dim current_page As Integer
    '    'sqlDSCart.SelectCommand = "Select * from cart"
    '    lvCart.DataBind()
    '    total_pages = DataPager1.TotalRowCount / DataPager1.PageSize
    '    current_page = DataPager1.StartRowIndex / DataPager1.PageSize + 1
    '    If DataPager1.TotalRowCount Mod DataPager1.PageSize <> 0 Then
    '        total_pages = total_pages + 1
    '    End If
    '    If CInt(lvCart.Items.Count) <> 0 Then
    '        Dim lbl As Label = lvCart.FindControl("lblPage")
    '        lbl.Text = "Page " + CStr(current_page) + " of " + CStr(total_pages) + " (Total items: " + CStr(DataPager1.TotalRowCount) + ")"
    '    End If
    '    If CInt(lvCart.Items.Count) = 0 Then
    '        DataPager1.Visible = False
    '        show_next.Visible = False
    '        show_prev.Visible = False
    '    End If
    'End Sub

    'Protected Sub show_prev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_prev.Click
    '    Dim pagesize As Integer = DataPager1.PageSize
    '    Dim current_page As Integer = DataPager1.StartRowIndex / DataPager1.PageSize + 1
    '    Dim total_pages As Integer = DataPager1.TotalRowCount / DataPager1.PageSize
    '    Dim last As Integer = total_pages \ 3
    '    last = last * 3
    '    Do While current_page < last
    '        last = last - 3
    '    Loop
    '    If last < 3 Then
    '        last = 0
    '    Else
    '        last = last - 3
    '    End If
    '    DataPager1.SetPageProperties(last * pagesize, pagesize, True)
    'End Sub

    'Protected Sub show_next_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_next.Click
    '    Dim last As Integer = 3
    '    Dim pagesize As Integer = DataPager1.PageSize
    '    Dim current_page As Integer = DataPager1.StartRowIndex / DataPager1.PageSize + 1
    '    Dim total_pages As Integer = DataPager1.TotalRowCount / DataPager1.PageSize
    '    Do While current_page > last
    '        last = last + 3
    '    Loop
    '    If last > total_pages Then
    '        last = total_pages
    '    End If
    '    DataPager1.SetPageProperties(last * pagesize, pagesize, True)
    'End Sub

    'Protected Sub lvCart_DataBound(ByVal sender As Object, ByVal e As ListViewItemEventArgs)
    '    'Protected Sub lvCart_OnItemCommand(ByVal sender As Object, ByVal e As ListViewCommandEventArgs)
    '    Dim strCartID As String
    '    Dim CookieBack As HttpCookie
    '    CookieBack = HttpContext.Current.Request.Cookies("CartID")
    '    strCartID = CookieBack.Value

    '    lblCartTotal.Text = getTotal(strCartID)

    'End Sub
    Protected Function getTotal(strCartID As String) As Decimal
        Dim total As Decimal
        Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim conn As SqlConnection
        Dim cmd As SqlCommand
        Dim strSQL As String = "SELECT SUM(Price * Quantity) AS Total FROM Cart Where CartID = '" & strCartID & "'"
        conn = New SqlConnection(strConn)
        cmd = New SqlCommand(strSQL, conn)
        conn.Open()

        If Not IsDBNull(cmd.ExecuteScalar) Then
            total = cmd.ExecuteScalar()
        Else
            total = 0
        End If
        conn.Close()

        Return total
    End Function
    Protected Function countCart(strCartID As String) As Boolean
        Dim clear As Boolean
        Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim conn As SqlConnection
        Dim cmd As SqlCommand
        Dim strSQL As String = "SELECT COUNT(*) FROM Cart Where CartID = '" & strCartID & "'"
        conn = New SqlConnection(strConn)
        cmd = New SqlCommand(strSQL, conn)
        conn.Open()

        If Not IsDBNull(cmd.ExecuteScalar) Then
            clear = cmd.ExecuteScalar()
        Else
            clear = 0
        End If
        conn.Close()

        Return clear
    End Function
    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        Dim strCartID As String
        Dim CookieBack As HttpCookie
        CookieBack = HttpContext.Current.Request.Cookies("CartID")
        strCartID = CookieBack.Value
        Dim strSQL As String = "Delete From Cart WHERE CartID = '" & strCartID & "'"
        Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim connCart As SqlConnection
        Dim cmdCart As SqlCommand
        connCart = New SqlConnection(strConn)
        cmdCart = New SqlCommand(strSQL, connCart)
        connCart.Open()
        cmdCart.ExecuteReader(CommandBehavior.CloseConnection)
        deleteCookie()
        Response.Redirect("Cart.aspx")
    End Sub
    Protected Sub deleteCookie()
        If (Not Request.Cookies("CartID") Is Nothing) Then
            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("CartID")
            myCookie.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(myCookie)
        End If
    End Sub
    Protected Sub btnCheckout_Click(sender As Object, e As EventArgs) Handles btnCheckout.Click
        If Not HttpContext.Current.Request.Cookies("CartID") Is Nothing Then
            Response.Redirect("checkout.aspx")
        Else
            Response.Redirect("cart.aspx")
        End If
    End Sub
End Class
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class ProductDetail
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("ProductID") <> "" Then
            Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Dim connProduct As SqlConnection
            Dim cmdProduct As SqlCommand
            Dim drProduct As SqlDataReader
            Dim strSQL As String = "Select * from Product Where ProductID = " & Request.QueryString("ProductID")
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
            If drProduct.Read() Then
                lblProductName.Text = drProduct.Item("ProductName")
                lblPrice.Text = drProduct.Item("Price")
                lblProductID.Text = drProduct.Item("ProductID")
                imgProduct.ImageUrl = "/images/" + drProduct.Item("ProductName") + ".jpg"
                imgProduct.AlternateText = "/images/" + drProduct.Item("ProductName") + ".jpg"
            End If
            connProduct.Close()
        End If
    End Sub

    Protected Sub btnAddtoCart_Click(sender As Object, e As EventArgs) Handles btnAddtoCart.Click
        ' get price from the Product table
        If tbQuantity.Text Then
            Dim dr As SqlDataReader
            Dim strSQLStatement As String
            Dim cmdSQL As SqlCommand
            Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            strSQLStatement = "SELECT * FROM Product WHERE ProductID = '" & lblProductID.Text & "'"
            Dim conn As New SqlConnection(strConnectionString)
            conn.Open()
            cmdSQL = New SqlCommand(strSQLStatement, conn)
            dr = cmdSQL.ExecuteReader()
            Dim decPrice As Decimal
            If dr.Read() Then
                decPrice = dr.Item("Price")
            End If
            conn.Close()
            '*** get CartID
            Dim strCartID As String
            If HttpContext.Current.Request.Cookies("CartID") Is Nothing Then
                strCartID = GetRandomPasswordUsingGUID(10)
                Dim CookieTo As New HttpCookie("CartID", strCartID)
                HttpContext.Current.Response.AppendCookie(CookieTo)
            Else
                Dim CookieBack As HttpCookie
                CookieBack = HttpContext.Current.Request.Cookies("CartID")
                strCartID = CookieBack.Value
            End If
            ' check if this product already exits in the cart
            Dim dr2 As SqlDataReader
            Dim strSQLStatement2 As String
            Dim cmdSQL2 As SqlCommand
            strSQLStatement2 = "SELECT * FROM Cart WHERE CartID = '" & strCartID & "' and ProductID = '" & Trim(lblProductID.Text) & "'"
            'Response.Write(strSQLStatement2)
            Dim conn2 As New SqlConnection(strConnectionString)
            cmdSQL2 = New SqlCommand(strSQLStatement2, conn2)
            conn2.Open()
            dr2 = cmdSQL2.ExecuteReader()
            If dr2.Read() Then
                Dim dr4 As SqlDataReader
                Dim intQuantityNew As Integer = dr2.Item("Quantity") + CInt(tbQuantity.Text)
                Dim cmdSQL4 As SqlCommand
                Dim strSQLStatement4 As String
                strSQLStatement4 = "UPDATE Cart SET Quantity = " & CInt(intQuantityNew) & " WHERE CartID = '" & strCartID & "' AND ProductID = " & CSng(lblProductID.Text)
                Dim conn4 As New SqlConnection(strConnectionString)
                conn4.Open()
                cmdSQL4 = New SqlCommand(strSQLStatement4, conn4)
                dr4 = cmdSQL4.ExecuteReader()
            Else
                Dim dr3 As SqlDataReader
                Dim strSQLStatement3 As String
                Dim cmdSQL3 As SqlCommand
                strSQLStatement3 = "INSERT INTO Cart (CartID, ProductID, ProductName, Quantity, Price) values ('" & strCartID & "', " & CSng(lblProductID.Text) & ", '" & lblProductName.Text & "', " & CInt(tbQuantity.Text) & ", " & decPrice & ")"
                'Response.Write(strSQLStatement3)
                Dim conn3 As New SqlConnection(strConnectionString)
                conn3.Open()
                cmdSQL3 = New SqlCommand(strSQLStatement3, conn3)
                dr3 = cmdSQL3.ExecuteReader()
            End If
            Response.Redirect("Cart.aspx")
        Else
            'lblErrMsg.text = "must be int"
        End If
    End Sub

    Public Function GetRandomPasswordUsingGUID(ByVal length As Integer) As String
        'Get the GUID
        Dim guidResult As String = System.Guid.NewGuid().ToString()
        'Remove the hyphens
        guidResult = guidResult.Replace("-", String.Empty)
        'Make sure length is valid
        If length <= 0 OrElse length > guidResult.Length Then
            Throw New ArgumentException("Length must be between 1 and " & guidResult.Length)
        End If
        'Return the first length bytes
        Return guidResult.Substring(0, length)
    End Function
End Class

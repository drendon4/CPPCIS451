Imports System.Data
Imports System.Data.SqlClient
Partial Class receipt
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not HttpContext.Current.Request.Cookies("CartID") Is Nothing Then
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            Dim strCartID As String = CookieBack.Value
            SqlDSCart.SelectCommand = "Select * FROM Cart WHERE CartID = '" & strCartID & "'"
            SqlDSOrder.SelectCommand = "Select * FROM [Order] WHERE CartID = '" & strCartID & "'"
            CookieBack.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(CookieBack)
        End If
    End Sub
End Class

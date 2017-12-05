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
                'imgProduct.ImageUrl = "image/product/" + Trim(drProduct.Item("ProductID")) + ".jpg"
            End If
            connProduct.Close()

            'Dim strConn2 As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            'Dim connCategory As SqlConnection
            'Dim cmdCategory As SqlCommand
            'Dim drCategory As SqlDataReader
            'Dim strSQL2 As String = "SElECT * FROM Category WHERE ID = (SELECT Parent FROM Category WHERE ID = (Select CategoryID from Product Where ID = " & Request.QueryString("ProductID") & "))"
            'connCategory = New SqlConnection(strConn)
            'cmdCategory = New SqlCommand(strSQL, connProduct)
            'connCategory.Open()
            'drCategory = cmdCategory.ExecuteReader(CommandBehavior.CloseConnection)
            'If drCategory.Read() Then
            '    'lblBCMainCategory.Text = drCategory("CategoryName")
            '    lblBCSubCategory.Text = Request.QueryString("SubCategoryName")
            'End If
            'connCategory.Close()


        End If


    End Sub

End Class

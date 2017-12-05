Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class Category
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("MainCategoryID") <> "" Then
            sqlDSSubCat.SelectCommand = "Select * From Category Where ID = " & Request.QueryString("MainCategoryID")
            lblBCMainCategory.Text = Request.QueryString("MainCategoryName")
            If Request.QueryString("SubCategoryID") <> "" Then
                lblBCSubCategory.Text = Request.QueryString("SubCategoryName")
                sqldsMainCat.SelectCommand = "SELECT * FROM Category WHERE ID = (Select Parent From Category Where ID = " & Request.QueryString("SubCategoryID") & ")"
                lblBCMainCategory.Text = Request.QueryString("MainCategoryName")

                SqlDSFeaturedProduct.SelectCommand = "Select * From Product Where CategoryID = " & Request.QueryString("SubCategoryID")
                lblCategoryName.Text = "Products for " + Request.QueryString("SubCategoryName")
            Else
                lblBCMainCategory.Text = Request.QueryString("MainCategoryName")
                SqlDSFeaturedProduct.SelectCommand = "Select * From Product Where CategoryID IN (SELECT ID FROM Category WHERE Parent = " & Request.QueryString("MainCategoryID") & ") and Featured = 'Y'"
                lblCategoryName.Text = "Featured Products for " + Request.QueryString("MainCategoryName")
            End If
        End If
        If Request.QueryString("SearchString") <> "" Then
            Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Dim connProduct As SqlConnection
            Dim cmdProduct As SqlCommand
            Dim strSQL As String = "SELECT * FROM Product WHERE CAST(ProductID AS VARCHAR(MAX)) = '" & Request.QueryString("SearchString") & "'"
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            If cmdProduct.ExecuteScalar() Is Nothing Then
                SqlDSFeaturedProduct.SelectCommand = "SELECT * FROM Product WHERE ProductName like '%" & Request.QueryString("SearchString").Replace(" ", "%' OR ProductName Like '%") & "%' AND Featured = 'Y'"
                lblCategoryName.Text = "Featured Products for " & Request.QueryString("SearchString").Replace(" ", " OR ")
            Else
                Dim strSearch As String = "ProductDetail.aspx?ProductID=" & Request.QueryString("SearchString")
                Response.Redirect(strSearch)
            End If
        End If
    End Sub
    End Class

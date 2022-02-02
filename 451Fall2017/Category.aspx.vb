
Partial Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("MainCategoryID") <> "" Then
            sqlDSSubCat.SelectCommand = "Select * From Category Where parent = " & Request.QueryString("MainCategoryID")
        End If
    End Sub
End Class

Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        SqlDSFeaturedProduct.SelectCommand = "Select * From Product Where CategoryID IN (SELECT ID FROM Category WHERE Featured = 'Y') ORDER BY Price Desc"
    End Sub

End Class

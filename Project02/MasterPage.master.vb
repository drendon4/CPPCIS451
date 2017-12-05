Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Repeater1.DataSource = GetData("SELECT * FROM Category WHERE Parent = 0")
            Repeater1.DataBind()
        End If
    End Sub

    Private Shared Function GetData(query As String) As DataTable

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                cmd.CommandText = query
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        Dim dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using
    End Function

    Protected Sub OnItemDataBound(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim aID As String = TryCast(e.Item.FindControl("hfID"), HiddenField).Value
            Dim Repeater2 As Repeater = TryCast(e.Item.FindControl("Repeater2"), Repeater)
            Repeater2.DataSource = GetData(String.Format("SELECT Sub.ID AS sID, Sub.CategoryID AS sCategoryID, Sub.CategoryName AS sCategoryName, Main.ID AS mID, Main.CategoryID AS mCategoryID, Main.CategoryName AS mCategoryName FROM Category AS Sub INNER JOIN Category AS Main ON Sub.Parent = Main.ID WHERE Sub.Parent ='{0}'", aID))
            Repeater2.DataBind()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearch.Text <> "" Then
            Dim strSearch As String = "Category.aspx?SearchString=" + tbSearch.Text
            Response.Redirect(strSearch)
        End If
    End Sub

End Class

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class Checkout
    Inherits System.Web.UI.Page
    Public SUBTOTAL As Decimal
    Public TAX As Decimal
    Public TAX_RATE As Decimal
    Public GRANDTOTAL As Decimal
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not HttpContext.Current.Request.Cookies("CartID") Is Nothing Then
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            Dim strCartID As String = CookieBack.Value
            Dim y As Integer = Date.Today.Year
            For i As Integer = y To (y + 9)
                ddYear.Items.Add(New ListItem(y, i))
                y = y + 1
            Next
            For i As Integer = 1 To 12
                ddMonth.Items.Add(New ListItem(i, i))
            Next
            SUBTOTAL = getTotal(strCartID)
            loadTotals()
        Else
            Response.Redirect("cart.aspx")
        End If
    End Sub
    Protected Sub loadTotals()
        TAX = SUBTOTAL * TAX_RATE
        GRANDTOTAL = SUBTOTAL + TAX
        lblSubTotalValue.Text = convertCurrency(SUBTOTAL)
        lblTaxValue.Text = convertCurrency(TAX)
        lblGrandTotalValue.Text = convertCurrency(GRANDTOTAL)
    End Sub
    Function IsValidEmailFormat(ByVal s As String) As Boolean
        Try
            Dim address = New MailAddress(s)
        Catch
            Return False
        End Try
        Return True
    End Function
    Function isValidCreditCard(ByVal s As String) As Boolean
        Dim sResult As Boolean
        Dim digit As Integer
        Dim cc As Integer

        If Len(s) = 15 Then
            For i As Integer = 0 To Len(s) - 1
                If i Mod 2 = 0 Then
                    digit = s.Substring(i, 1)
                Else
                    digit = s.Substring(i, 1)
                    digit = digit * 2
                    If digit > 9 Then
                        digit = digit - 9
                    End If
                End If
                cc += digit
            Next
        ElseIf Len(s) = 16 Then
            For i As Integer = 0 To Len(s) - 1
                If i Mod 2 = 0 Then
                    digit = s.Substring(i, 1)
                    digit = digit * 2
                    If digit > 9 Then
                        digit = digit - 9
                    End If
                Else
                    digit = s.Substring(i, 1)
                End If
                cc += digit
            Next
        Else
            sResult = False
        End If

        cc = cc * 9

        If s.Substring(Len(s) - 1, 1) = (cc Mod 10) Then
            sResult = True
        Else
            sResult = False
        End If
        Return sResult
    End Function
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If isValidCreditCard(tbCC.Text) = False Then
            tbCCValid.Text = "Credit Card number not valid"
        Else
            Dim CookieBack As HttpCookie
            Dim strCartID As String
            CookieBack = HttpContext.Current.Request.Cookies("CartID")
            strCartID = CookieBack.Value
            Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
            Dim conn As SqlConnection
            Dim cmdSQL As SqlCommand
            Dim dr As SqlDataReader
            Dim strSQL As String = "SELECT * FROM [Order] WHERE CartID = '" & strCartID & "'"
            conn = New SqlConnection(strConnectionString)
            cmdSQL = New SqlCommand(strSQL, conn)
            conn.Open()
            dr = cmdSQL.ExecuteReader()
            If dr.Read() Then
                errMsg.Text = "Order already processed!"
                errMsg.Visible = True
                deleteCookie()
            Else
                strSQL = "INSERT INTO [Order] (CartID, FirstName, LastName, Street1, Street2, City, State, Zip, Phone, Email, CreditCard, ExpirationDate, Subtotal, Shipping, Tax, Grandtotal ) VALUES ('" & strCartID & "', '" & tbFirstName.Text & "', '" & tbLastName.Text & "', '" & tbStreet.Text & "', NULL, '" & tbCity.Text & "', '" & ddState.Text & "', '" & tbZip.Text & "', '" & TbPhone.Text & "', '" & tbEmail.Text & "', '" & tbCC.Text & "', '" & ddMonth.Text & "/" & ddYear.Text & "', " & lblSubTotalValue.Text & ", " & lblShippingValue.Text & ", " & lblTaxValue.Text & ", " & lblGrandTotalValue.Text & ")"
                conn = New SqlConnection(strConnectionString)
                cmdSQL = New SqlCommand(strSQL, conn)
                conn.Open()
                dr = cmdSQL.ExecuteReader(CommandBehavior.CloseConnection)
            End If
            conn.Close()
            sendMail(strCartID)
            Response.Redirect("receipt.aspx")
        End If
    End Sub
    Protected Function emailBody(strCartID As String) As String
        Dim head As String = ""
        Dim body As String = ""
        Dim foot As String = ""

        Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim conn As SqlConnection
        Dim cmdSql As SqlCommand
        Dim dr As SqlDataReader
        Dim strSQL As String = "Select * FROM [Order] WHERE CartID = '" & strCartID & "'"
        conn = New SqlConnection(strConn)
        cmdSql = New SqlCommand(strSQL, conn)
        conn.Open()
        dr = cmdSql.ExecuteReader()
        If dr.Read() Then
            head += "<table width=""70"" align=""left"" border=""1"" cellpadding=""0"" cellspacing=""0""><tr><th>First Name</th><th>Last Name</th><th>Street</th><th>City</th><th>State</th><th>Zip</th><th>Email</th><th>Phone</th></tr><tr>"
            head += "<td>" & dr.Item("FirstName") & "</td>"
            head += "<td>" & dr.Item("LastName") & "</td>"
            head += "<td>" & dr.Item("Street1") & "</td>"
            head += "<td>" & dr.Item("City") & "</td>"
            head += "<td>" & dr.Item("State") & "</td>"
            head += "<td>" & dr.Item("Zip") & "</td>"
            head += "<td>" & dr.Item("Email") & "</td>"
            head += "<td>" & dr.Item("Phone") & "</td>"
            head += "</tr></table><br/><br/><br/><br/>"

            foot += "<table width=""70"" align=""left"" border=""1"" cellpadding=""0"" cellspacing=""0""><tr><th>Subtotal</th><th>Shipping</th><th>Tax</th><th>Grand Total</th></tr><tr>"
            foot += "<td>" & convertCurrency(dr.Item("Subtotal")) & "</td>"
            foot += "<td>" & convertCurrency(dr.Item("Shipping")) & "</td>"
            foot += "<td>" & convertCurrency(dr.Item("Tax")) & "</td>"
            foot += "<td>" & convertCurrency(dr.Item("Grandtotal")) & "</td>"
            foot += "</tr></table><br/><br/><br/><br/>"
        End If
        conn.Close()

        Dim strConn2 As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim strSQL2 = "SELECT ProductID, ProductName, Price, Quantity, (Price * Quantity) AS Total FROM Cart WHERE CartID = '" & strCartID & "'"
        Dim conn2 = New SqlConnection(strConn2)
        Dim cmdSql2 = New SqlCommand(strSQL2, conn2)
        conn2.Open()
        Dim table As SqlDataReader
        table = cmdSql2.ExecuteReader()
        body = body & "<table width=""70"" align=""left"" border=""1"" cellpadding=""0"" cellspacing=""0""><tr><th>ProductID</th><th>ProductName</th><th>Price</th><th>Quantity</th><th>Total</th></tr>"
        For Each value In table
            body += "<tr><td>" & value(0) & "</td><td>" & value(1) & "</td><td>" & value(2) & "</td><td>" & value(3) & "</td><td>" & value(4) & "</td></tr>"
        Next
        body += "</tr></table><br/><br/><br/><br/>"
        conn2.Close()
        Return (head + body + foot)
    End Function
    Protected Sub sendMail(strCartID As String)
        'email setup to run for OUTLOOK CPP Email
        Dim strFrom = ""    'need FROM email account
        Dim strTo = tbEmail.Text
        Dim strPw = ""      'need password for FROM email
        Dim MailMsg As New MailMessage(New MailAddress(strFrom.Trim()), New MailAddress(strTo.Trim()))
        MailMsg.BodyEncoding = Encoding.Default
        MailMsg.Subject = "Order Number: " & strCartID
        MailMsg.Body = emailBody(strCartID)
        'MailMsg.Priority = MailPriority.High
        MailMsg.IsBodyHtml = True

        'SmtpClient to send the mail message 
        Dim SmtpMail As New SmtpClient
        Dim basicAuthenticationInfo As New System.Net.NetworkCredential(strFrom, strPw)
        SmtpMail.Host = "smtp.office365.com"
        SmtpMail.Port = 587
        SmtpMail.UseDefaultCredentials = False
        SmtpMail.EnableSsl = True
        SmtpMail.Credentials = basicAuthenticationInfo
        SmtpMail.Send(MailMsg)
    End Sub
    Public Function convertCurrency(d As Decimal) As Decimal
        Dim us As Decimal = String.Format("{0:C}", d)
        Return us
    End Function
    Public Sub ddState_TextChanged(sender As Object, e As EventArgs) Handles ddState.TextChanged
        If ddState.Text = "California" Then
            TAX_RATE = 0.095
        Else
            TAX_RATE = 0
        End If
        loadTotals()
    End Sub
    Protected Function getTotal(strCartID As String) As Decimal
        Dim total As Decimal = 0
        Dim strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim conn As SqlConnection
        Dim cmd As SqlCommand
        Dim strSQL As String = "SELECT SUM(Price * Quantity) AS Total FROM Cart Where CartID = '" & strCartID & "'"
        conn = New SqlConnection(strConn)
        cmd = New SqlCommand(strSQL, conn)
        conn.Open()
        If Not IsDBNull(cmd.ExecuteScalar) Then
            total = cmd.ExecuteScalar()
        End If
        conn.Close()
        Return total
    End Function
    Protected Sub deleteCookie()
        If (Not Request.Cookies("CartID") Is Nothing) Then
            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("CartID")
            myCookie.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(myCookie)
        End If
    End Sub
End Class
<!--<Snippet1>-->
<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

  Sub SubmitButton_Click(ByVal sender As Object, ByVal e As EventArgs)
         
    ' Determine which button was clicked.
    Select Case (CType(sender, HtmlInputButton)).ID

      Case "CityQueryButton"

        ' Validate only the controls used for the city query.
        CityReqValidator.Validate()

        ' Take the appropriate action if the controls pass validation. 
        If CityReqValidator.IsValid Then
           
          Message.InnerHtml = "You have chosen to run a query for the following city: " & _
             CityTextBox.Value
               
        End If

      Case "StateQueryButton"

        ' Validate only the controls used for the state query.
        StateReqValidator.Validate()

        ' Take the appropriate action if the controls pass validation.
        If StateReqValidator.IsValid Then
               
          Message.InnerHtml = "You have chosen to run a query for the following state: " & _
             StateTextBox.Value
               
        End If

      Case Else

        ' If the button clicked is not recognized, erase the message on the page.
        Message.InnerHtml = ""

    End Select
        
  End Sub

</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head  runat="server">
    <title>HtmlInputButton CausesValidation Example</title>
</head>
<body>
   <form id="form1" runat="server">
      <h3> HtmlInputButton CausesValidation Example </h3>

      <table border="1" cellpadding="10">
         <tr>
            <td>
               <b>Enter city to query.</b> <br />
               <input id="CityTextBox" 
                      type="Text"
                      runat="server"/>
               <asp:RequiredFieldValidator ID="CityReqValidator"
                    ControlToValidate="CityTextBox"
                    ErrorMessage="<br />Please enter a city."
                    Display="Dynamic"
                    EnableClientScript="False"
                    runat="server"/>
            </td>
            <td valign="bottom">
               <input id="CityQueryButton"
                      type="Submit"
                      value="Submit"
                      causesvalidation="False"
                      onserverclick="SubmitButton_Click"
                      runat="server"/>
            </td>
         </tr>

         <tr>
            <td>
               <b>Enter state to query.</b> <br />
               <input id="StateTextBox" 
                      type="Text" 
                      runat="server"/>
               <asp:RequiredFieldValidator ID="StateReqValidator"
                    ControlToValidate="StateTextBox"
                    ErrorMessage="<br />Please enter a state."
                    Display="Dynamic"
                    EnableClientScript="False"
                    runat="server"/>
            </td>
            <td valign="bottom">
               <input id="StateQueryButton"
                      type="Submit"
                      value="Submit"
                      causesvalidation="False"
                      onserverclick="SubmitButton_Click"
                      runat="server"/>
            </td>
         </tr>

      </table>

      <br /><br />

      <span id="Message"
            runat="Server"/>


   </form>
</body>
</html>
<!--</Snippet1>-->
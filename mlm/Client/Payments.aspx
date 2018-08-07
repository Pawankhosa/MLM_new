<%@ Page Title="" Language="C#" MasterPageFile="~/Client/MasterPage.master" AutoEventWireup="true" CodeFile="Payments.aspx.cs" Inherits="Client_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>   
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type = "text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <table align="center" class="content-table">
    <tr>
<td align="center">
<form id="pnlContents" >
<asp:Panel id="pnlContents" runat = "server">
	      <asp:GridView ID="GridView1" runat="server" Width="750px" CssClass="grid" HeaderStyle-CssClass="gridhead" AutoGenerateColumns="false">
             <Columns>
                 <asp:TemplateField HeaderText="SR">
                     <ItemTemplate>
                         <%# Container.DataItemIndex+1 %>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="Rec" HeaderText="REC No." />
                 <asp:BoundField DataField="DATE" HeaderText="DATE" />
                 <asp:BoundField DataField="ID" HeaderText="ID" />
             </Columns>
        </asp:GridView>
</asp:Panel>
 <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn-d" OnClientClick = "return PrintPanel();" />
</form>
</td>    </tr>
    </table>
</asp:Content>


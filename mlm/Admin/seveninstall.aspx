<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="seveninstall.aspx.cs" Inherits="Admin_seveninstall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            margin: 2rem;
        }
        /*
th {
  background-color: white;
}
tr:nth-child(odd) {
  background-color: grey;
}
th, td {
  padding: 0.5rem;
}
td:hover {
  background-color: lightsalmon;
}
*/
        .paginate_button {
            border-radius: 0 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Installment Billing</h2>
    <div class="col-md-12">
        <table id="example" class="display" cellspacing="0" width="100%">
            <%--  <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example">--%>
            <thead>
                <tr>
                    <th>SNo.</th>
                    <th>id</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Father Name</th>
                    <th>Address</th>
                    <th>Sponser Name/
                Sponser ID
                    </th>
                    <th>Total Installments</th>
                    <th>Action</th>

                </tr>
            </thead>
            <tbody>
                <asp:ListView ID="ListView1" runat="server" OnDataBound="ListView1_DataBound">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.DataItemIndex+1 %></td>
                            <td><%#Eval("id") %></td>
                            <td><%#Eval("name") %></td>
                            <td><%#Eval("mobile") %></td>
                            <td><%#Eval("Father") %></td>
                            <td><%#Eval("Address") %></td>
                            <td><%#Eval("SponserName") %>
                                <%#Eval("SponserID") %>
                            </td>
                            <td><%#Eval("cnt") %></td>
                            <td>
                                <asp:LinkButton ID="lnkill" runat="server" OnClick="lnkill_Click" CommandArgument='<%#Eval("id") %>'>Billing</asp:LinkButton></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

            </tbody>
        </table>
    </div>
    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>
</asp:Content>


﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="seveninstall.aspx.cs" Inherits="Admin_seveninstall" %>

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
    <%--    

              
                        <th>
                            SNo.
                        </th>--%>
    <div style="width: 900px;">
        <div class=" filterable">
            <%--  <table cellpadding="0" cellspacing="0" border="0" class="dataTable" id="example">--%>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th>SNo.</th>
                        <th>
                            <input type="text" class="form-control" placeholder="Id"></th>
                        <th>
                            <input type="text" class="form-control" placeholder="Name"></th>
                        <th>
                            <input type="text" class="form-control" placeholder="Father Name"></th>
                        <th>
                            <input type="text" class="form-control" placeholder="Address"></th>
                        <th>
                            <input type="text" class="form-control" placeholder="Mobile"></th>
                        <th>
                            <input type="text" class="form-control" placeholder="Sponser Name/ Sponser ID">
                        </th>
                        <th>
                            <input type="text" class="form-control" placeholder="Total Installments"></th>
                        <th>
                            <input type="text" class="form-control" readonly="readonly" placeholder="Action"></th>

                    </tr>
                </thead>
                <tbody>
                    <asp:ListView ID="ListView1" runat="server" OnDataBound="ListView1_DataBound">
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.DataItemIndex+1 %></td>
                                <td><%#Eval("id") %></td>
                                <td><%#Eval("name") %></td>
                                <td><%#Eval("Father") %></td>
                                <td><%#Eval("mobile") %></td>
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
    </div>
    <%--    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>--%>
    <script>
        $(document).ready(function () {
            $('.filterable .btn-filter').click(function () {
                var $panel = $(this).parents('.filterable'),
                $filters = $panel.find('.filters input'),
                $tbody = $panel.find('.table tbody');
                if ($filters.prop('disabled') == true) {
                    $filters.prop('disabled', false);
                    $filters.first().focus();
                } else {
                    $filters.val('').prop('disabled', true);
                    $tbody.find('.no-result').remove();
                    $tbody.find('tr').show();
                }
            });

            $('.filterable .filters input').keyup(function (e) {
                /* Ignore tab key */
                var code = e.keyCode || e.which;
                if (code == '9') return;
                /* Useful DOM data and selectors */
                var $input = $(this),
                inputContent = $input.val().toLowerCase(),
                $panel = $input.parents('.filterable'),
                column = $panel.find('.filters th').index($input.parents('th')),
                $table = $panel.find('.table'),
                $rows = $table.find('tbody tr');
                /* Dirtiest filter function ever ;) */
                var $filteredRows = $rows.filter(function () {
                    var value = $(this).find('td').eq(column).text().toLowerCase();
                    return value.indexOf(inputContent) === -1;
                });
                /* Clean previous no-result if exist */
                $table.find('tbody .no-result').remove();
                /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
                $rows.show();
                $filteredRows.hide();
                /* Prepend no-result row if all rows are filtered */
                if ($filteredRows.length === $rows.length) {
                    $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="' + $table.find('.filters th').length + '">No result found</td></tr>'));
                }
            });
        });
    </script>
</asp:Content>


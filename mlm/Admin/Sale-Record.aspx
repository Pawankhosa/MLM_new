<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Sale-Record.aspx.cs" Inherits="Admin_Sale_Record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-md-12">


        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Sr.No</th>
                    <th>Regno</th>
                    <th>Invoice</th>  
                     <th>Amount</th>
                    <th></th>
                    
                </tr>
            </thead>
            <asp:ListView ID="gvpins" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Container.DataItemIndex+1 %></td>

                        <td>
                           <%#Eval("regno") %></td>
                        
                        <td>
                            <%#Eval("purchaseid") %></td>
                     <td>
                            <%#Eval("amount") %></td>
                        <td>
                      <asp:LinkButton ID="lnkedit" CommandArgument='<%#Eval("purchaseid") %>' OnClick="lnkedit_Click" runat="server">Sale History</asp:LinkButton> | 
                      <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("purchaseid") %>' OnClick="LinkButton1_Click" runat="server">Delete</asp:LinkButton>
                        </td>
                       


                </ItemTemplate>
            </asp:ListView>
        </table>


    </div>
</asp:Content>


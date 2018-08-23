<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="History-Record.aspx.cs" Inherits="Admin_History_Record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <div class="col-md-12">


        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Sr.No</th>
                    <th> Date</th>
                    <th>Product Name</th>  
                     <th>Quantity</th>
                    <th>MRP</th>
                     <th>BV</th>
                    
                </tr>
            </thead>
            <asp:ListView ID="gvpins" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Container.DataItemIndex+1 %></td>

                        <td>
                           <%#Eval("date") %></td>
                        <td>
                            <%#Eval("name") %></td>
                     <td>
                            <%#Eval("qty") %></td>
                        <td>
                            <%#Eval("mrp") %></td>
                        <td>
                            <%#Eval("bv") %></td>
                       
                       


                </ItemTemplate>
            </asp:ListView>
        </table>


    </div>
</asp:Content>


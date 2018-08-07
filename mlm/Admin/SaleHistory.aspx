<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SaleHistory.aspx.cs" Inherits="Admin_SaleHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="col-md-12">


        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Sr.No</th>
                    <th>Product Date</th>
                    <th>Product Name</th>  
                     <th>Quantity</th>
                    <th>Dp</th>
                     <th>Pv</th>
                    
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
                            <%#Eval("dp") %></td>
                        <td>
                            <%#Eval("pv") %></td>
                       
                       


                </ItemTemplate>
            </asp:ListView>
        </table>


    </div>
</asp:Content>


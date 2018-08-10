﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-products.aspx.cs" Inherits="Admin_view_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h3>View Product</h3>
    <hr />
   
    <asp:GridView ID="gvdata" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" >
        <Columns>
<%--            <asp:BoundField DataField="month" HeaderText="Month" />--%>
   
            <asp:BoundField DataField="name" HeaderText="Product Name" />
            <asp:BoundField DataField="code" HeaderText="Father Name" />
          
            <asp:BoundField DataField="mrp" HeaderText="Price" />
               <asp:BoundField DataField="bv" HeaderText="BV" />
              <asp:TemplateField HeaderText="Status" >
                <ItemTemplate>
                   
                  <img src='../uploadimage/<%#Eval("image") %>' width="80" />
                </ItemTemplate>
                
              </asp:TemplateField>
             <asp:BoundField DataField="stock" HeaderText="Stock" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("id") %>' OnClick="LinkButton1_Click" runat="server">Edit</asp:LinkButton> / 
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("code") %>' OnClick="LinkButton2_Click" runat="server">Enter Stock</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
           
        </Columns>
    </asp:GridView>
</asp:Content>


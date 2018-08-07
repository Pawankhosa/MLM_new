﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_view_products : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //  string a = Session["client"].ToString();
            bind();
        }
    }
    protected void bind()
    {
        dt = objsql.GetTable("select * from tblproduct ");
        if (dt.Rows.Count > 0)
        {
            gvdata.DataSource = dt;
            gvdata.DataBind();
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        Response.Redirect("product.aspx?id=" + id);
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string id = (sender as LinkButton).CommandArgument;
        Response.Redirect("stock.aspx?id=" + id);
    }
}
﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Stock : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtname.Text= Common.Get(objsql.GetSingleValue("select name from tblproduct where code ='" + Request.QueryString["id"] + "'"));
        }

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            string code = Common.Get(objsql.GetSingleValue("select code from tblstock where code ='" + Request.QueryString["id"] + "'"));
            if (code != "")
            {
                 int qty = Convert.ToInt32(Common.Get(objsql.GetSingleValue("select stock from tblstock where code ='" + Request.QueryString["id"] + "'")));
                int totlqty = Convert.ToInt32(txtqty.Text) + qty;
                objsql.ExecuteNonQuery("update tblstock set code='" + Request.QueryString["id"]+ "',stock='" + totlqty + "', date='"+ System.DateTime.Now.ToString("MM/dd/yyyy") + "' where code='" + Request.QueryString["id"] + "'");

            }
            else
            {
                objsql.ExecuteNonQuery("insert into tblstock(code,stock,date) values ('" + Request.QueryString["id"] + "','" + txtqty.Text + "','"+ System.DateTime.Now.ToString("MM/dd/yyyy") + "')");
            }
        }
        
        Response.Redirect("view-products.aspx");
    }
 
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_seveninstall : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    DataTable MyDT = new DataTable();
    DataRow MyRow;
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
    }
    protected void bind()
    {
        MyDT.Columns.Add("id");

        MyDT.Columns.Add("Name");

        MyDT.Columns.Add("mobile");
        MyDT.Columns.Add("cnt");
        MyDT.Columns.Add();
     
        DataTable dt = new DataTable();
        dt = objsql.GetTable("select distinct i.id,m.Name,m.mobile,cnt=(select count(*) from installment where id=i.Id ) from installment i Inner join MEMBER_CREATION m on m.id=i.Id ");
        //dt = objsql.GetTable("select Distinct id from installment");
        foreach (DataRow dr in dt.Rows)
        {
         
            if (Convert.ToInt32(dr["cnt"].ToString()) >= 7)
            {
                MyRow = MyDT.NewRow();
                MyRow[0] = dr["id"];
                MyRow[1] = dr["Name"];
                MyRow[2] = dr["mobile"];
                MyRow[3] = dr["cnt"];
                MyDT.Rows.Add(MyRow);
            }
            else
            {

            }
           
        }
        ListView1.DataSource = MyDT;
        ListView1.DataBind();

    }

    protected void lnkill_Click(object sender, EventArgs e)
    {
        string id = (sender as LinkButton).CommandArgument;
        Response.Redirect("billing-product.aspx?id=" + id);
    }

    protected void ListView1_DataBound(object sender, EventArgs e)
    {

    }
}
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
        MyDT.Columns.Add("Father");
        MyDT.Columns.Add("Address");
        MyDT.Columns.Add("SponserName");
        MyDT.Columns.Add("SponserID");
        MyDT.Columns.Add("cnt");
        MyDT.Columns.Add();
     
        DataTable dt = new DataTable();
        dt = objsql.GetTable("select distinct i.id,m.Name,m.mobile,m.address,m.father,m.spon,(select name from MEMBER_CREATION where Id=m.spon) as sponsname,i.paid,cnt=(select count(*) from installment where id=i.Id ) from installment i Inner join MEMBER_CREATION m on m.id=i.Id and i.paid='0'");
        foreach (DataRow dr in dt.Rows)
        {
         
            if (Convert.ToInt32(dr["cnt"].ToString()) >= 7)
            {
                //string billval = Common.Get(objsql.GetSingleValue("select purchaseid from tblMaster where regno ='" + dr["id"] + "'"));
                //if (billval == "")
                //{
                    MyRow = MyDT.NewRow();
                    MyRow[0] = dr["id"];
                    MyRow[1] = dr["Name"];
                    MyRow[2] = dr["mobile"];
                    MyRow[3] = dr["father"];
                    MyRow[4] = dr["address"];
                    MyRow[5] = dr["sponsname"];
                    MyRow[6] = dr["spon"];
                    MyRow[7] = dr["cnt"];
                    MyDT.Rows.Add(MyRow);
                //}
                //else
                //{

                //}
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
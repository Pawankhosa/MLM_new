using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Client_Default2 : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            dt = objsql.GetTable("select * from tblMaster where regno='" + Session["ID"].ToString() + "' ");
            if (dt.Rows.Count > 0)
            {
                pnlproduct.Visible = true;
                pnlContents1.Visible = false;
                DataTable dts = new DataTable();
                dts = objsql.GetTable("select p.name,p.mrp,p.bv,p.image,s.qty,s.date,s.purchaseid from tblproduct p Inner join tblSingle s on s.item = p.code and s.purchaseid = '36505'");
                GridView2.DataSource = dts;
                GridView2.DataBind();
             
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('')", true);
            }
            else
            {
                pnlproduct.Visible = false;
                pnlContents1.Visible = true;
                btnPrint.Visible = true;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select row_number() over (order by sr) as SR,SR as 'Rec',DATE_ENTRY as DATE,ID from installment where id=@ID order by DATE_ENTRY";
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = Convert.ToString(Session["ID"]);
                cmd.Connection = con;
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Dispose();
            }
        }
    }
    protected void GridView2_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblqty = (Label)e.Row.FindControl("lblqty");
            Label lblmrp = (Label)e.Row.FindControl("lblmrp");
            Label lblbv = (Label)e.Row.FindControl("lblbv");
            Label total = (Label)e.Row.FindControl("total");
            Label bvtotal = (Label)e.Row.FindControl("bvtotal");
            total.Text = ((Convert.ToInt32(lblqty.Text)) * (Convert.ToInt32(lblmrp.Text))).ToString();
            bvtotal.Text = ((Convert.ToInt32(lblqty.Text)) * (Convert.ToInt32(lblbv.Text))).ToString();
        }
    }
}

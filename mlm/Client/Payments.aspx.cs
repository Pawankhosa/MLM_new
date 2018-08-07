using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Client_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select row_number() over (order by sr) as SR,SR as 'Rec',DATE_ENTRY as DATE,ID from installment where id=@ID order by DATE_ENTRY";
            cmd.Parameters.Add("@ID",SqlDbType.VarChar).Value = Convert.ToString(Session["ID"]);
            cmd.Connection = con;
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Dispose();
        }
    }
}

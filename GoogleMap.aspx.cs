using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            renderChart();
        }
        else
        {
            Response.Redirect("/Account/Login");
        }

    }

    public string chartData { get; set; }
    public string chartDataK { get; set; }


    public void renderChart()
    {
        DataTable dt = GetData(); //Assuming that GetData already populating with data as datatable   
        List<string> _data = new List<string>();
        List<double> _dataK = new List<double>();
        foreach (DataRow row in dt.Rows)
        {
            _data.Add((string)row["Label"]);
            _dataK.Add((double)row["Value"]);
        }
        JavaScriptSerializer jss = new JavaScriptSerializer();
        chartData = jss.Serialize(_data); //this make your list in jSON format like [88,99,10]
        chartDataK = jss.Serialize(_dataK); //this make your list in jSON format like [88,99,10]
    }

    public DataTable GetData()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["****************"].ConnectionString;
        DataTable dt = new DataTable();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand("SELECT TOP 100000" +
            "[dbo].[v_rpt_Service].[Board_Name] AS 'Label', AVG(CAST([dbo].[v_rpt_Service].[Resolved_Minutes] AS float)) AS 'Value'" +
            "FROM [dbo].[v_rpt_Service] WITH(NOLOCK)" +
            "WHERE  ([dbo].[v_rpt_Service].[Closed_Flag] = 1) AND ([dbo].[v_rpt_Service].[date_entered] BETWEEN '2014-01-01T00:00:00.000' AND '2014-12-31T23:59:59.998')" +
            "GROUP BY [dbo].[v_rpt_Service].[Board_Name]" +
            "ORDER BY AVG(CAST([dbo].[v_rpt_Service].[Resolved_Minutes] AS float)) DESC;", connection))
            {
                connection.Open();
                using (SqlDataReader dr = command.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        dt.Load(dr);
                    }
                }
            }
        }

        return dt;
    }

}
using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.Identity.IsAuthenticated)
        {
            LoadDdlTickets();
        }
        else
        {
            Response.Redirect("/Account/Login");
        }

    }

   
    private void LoadDdlTickets()
    {
        if (!Page.IsPostBack)
        {
            DdlTickets.AppendDataBoundItems = true;
            String strConnString = ConfigurationManager
               .ConnectionStrings["****************"].ConnectionString;
            String strQuery = "SELECT TOP 100000 [dbo].[v_rpt_Service].[status_description] AS 'Status Description'" +
            "FROM [dbo].[v_rpt_Service] WITH(NOLOCK)" +
            "WHERE  ([dbo].[v_rpt_Service].[status_description] IN ('Assigned','Canceled'," +
            "'Closed','Completed','Done yet?','Enter Time','In Progress','New','New (email connector)'," +
            "'On-Hold','Requested Info from customer','Rescheduled','Scheduled','Waiting on 3rd Party Vendor'," +
            "'Waiting on client','Waiting parts/repair'))" +
            "GROUP BY [dbo].[v_rpt_Service].[status_description]" +
            "ORDER BY [dbo].[v_rpt_Service].[status_description] ASC;";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                DdlTickets.DataSource = cmd.ExecuteReader();
                DdlTickets.Items.Add(new ListItem("All Status")); //For all records
                DdlTickets.DataTextField = "Status Description";
                DdlTickets.DataValueField = "Status Description";
                DdlTickets.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }

    protected void btnDownloadDumpList_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable("GridView_Data");
        foreach (TableCell cell in GridView1.HeaderRow.Cells)
        {
            dt.Columns.Add(cell.Text);
        }
        foreach (GridViewRow row in GridView1.Rows)
        {
            dt.Rows.Add();
            for (int i = 0; i < row.Cells.Count; i++)
            {
                dt.Rows[dt.Rows.Count - 1][i] = row.Cells[i].Text;
            }
        }
        using (XLWorkbook wb = new XLWorkbook())
        {
            wb.Worksheets.Add(dt);

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=MyTickets.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

    }

    private void GetSchedule()
    {

        String strConnString = ConfigurationManager
           .ConnectionStrings["****************"].ConnectionString;

        String strQuery = @"SELECT TOP 100000" +
        "[dbo].[v_rpt_Service].[company_name] AS 'Company Name'," +
        "[dbo].[v_rpt_Service].[status_description] AS 'Status'," +
        "[dbo].[v_rpt_Service].[TicketNbr] AS 'Ticket#'," +
        "[dbo].[v_rpt_Service].[Detail_Description] AS 'Detail Description'," +
        "[dbo].[v_rpt_Service].[date_entered] AS 'Date Entered'," +
        "[dbo].[v_rpt_Service].[contact_name] AS 'Contact Name'" +
        "FROM [dbo].[v_rpt_Service] WITH(NOLOCK)" +
        "WHERE ([dbo].[v_rpt_Service].[company_name] = '******')" +
        "AND ([dbo].[v_rpt_Service].[status_description] = @Status)" +
        "AND ([dbo].[v_rpt_Service].[date_entered] BETWEEN @DateFrom AND @DateTo)" +
        "GROUP BY [dbo].[v_rpt_Service].[company_name]," +
        "[dbo].[v_rpt_Service].[status_description]," +
        "[dbo].[v_rpt_Service].[TicketNbr]," +
        "[dbo].[v_rpt_Service].[Detail_Description]," +
        "[dbo].[v_rpt_Service].[date_entered]," +
        "[dbo].[v_rpt_Service].[contact_name]" +
        "ORDER BY [dbo].[v_rpt_Service].[date_entered] DESC;";

        System.Globalization.CultureInfo en = new System.Globalization.CultureInfo("en-US");
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand(strQuery + "", con);

        //*****************************Status*********************************************
        cmd.Parameters.Add(new SqlParameter("@Status", //the name of the parameter to map
          System.Data.SqlDbType.NVarChar, //SqlDbType value
          20, //The width of the parameter
          "status_description")); //The name of the column source
        //Fill the parameter with the value retrieved
        //from the text field
        cmd.Parameters["@Status"].Value = DdlTickets.SelectedItem.Value;
        //*****************************Date From******************************************
        cmd.Parameters.Add(new SqlParameter("@DateFrom", //the name of the parameter to map
          System.Data.SqlDbType.NVarChar, //SqlDbType value
          20, //The width of the parameter
          "date_entered")); //The name of the column source
        //Fill the parameter with the value retrieved
        //from the text field
        cmd.Parameters["@DateFrom"].Value = TxtDateFrom.Text;
        //*****************************Date To*******************************************
        cmd.Parameters.Add(new SqlParameter("@DateTo", //the name of the parameter to map
          System.Data.SqlDbType.NVarChar, //SqlDbType value
          20, //The width of the parameter
          "date_entered")); //The name of the column source
        //Fill the parameter with the value retrieved
        //from the text field
        cmd.Parameters["@DateTo"].Value = TxtDateTo.Text;


        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmd.Connection = con;
        try
        {
            con.Open();
            if (DdlTickets.Items.Count > 1)
            {
                da.Fill(ds, strQuery);
                GridView1.DataSource = ds.Tables[strQuery];
                GridView1.DataBind();
                BtnCSV.Visible = true;
            }
            if (GridView1.Rows.Count <= 0)
            {
                BtnCSV.Visible = false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    private void GetAll() 
    {

        String strConnString = ConfigurationManager
           .ConnectionStrings["****************"].ConnectionString;

        String strQuery = @"SELECT TOP 100000" +
        "[dbo].[v_rpt_Service].[company_name] AS 'Company Name'," +
        "[dbo].[v_rpt_Service].[status_description] AS 'Status'," +
        "[dbo].[v_rpt_Service].[TicketNbr] AS 'Ticket#'," +
        "[dbo].[v_rpt_Service].[Detail_Description] AS 'Detail Description'," +
        "[dbo].[v_rpt_Service].[date_entered] AS 'Date Entered'," +
        "[dbo].[v_rpt_Service].[contact_name] AS 'Contact Name'" +
        "FROM [dbo].[v_rpt_Service] WITH(NOLOCK)" +
        "WHERE ([dbo].[v_rpt_Service].[company_name] = '******')" +
        "AND ([dbo].[v_rpt_Service].[status_description] IN" +
        "('Assigned','Canceled','Closed','Completed','Done yet?'," +
        "'Enter Time','In Progress','New','New (email connector)'," +
        "'On-Hold','Requested Info from customer','Rescheduled','Scheduled'," +
        "'Waiting on 3rd Party Vendor','Waiting on client','Waiting parts/repair'))" +
        "AND ([dbo].[v_rpt_Service].[date_entered] BETWEEN @DateFrom AND @DateTo)" +
        "GROUP BY [dbo].[v_rpt_Service].[company_name]," +
        "[dbo].[v_rpt_Service].[status_description]," +
        "[dbo].[v_rpt_Service].[TicketNbr]," +
        "[dbo].[v_rpt_Service].[Detail_Description]," +
        "[dbo].[v_rpt_Service].[date_entered]," +
        "[dbo].[v_rpt_Service].[contact_name]" +
        "ORDER BY [dbo].[v_rpt_Service].[date_entered] DESC;";

        System.Globalization.CultureInfo en = new System.Globalization.CultureInfo("en-US");
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand(strQuery + "", con);
        cmd.Parameters.AddWithValue("@DateFrom", TxtDateFrom.Text);
        cmd.Parameters.AddWithValue("@DateTo", TxtDateTo.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        cmd.Connection = con;
        try
        {
            con.Open();
            if (DdlTickets.SelectedItem.Value == "All Status") 
            {
                da.Fill(ds, strQuery);
                GridView1.DataSource = ds.Tables[strQuery];
                GridView1.DataBind();
                BtnCSV.Visible = true;
            }
            if (GridView1.Rows.Count <= 0)
            {
                BtnCSV.Visible = false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            GetSchedule(); 
        }
        if (Page.IsValid & DdlTickets.SelectedItem.Value == "All Status") // All items to the search
        {
            GetAll();
        }
        else
        {
            //lblmsg.Text = "Fill out all the fields";
        }               
    }


}
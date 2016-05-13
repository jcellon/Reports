using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
    
        }
        else
        {
            Response.Redirect("/Account/Login");
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
            Response.AddHeader("content-disposition", "attachment;filename=MyInvoices.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

    }


    private void GetInvoice() 
    {

        String strConnString = ConfigurationManager
           .ConnectionStrings["****************"].ConnectionString;

        String strQuery = "SELECT TOP 200000" +
        "[dbo].[v_rpt_Invoices].[Company_Name] AS 'Company'," +
        "DATEPART(year, [dbo].[v_rpt_Invoices].[Date_Invoice]) AS 'Year'," +
        "DATEPART(month, [dbo].[v_rpt_Invoices].[Date_Invoice]) AS 'Month'," +
        "COUNT([dbo].[v_rpt_Invoices].[Billing_Log_RecID]) AS 'Invoice Count'," +
        "[dbo].[v_rpt_Invoices].[Ticket_Summary] AS 'Summary'," +
        "'$'+LTRIM(CONVERT(varchar,convert(money,SUM([dbo].[v_rpt_Invoices].[Invoice_Amount])),1)) AS 'Invoice Amount'," +
        "'$'+LTRIM(CONVERT(varchar,convert(money,SUM([dbo].[v_rpt_Invoices].[Invoice_Amount]) -  SUM([dbo].[v_rpt_Invoices].[Paid_Amount])),1)) AS 'Not Paid Amount'," +
        "'$'+LTRIM(CONVERT(varchar,convert(money,AVG([dbo].[v_rpt_Invoices].[Invoice_Amount])),1)) AS 'Avg Invoice Amount'" +
        "FROM [dbo].[v_rpt_Invoices] WITH(NOLOCK)" +
        "WHERE ([dbo].[v_rpt_Invoices].[Company_Name] = '******')" +
        "AND ([dbo].[v_rpt_Invoices].[Date_Invoice] BETWEEN @DateFrom AND @DateTo)" +
        "GROUP BY [dbo].[v_rpt_Invoices].[Company_Name]," +
        "[dbo].[v_rpt_Invoices].[Ticket_Summary]," +
        "DATEPART(year, [dbo].[v_rpt_Invoices].[Date_Invoice]), DATEPART(month, [dbo].[v_rpt_Invoices].[Date_Invoice])" +
        "ORDER BY [dbo].[v_rpt_Invoices].[Company_Name] ASC," +
        "DATEPART(year, [dbo].[v_rpt_Invoices].[Date_Invoice]) ASC;";

        System.Globalization.CultureInfo en = new System.Globalization.CultureInfo("en-US");
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand(strQuery + "", con);
        
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
            if (TxtDateTo.Text != String.Empty && TxtDateTo.Text != String.Empty)
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
            GetInvoice(); 
        }
        else
        {
            //lblmsg.Text = "Fill out all the fields";
        }   
    }

}
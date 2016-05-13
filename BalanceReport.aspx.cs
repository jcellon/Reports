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
//using System.Data.DataSetExtensions;  

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

    protected void btnDownloadDumpListCredits_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable("GridView_Data");
        foreach (TableCell cell in GridView2.HeaderRow.Cells) 
        {
            dt.Columns.Add(cell.Text);
        }
        foreach (GridViewRow row in GridView2.Rows)
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
            Response.AddHeader("content-disposition", "attachment;filename=MyAgreementCredits.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
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
            Response.AddHeader("content-disposition", "attachment;filename=MyAgreementsBalance.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

    }

    private void GetAgreement()  
    {

        String strConnString = ConfigurationManager
           .ConnectionStrings["****************"].ConnectionString;
        
        String strQuery = @"SELECT TOP 100000" +
        "[dbo].[v_rpt_AgreementList].[Company_Name] AS 'Company'," +
        "[dbo].[Time_Entry].[SR_Service_RecID] AS 'Ticket#'," +
        "[dbo].[v_rpt_AgreementList].[AGR_Name] AS 'Name'," +
        "[dbo].[v_rpt_AgreementList].[agr_type_desc] AS 'Type'," +
        "[dbo].[Time_Entry].[Date_Start] AS 'Date Start'," +
        "'-$'+LTRIM(CONVERT(varchar,convert(money,Agr_Amount),1)) AS 'Charges'," +
        "[dbo].[Time_Entry].[Notes] AS 'Notes'," +
        "[dbo].[Time_Entry].[Entered_By] AS 'By'" +
        "FROM [dbo].[v_rpt_AgreementList] WITH(NOLOCK)" +
        "INNER JOIN [dbo].[Time_Entry] WITH(NOLOCK)  ON [dbo].[Time_Entry].[Agr_Header_RecID]=[dbo].[v_rpt_AgreementList].[AGR_Header_RecID]" +
        "WHERE  ([dbo].[v_rpt_AgreementList].[Company_Name] = N'******') AND ([dbo].[v_rpt_AgreementList].[agr_type_desc]" +
        "IN ('BT-One','Retainer','Legacy Block time','Managed Service','Managed Services - Quarterly','Legacy retainer','Onsite Support','Remote Support'))" +
        "AND ([dbo].[Time_Entry].[Date_Start] BETWEEN @DateFrom AND @DateTo) ;";


        System.Globalization.CultureInfo en = new System.Globalization.CultureInfo("en-US");
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand(strQuery + "", con);
        
        //*****************************Date From******************************************
        cmd.Parameters.Add(new SqlParameter("@DateFrom", //the name of the parameter to map
          System.Data.SqlDbType.NVarChar, //SqlDbType value
          20, //The width of the parameter
          "agr_date_start")); //The name of the column source
        //Fill the parameter with the value retrieved
        //from the text field
        cmd.Parameters["@DateFrom"].Value = TxtDateFrom.Text;
        //*****************************Date To*******************************************
        cmd.Parameters.Add(new SqlParameter("@DateTo", //the name of the parameter to map
          System.Data.SqlDbType.NVarChar, //SqlDbType value
          20, //The width of the parameter
          "agr_date_start")); //The name of the column source
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

             // Close connection
             con.Close();
             con.Dispose();
             cmd.Dispose();

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

  
    private void GetCredit()
    { 

        String strConnString = ConfigurationManager
           .ConnectionStrings["****************"].ConnectionString;
               
        String strQuery = "SELECT TOP 100000" +
        "[dbo].[v_rpt_AgreementList].[Company_Name] AS 'Company'," +
        "[dbo].[v_rpt_AgreementList].[AGR_Name] AS 'Name'," +
        "[dbo].[v_rpt_AgreementList].[agr_type_desc] AS 'Type'," +
        "dateadd(month,((DATEPART(year, [dbo].[AGR_Allocation].[Date_Created])-1900)*12)+DATEPART(month, [dbo].[AGR_Allocation].[Date_Created])-1,1-1) AS 'Date Created'," +
        "[dbo].[AGR_Allocation].[PP_Amount] AS 'Allocation / Credit'," +
        "[dbo].[AGR_Adjustment].[PP_AdjAmount] AS 'Adjustment / Credit'," +
        "[dbo].[AGR_Adjustment].[AGR_Desc] AS 'Adjustment Description'" +
        "FROM [dbo].[v_rpt_AgreementList] WITH(NOLOCK)" +
        "INNER JOIN [dbo].[Time_Entry] WITH(NOLOCK)  ON [dbo].[Time_Entry].[Agr_Header_RecID]=[dbo].[v_rpt_AgreementList].[AGR_Header_RecID]" +
        "INNER JOIN [dbo].[AGR_Allocation] WITH(NOLOCK)  ON [dbo].[AGR_Allocation].[AGR_Header_RecID]=[dbo].[Time_Entry].[Agr_Header_RecID]" +
        "INNER JOIN [dbo].[AGR_Adjustment] WITH(NOLOCK)  ON [dbo].[AGR_Adjustment].[AGR_Header_RecID]=[dbo].[AGR_Allocation].[AGR_Header_RecID]" +
        "WHERE  ([dbo].[v_rpt_AgreementList].[Company_Name] = N'******')" +
        "AND ([dbo].[v_rpt_AgreementList].[agr_type_desc]" +
        "IN ('BT-One','Retainer'))" +
        "AND ([dbo].[AGR_Allocation].[Date_Created] BETWEEN @DateFrom AND @DateTo)" +
        "GROUP BY [dbo].[v_rpt_AgreementList].[Company_Name], [dbo].[v_rpt_AgreementList].[AGR_Name], [dbo].[v_rpt_AgreementList].[agr_type_desc], dateadd(month,((DATEPART(year, [dbo].[AGR_Allocation].[Date_Created])-1900)*12)+DATEPART(month, [dbo].[AGR_Allocation].[Date_Created])-1,1-1), [dbo].[AGR_Allocation].[PP_Amount], [dbo].[AGR_Adjustment].[PP_AdjAmount], [dbo].[AGR_Adjustment].[AGR_Desc];";



        System.Globalization.CultureInfo en = new System.Globalization.CultureInfo("en-US");
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand(strQuery + "", con);

        //*****************************Date From******************************************
        cmd.Parameters.Add(new SqlParameter("@DateFrom", //the name of the parameter to map
          System.Data.SqlDbType.NVarChar, //SqlDbType value
          20, //The width of the parameter
          "agr_date_start")); //The name of the column source
        //Fill the parameter with the value retrieved
        //from the text field
        cmd.Parameters["@DateFrom"].Value = TxtDateFrom.Text;
        //*****************************Date To*******************************************
        cmd.Parameters.Add(new SqlParameter("@DateTo", //the name of the parameter to map
          System.Data.SqlDbType.NVarChar, //SqlDbType value
          20, //The width of the parameter
          "agr_date_start")); //The name of the column source
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
                GridView2.DataSource = ds.Tables[strQuery];
                GridView2.DataBind();
                
                BtnCSVCre.Visible = true;
            }
            if (GridView2.Rows.Count <= 0)
            {
                BtnCSVCre.Visible = false;
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
            GetAgreement();
            GetCredit();
        }
        else
        {
            //lblmsg.Text = "Fill out all the fields";
        }   
    }

}
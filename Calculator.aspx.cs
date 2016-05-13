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

}
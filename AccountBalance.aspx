<%@ Page Title="Account Balance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AccountBalance.aspx.cs" Inherits="_Default" %>

<asp:Content ID="SiteContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- BEGIN Theme Setting -->
    <div id="theme-setting">
        <a href="#"><i class="icon-gears icon-2x"></i></a>
        <ul>
            <li>
                <span>Skin</span>
                <ul class="colors" data-target="body" data-prefix="skin-">
                    <li class="active"><a class="blue" href="#"></a></li>
                    <li><a class="red" href="#"></a></li>
                    <li><a class="green" href="#"></a></li>
                    <li><a class="orange" href="#"></a></li>
                    <li><a class="yellow" href="#"></a></li>
                    <li><a class="pink" href="#"></a></li>
                    <li><a class="magenta" href="#"></a></li>
                    <li><a class="gray" href="#"></a></li>
                    <li><a class="black" href="#"></a></li>
                </ul>
            </li>
            <li>
                <span>Navbar</span>
                <ul class="colors" data-target="#navbar" data-prefix="navbar-">
                    <li class="active"><a class="blue" href="#"></a></li>
                    <li><a class="red" href="#"></a></li>
                    <li><a class="green" href="#"></a></li>
                    <li><a class="orange" href="#"></a></li>
                    <li><a class="yellow" href="#"></a></li>
                    <li><a class="pink" href="#"></a></li>
                    <li><a class="magenta" href="#"></a></li>
                    <li><a class="gray" href="#"></a></li>
                    <li><a class="black" href="#"></a></li>
                </ul>
            </li>
            <li>
                <span>Sidebar</span>
                <ul class="colors" data-target="#main-container" data-prefix="sidebar-">
                    <li class="active"><a class="blue" href="#"></a></li>
                    <li><a class="red" href="#"></a></li>
                    <li><a class="green" href="#"></a></li>
                    <li><a class="orange" href="#"></a></li>
                    <li><a class="yellow" href="#"></a></li>
                    <li><a class="pink" href="#"></a></li>
                    <li><a class="magenta" href="#"></a></li>
                    <li><a class="gray" href="#"></a></li>
                    <li><a class="black" href="#"></a></li>
                </ul>
            </li>
            <li>
                <span></span>
                <a data-target="navbar" href="#"><i class="icon-check-empty"></i>Fixed Navbar</a>
                <a class="pull-right visible-desktop" data-target="sidebar" href="#"><i class="icon-check-empty"></i>Fixed Sidebar</a>
            </li>
        </ul>
    </div>
    <!-- END Theme Setting -->



    <!-- BEGIN Container -->
    <div class="container-fluid" id="main-container">
        <!-- BEGIN Sidebar -->
        <div id="sidebar" class="nav-collapse">
            <!-- BEGIN Navlist -->
            <ul class="nav nav-list">

                <li>
                    <a href="Default.aspx" class="dropdown-toggle">
                        <i class="icon-signal"></i>
                        <span>Home</span>
                    </a>
                </li>

                <li>
                    <a href="SearchTicketSummary.aspx" class="dropdown-toggle">
                        <i class="icon-tags"></i>
                        <span>Search Tickets</span>
                    </a>
                </li>

                <li>
                    <a href="SearchInvoice.aspx" class="dropdown-toggle">
                        <i class="icon-inbox"></i>
                        <span>Search Invoice</span>
                    </a>
                </li>

                <li class="active">
                    <a href="AccountBalance.aspx" class="dropdown-toggle">
                        <i class="icon-credit-card"></i>
                        <span>Account Balance</span>
                    </a>
                </li>

                <li>
                    <a href="Account/Manage.aspx">
                        <i class="icon-gears"></i>
                        <span>Manage Account</span>
                    </a>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-globe"></i>
                        <span>Maps & Tools</span>
                        <b class="arrow icon-angle-right"></b>
                    </a>

                    <!-- BEGIN Submenu -->
                    <ul class="submenu">
                        <li><a href="GoogleMap.aspx">Google Maps</a></li>
                        <li><a href="VectorMap.aspx">Vector Maps</a></li>
                        <li><a href="Calculator.aspx">Calculator</a></li>
                    </ul>
                    <!-- END Submenu -->
                </li>


            </ul>
            <!-- END Navlist -->

            <!-- BEGIN Sidebar Collapse Button -->
            <div id="sidebar-collapse" class="visible-desktop">
                <i class="icon-double-angle-left"></i>
            </div>
            <!-- END Sidebar Collapse Button -->

        </div>
        <!-- END Sidebar -->

        <!-- BEGIN Content -->

        <div id="main-content">

            <!-- BEGIN Page Title -->
            <div class="box">
                <div class="box-title">
                    <h3><i class="icon-globe"></i>Balance and Detail Transactions of my Agreement</h3>
                    <div class="box-tool">
                        <button ID="BtnCSVCre" runat="server" class="btn btn-circle btn-info" onServerClick="btnDownloadDumpListCredits_Click" visible="False"><i class="icon-external-link"></i></button>
                        <button ID="BtnCSV" runat="server" class="btn btn-circle btn-info" onServerClick="btnDownloadDumpList_Click" visible="False"><i class="icon-external-link"></i></button>
                        <button runat="server" class="btn btn-circle btn-info" onClick="window.print()"><i class="icon-print"></i></button>
                        <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                        <a data-action="close" href="#"><i class="icon-remove"></i></a>
                    </div>
                </div>

                <!-- END Page Title -->


                <!-- BEGIN Main Content -->
                <div class="box-content">
          
        <table>
                <tr>
                    <td style="padding-bottom: 15px;">
                    <asp:Label ID="Label1" runat="server" Text=" Please select the dates to view details:"></asp:Label> 
                    </td>
                </tr>
                <tr style="padding-bottom: 15px;">
                    <td style="padding-left: 40px;">
                    <asp:Label ID="Label2" runat="server" Text=" From:"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TxtDateFrom" runat="server" Width="88px" Height="30px" style="cursor:pointer" ToolTip="mm/dd/yyyy"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TxtDateFrom" />
                    </td>
                    <td style="padding-left: 0px;">
                    <asp:Label ID="Label4" runat="server" Text=" To:"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TxtDateTo" runat="server" Width="88px" Height="30px" style="cursor:pointer"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TxtDateTo" />
                    </td>
                    <td style="padding-left: 35px;" valign="top">
                    <asp:Button Class="btn btn-info" ID="BtnSearch" runat="server" 
                    Width="100px" Height="30px" Text="Search" OnClick="BtnSearch_Click"> 
                    </asp:Button>
                    </td>
                </tr>
                
                    <tr>
                        <td style="padding-left: 6px;">
                        <asp:RequiredFieldValidator ID="RfvTxtDateFrom" runat="server" ErrorMessage="-Selected Date From is required" ControlToValidate="TxtDateFrom" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 6px;">
                        <asp:RequiredFieldValidator ID="RfvTxtDateTo" runat="server" ErrorMessage="-Selected Date To is required" ControlToValidate="TxtDateTo" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
       </table>

      <div style="padding-left: 5px; padding-bottom: 30px;">
               
       <asp:GridView ID="GridView2" runat="server" CssClass="Gridview" Width="987px">
            <AlternatingRowStyle BackColor="#e9f0f9"/>
                <EmptyDataTemplate >** There's no credits activity **</EmptyDataTemplate>
                        <emptydatarowstyle ForeColor="Red" Font-Bold="True" />
                        <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                        <RowStyle Wrap="True" />
        </asp:GridView>
        
        </div>

       <div style="padding-left: 5px;">
                    
        <asp:GridView ID="GridView1" runat="server" CssClass="Gridview" ShowFooter="True">
            <AlternatingRowStyle BackColor="#e9f0f9"/>
                <EmptyDataTemplate >** There's no charges activity **</EmptyDataTemplate>
                        <emptydatarowstyle ForeColor="Red" Font-Bold="True" />
                        <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                        <RowStyle Wrap="True" />
        </asp:GridView>

        </div>

        <div style="padding-left: 5px; padding-top: 30px;">

        <table>

        <tr>

            <td>
               <asp:GridView ID="GridView3" runat="server" CssClass="Gridview" ShowFooter="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="987px">
               <AlternatingRowStyle BackColor="#e9f0f9"/>
                    <EmptyDataTemplate >** There's no balance activity **</EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField DataField="Charges" HeaderText="CHARGES" SortExpression="Charges" ReadOnly="True" DataFormatString="{0:c}" ItemStyle-VerticalAlign="NotSet" HeaderStyle-HorizontalAlign="NotSet" />
                        <asp:BoundField DataField="Credits" HeaderText="CREDITS" SortExpression="Allocation" ReadOnly="True" DataFormatString="{0:c}"/>
                        <asp:BoundField DataField="Balance" HeaderText="TOTAL BALANCE" SortExpression="Adjustments" ReadOnly="True" DataFormatString="{0:c}"/>
                   </Columns>
                    <emptydatarowstyle ForeColor="Red" Font-Bold="True" />
                    <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                    <RowStyle Wrap="True" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:****************** %>" 
                    SelectCommand="SELECT TOP (100000) 
                    SUM(Time_Entry.Agr_Amount) AS 'Charges', 
                    SUM(DISTINCT AGR_Allocation.PP_Amount + AGR_Adjustment.PP_AdjAmount) AS Credits, 
                    SUM(DISTINCT AGR_Allocation.PP_Amount + AGR_Adjustment.PP_AdjAmount) - SUM(Time_Entry.Agr_Amount) AS Balance 
                    FROM v_rpt_AgreementList WITH (NOLOCK) 
                    INNER JOIN Time_Entry WITH (NOLOCK) ON Time_Entry.Agr_Header_RecID = v_rpt_AgreementList.AGR_Header_RecID 
                    INNER JOIN AGR_Allocation WITH (NOLOCK) ON AGR_Allocation.AGR_Header_RecID = Time_Entry.Agr_Header_RecID 
                    INNER JOIN AGR_Adjustment WITH (NOLOCK) ON AGR_Adjustment.AGR_Header_RecID = AGR_Allocation.AGR_Header_RecID 
                    WHERE (v_rpt_AgreementList.Company_Name = N'*******') 
                    AND (v_rpt_AgreementList.agr_type_desc IN ('BT-One', 'Retainer')) 
                    AND (Time_Entry.Date_Start BETWEEN '2015-01-01T00:00:00.000' AND GETDATE())">
                </asp:SqlDataSource>
            </td>*

        </tr>

        </table>

        </div>

        <div style="padding-top:25px; padding-left:30px;">

            <asp:Label ID="TxtTotal" runat="server" Visible="False" Text="Balance:" Font-Bold="True"></asp:Label> 
            <asp:Label ID="lblGrandTotal" runat="server" Text="0" Visible="False"></asp:Label>

        </div>

        <div style="padding-bottom: 79px;"></div>

                </div>
            </div>

           
            <!-- END Main Content -->



            <a id="btn-scrollup" class="btn btn-circle btn-large" href="#"><i class="icon-chevron-up"></i></a>
        </div>
        <!-- END Content -->
    </div>
    <!-- END Container -->


    <!--basic scripts-->
    <script>window.jQuery || document.write('<script src="assets/jquery/jquery-1.10.1.min.js"><\/script>')</script>
   <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">jQuery.noConflict();</script>--%>
    <script src="code/assets/bootstrap/bootstrap.min.js"></script>
    <script src="code/assets/nicescroll/jquery.nicescroll.min.js"></script>

    <!--page specific plugin scripts-->
    <script src="code/assets/flot/jquery.flot.js"></script>
    <script src="code/assets/flot/jquery.flot.resize.js"></script>
    <script src="code/assets/flot/jquery.flot.pie.js"></script>
    <script src="code/assets/flot/jquery.flot.stack.js"></script>
    <script src="code/assets/flot/jquery.flot.crosshair.js"></script>
    <script src="code/assets/flot/jquery.flot.tooltip.min.js"></script>
    <script src="code/assets/sparkline/jquery.sparkline.min.js"></script>

    <!--flaty scripts-->
    <script src="code/js/flaty.js"></script>

    <!--Calculation Script-->
    <script type="text/javascript">
        $(function () {
            $("[id*=txtCredits]").val("0");
        });
        $("[id*=txtCredits]").live("change", function () {
            if (isNaN(parseFloat($(this).val()))) {
                $(this).val('0');
            } else {
                $(this).val(parseFloat($(this).val()).toString());
            }
        });
        $("[id*=txtCredits]").on("keyup", function () {
            if (!jQuery.trim($(this).val()) == '') {
                if (!isNaN(parseFloat($(this).val()))) {
                    var row = $(this).closest("tr");
                    $("[id*=lblTotal]", row).html(parseFloat($(".credits", row).html()) - parseFloat($(".charges", row).html()));
                }
            } else {
                $(this).val('');
            }
            var grandTotal = 0;
            $("[id*=lblTotal]").each(function () {
                grandTotal = grandTotal + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotal]").html(grandTotal.toString());
        });
    </script>

</asp:Content>


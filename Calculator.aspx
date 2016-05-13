<%@ Page Title="Calculator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Calculator.aspx.cs" Inherits="_Default" %>

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

                <%--<li class="active">--%>
                <li>
                    <a href="AccountBalance.aspx" class="dropdown-toggle">
                        <i class="icon-credit-card"></i>
                        <span>AccountBalance</span>
                    </a>
                </li>

                <li>
                    <a href="Account/Manage.aspx">
                        <i class="icon-gears"></i>
                        <span>Manage Account</span>
                    </a>
                </li>

                <li class="active">
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
                    <h3><i class="icon-globe"></i>Calculate Balance</h3>
                    <div class="box-tool">
                        <button runat="server" class="btn btn-circle btn-info" onClick="window.print()"><i class="icon-print"></i></button>
                        <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                        <a data-action="close" href="#"><i class="icon-remove"></i></a>
                    </div>
                </div>

                <!-- END Page Title -->


                <!-- BEGIN Main Content -->
                <div class="box-content">
          
       

        <div style="padding-left: 30px; padding-top: 30px;">

        <table>

        <tr>

        <td>
        <asp:GridView ID="GridView1" runat="server" CssClass="Gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="600px">
            <AlternatingRowStyle BackColor="#e9f0f9"/>
                <Columns>
               <asp:BoundField DataField="Total_Charges" ItemStyle-CssClass="charges" HeaderText="TOTAL CHARGES" />
                <asp:TemplateField HeaderText = "CREDITS" ItemStyle-CssClass="calculator">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCredits" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText = "ESTIMATED BALANCE" ItemStyle-CssClass="calculator">
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server" Text="0" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
                        <emptydatarowstyle ForeColor="Red" Font-Bold="True" />
                        <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                        <RowStyle Wrap="True" />
        </asp:GridView>
        
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:**************** %>" SelectCommand="SELECT TOP 100000  
            SUM ([dbo].[Time_Entry].[Agr_Amount]) AS 'Total_Charges'
            FROM [dbo].[v_rpt_AgreementList] WITH(NOLOCK) 
            INNER JOIN [dbo].[Time_Entry] WITH(NOLOCK)  ON [dbo].[Time_Entry].[Agr_Header_RecID]=[dbo].[v_rpt_AgreementList].[AGR_Header_RecID]
            INNER JOIN [dbo].[AGR_Allocation] WITH(NOLOCK)  ON [dbo].[AGR_Allocation].[AGR_Header_RecID]=[dbo].[Time_Entry].[Agr_Header_RecID]
            WHERE  ([dbo].[v_rpt_AgreementList].[Company_Name] = N'******') AND ([dbo].[v_rpt_AgreementList].[agr_type_desc] IN ('BT-One','Retainer','Managed Service','Managed Services - Quarterly','Onsite Support','Remote Support')) AND ([dbo].[Time_Entry].[Date_Start] BETWEEN '2015-01-01T00:00:00.000' AND GETDATE());
            "></asp:SqlDataSource>
        </td>

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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">jQuery.noConflict();</script>
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
        $("[id*=txtCredits]").on("change", function () {
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
                    $("[id*=lblTotal]", row).html(parseFloat($(this).val()) - parseFloat($(".charges", row).html()));
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


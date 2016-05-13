<%@ Page Title="Search Ticket Summary" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="SearchTicketSummary.aspx.cs" Inherits="_Default" %>

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

                <li class="active">
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

                <li>
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
                    <h3><i class="icon-globe"></i>Search Tickets Engine</h3>
                    <div class="box-tool">                        
                        <button ID="BtnCSV" runat="server" class="btn btn-circle btn-info" onServerClick="btnDownloadDumpList_Click" visible="False"><i class="icon-external-link"></i></button>
                        <button runat="server" class="btn btn-circle btn-info" onClick="window.print()"><i class="icon-print"></i></button>
                        <%--<button ID="BtnReset" runat="server" class="btn btn-circle btn-info" href="SearchTicketsEngine.aspx" causesvalidation="False" ><i class="icon-refresh"></i></button>--%>
                        <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                        <a data-action="close" href="#"><i class="icon-remove"></i></a>
                    </div>
                </div>

                <!-- END Page Title -->


                <!-- BEGIN Main Content -->
                <div class="box-content">
          
        <%--<table>
                <tr>
                    <td style="padding-bottom: 15px;">
                     
                    </td>
                </tr>
                </table>
        <br />
        <br />--%>
        <table> 
                <tr style="padding-bottom: 15px;">
                    <td style="padding-left: 6px; padding-bottom: 25px; padding-top: 25px;">
                    <asp:Label ID="Label1" runat="server" Text="My Company's ticket activity:"></asp:Label>
                    </td>
                </tr>
                <tr style="padding-bottom: 15px;" >   
                    <%--<td style="padding-left: 6px" valign="top">    
                    <asp:Label ID="Label5" runat="server" Text=" Company:"></asp:Label>
                    &nbsp;
                    <asp:DropDownList ID="DdlCompany" runat="server"  Width="180px" TargetControlID="DdlCompany"> 
                        <asp:ListItem Text = "--Select Company--" Value = ""></asp:ListItem>
                    </asp:DropDownList>          
                    </td>    --%> 
                    <td style="padding-left: 10px" valign="top">    
                    <asp:Label ID="Label6" runat="server" Text=" Status:"></asp:Label>
                    &nbsp;
                    <asp:DropDownList ID="DdlTickets" runat="server"  Width="180px" TargetControlID="DdlTickets"> 
                        <asp:ListItem Text = "--Select Status--" Value = ""></asp:ListItem>
                    </asp:DropDownList>                             
                    </td>         
                    <td style="padding-left: 3px;">
                    <asp:Label ID="Label2" runat="server" Text=" From:"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TxtDateFrom" runat="server" Width="88px" Height="30px" style="cursor:pointer" ToolTip="mm/dd/yyyy"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TxtDateFrom" />
                  <%--<ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TxtDateFrom" Format="yyyy-MM-ddTHH:mm:ss.mmm" />--%>
                    </td>
                    <td style="padding-left: 3px;">
                    <asp:Label ID="Label4" runat="server" Text=" To:"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TxtDateTo" runat="server" Width="88px" Height="30px" style="cursor:pointer"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TxtDateTo" />
                   <%--<ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TxtDateTo" Format="yyyy-MM-ddT23:59:59.000" />--%>
                    </td>
                    <td style="padding-left: 35px;" valign="top">
                    <asp:Button Class="btn btn-info" ID="BtnSearch" runat="server" 
                    Width="100px" Height="30px" Text="Search" OnClick="BtnSearch_Click"> 
                    </asp:Button>
                    </td>
                </tr>
                   <%-- <tr>
                        <td style="padding-left: 6px;">
                        <asp:RequiredFieldValidator ID="RfvDdlCompany" runat="server" ErrorMessage="-Selected Company is required" ControlToValidate="DdlCompany" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style="padding-left: 6px;">
                        <asp:RequiredFieldValidator ID="RfvDdlTickets" runat="server" ErrorMessage="-Selected Status is required" ControlToValidate="DdlTickets" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <%--<tr>
                        <td style="padding-left: 30px;">
                        <asp:ValidationSummary ID="Search" runat="server" ValidationGroup="Search" DisplayMode ="BulletList" ShowSummary ="true" HeaderText="Errors:" />
                        </td>
                    </tr>--%>
                
        </table>

        <div style="padding-left: 10px;">

        <asp:GridView ID="GridView1" runat="server" CssClass="Gridview">
            <AlternatingRowStyle BackColor="#e9f0f9"/>
                <EmptyDataTemplate >** There's no tickets activity **</EmptyDataTemplate>
                        <emptydatarowstyle ForeColor="Red" Font-Bold="True" />
                        <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                        <RowStyle Wrap="True" />
        </asp:GridView>

        </div>

        <div style="padding-bottom: 30px;"></div>

                </div>
            </div>

           
            <!-- END Main Content -->



            <a id="btn-scrollup" class="btn btn-circle btn-large" href="#"><i class="icon-chevron-up"></i></a>
        </div>
        <!-- END Content -->
    </div>
    <!-- END Container -->


    <!--basic scripts-->
    <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>-->
    <script>window.jQuery || document.write('<script src="assets/jquery/jquery-1.10.1.min.js"><\/script>')</script>
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

</asp:Content>


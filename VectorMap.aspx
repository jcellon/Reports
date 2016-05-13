<%@ Page Title="Map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="VectorMap.aspx.cs" Inherits="_Default" %>

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
                        <li><a href="Calculator.aspx">Vector Maps</a></li>
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

                   <div class="row-fluid">
                    <div class="span6">
                        <div class="box">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> World</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="vmap" id="vmap-world"></div>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box box-orange">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> USA</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="vmap" id="vmap-usa"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span6">
                        <div class="box box-yellow">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Germany</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="vmap" id="vmap-germany"></div>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box box-green">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Europe</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="vmap" id="vmap-europe"></div>
                            </div>
                        </div>
                    </div>
                </div>

                
            </div>
            <!-- END Main Content -->


            <a id="btn-scrollup" class="btn btn-circle btn-large" href="#"><i class="icon-chevron-up"></i></a>
        </div>
        <!-- END Content -->
    <!-- END Container -->

       
    <!--basic scripts-->
        <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>-->
        <script>window.jQuery || document.write('<script src="assets/jquery/jquery-1.10.1.min.js"><\/script>')</script>
        <script src="code/assets/bootstrap/bootstrap.min.js"></script>
        <script src="code/assets/nicescroll/jquery.nicescroll.min.js"></script>

        <!--page specific plugin scripts-->
        <script src="code/assets/jqvmap/jqvmap/jquery.vmap.min.js"></script>
        <script src="code/assets/jqvmap/jqvmap/maps/jquery.vmap.world.js"></script>
        <script src="code/assets/jqvmap/jqvmap/maps/jquery.vmap.usa.js"></script>
        <script src="code/assets/jqvmap/jqvmap/maps/jquery.vmap.germany.js"></script>
        <script src="code/assets/jqvmap/jqvmap/maps/jquery.vmap.europe.js"></script>
        <script src="code/assets/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"></script>

        <!--flaty scripts-->
        <script src="code/js/flaty.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                //--------------------------- Vector Maps --------------------------------//
                $('#vmap-world').vectorMap({
                    map: 'world_en',
                    backgroundColor: '#d5e2f1',
                    hoverOpacity: 0.7,
                    enableZoom: true,
                    showTooltip: true,
                    values: sample_data,
                    normalizeFunction: 'polynomial'
                });

                $('#vmap-usa').vectorMap({
                    map: 'usa_en',
                    backgroundColor: '#d5e2f1',
                    enableZoom: true,
                    showTooltip: true,
                    selectedRegion: 'IL'
                });

                $('#vmap-germany').vectorMap({
                    map: 'germany_en',
                    backgroundColor: '#d5e2f1',
                    onRegionClick: function (element, code, region) {
                        var message = 'You clicked "'
                            + region
                            + '" which has the code: '
                            + code.toUpperCase();

                        alert(message);
                    }
                });

                $('#vmap-europe').vectorMap({
                    map: 'europe_en',
                    backgroundColor: '#d5e2f1',
                    enableZoom: false,
                    showTooltip: true
                });
            });
        </script>

</asp:Content>


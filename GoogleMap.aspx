<%@ Page Title="Map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="GoogleMap.aspx.cs" Inherits="_Default" %>

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

                   <div class="row-fluid">
                    <div class="span6">
                        <div class="box">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Basic</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="gmap" id="gmap-basic"></div>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box box-magenta">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Markers</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="gmap" id="gmap-markers"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span6">
                        <div class="box box-pink">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Geolocation</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="gmap" id="gmap-geolocation"></div>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box box-green">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Polylines</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="gmap" id="gmap-polyline"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--<div class="row-fluid">
                    <div class="span6">
                        <div class="box box-red">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Polygons</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="gmap" id="gmap-polygon"></div>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box box-black">
                            <div class="box-title">
                                <h3><i class="icon-globe"></i> Static Map</h3>
                                <div class="box-tool">
                                    <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                    <a data-action="close" href="#"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <div class="gmap" id="gmap-static"></div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                
            </div>
            <!-- END Main Content -->


            <a id="btn-scrollup" class="btn btn-circle btn-large" href="#"><i class="icon-chevron-up"></i></a>
        </div>
        <!-- END Content -->
    <!-- END Container -->

       
   
    <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>-->
    <script>window.jQuery || document.write('<script src="code/assets/jquery/jquery-1.10.1.min.js"><\/script>')</script>
    <script src="code/assets/bootstrap/bootstrap.min.js"></script>
    <script src="code/assets/nicescroll/jquery.nicescroll.min.js"></script>

    <!--page specific plugin scripts-->
    <script src="code/assets/flot/jquery.flot.js"></script>
    <%--<script src="code/assets/flot/jquery.flot.resize.js"></script>--%>
    <script src="code/assets/flot/jquery.flot.pie.js"></script>
    <script src="code/assets/flot/jquery.flot.stack.js"></script>
    <script src="code/assets/flot/jquery.flot.crosshair.js"></script>
    <script src="code/assets/flot/jquery.flot.tooltip.min.js"></script>
    <script src="code/assets/sparkline/jquery.sparkline.min.js"></script>

    <!--flaty scripts-->
    <script src="code/js/flaty.js"></script>

    <!--page specific plugin scripts-->
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="code/assets/gmaps/gmaps.js"></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    //--------------------------- Google Maps --------------------------------//
                    //For more example visit: http://hpneo.github.io/gmaps/examples.html
                    //Basic Map------------------------------

                    var map_basic = new GMaps({
                        el: '#gmap-basic',
                        lat: 25.778135,
                        lng: -80.179100,
                        zoom: 12,
                        zoomControl: true,
                        zoomControlOpt: {
                            style: 'SMALL',
                            position: 'TOP_LEFT'
                        },
                        panControl: false,
                        streetViewControl: false,
                        mapTypeControl: false,
                        overviewMapControl: false
                    });

                    //Map with markers-------------------------
                    var map_markers = new GMaps({
                        div: '#gmap-markers',
                        lat: 41.876465,
                        lng: -87.631887,
                        zoom:12,
                    });
                    map_markers.addMarker({
                        lat: 41.876465,
                        lng: -87.621887,
                        title: 'Chicago',
                        details: {
                            database_id: 42,
                            author: 'HPNeo'
                        },
                        click: function (e) {
                            if (console.log)
                                console.log(e);
                            alert('You clicked in this marker');
                        }
                    });
                    map_markers.addMarker({
                        lat: 41.876465,
                        lng: -87.641887,
                        title: 'Marker with InfoWindow',
                        infoWindow: {
                            content: '<p>Chicago Headquarters</p>'
                        }
                    });

                    //Geolocation-----------------------------
                    var map_geolocation = new GMaps({
                        div: '#gmap-geolocation',
                        lat: 37.773972,
                        lng: -122.431297,
                        zoom: 12
                    });

                    GMaps.geolocate({
                        success: function (position) {
                            map.setCenter(position.coords.latitude, position.coords.longitude);
                        },
                        error: function (error) {
                            //alert('Geolocation failed: '+error.message);
                        },
                        not_supported: function () {
                            //alert("Your browser does not support geolocation");
                        },
                        always: function () {
                            //alert("Done!");
                        }
                    });

                    //Polylines---------------------------------
                    var map_polyline = new GMaps({
                        div: '#gmap-polyline',
                        lat: 0,
                        lng: -180,
                        zoom: 2,
                        click: function (e) {
                            console.log(e);
                        }
                    });

                    var path_polylines = [[37.772, -122.214], [21.291, -157.821], [-18.142, 178.431], [-27.467, 153.027]];

                    map_polyline.drawPolyline({
                        path: path_polylines,
                        strokeColor: '#131540',
                        strokeOpacity: 0.6,
                        strokeWeight: 6
                    });

                    //Polygons-----------------------------------
                    var map_polygon = new GMaps({
                        div: '#gmap-polygon',
                        lat: -12.043333,
                        lng: -77.028333
                    });

                    var path_polygons = [[-12.040397656836609, -77.03373871559225],
                                         [-12.040248585302038, -77.03993927003302],
                                         [-12.050047116528843, -77.02448169303511],
                                         [-12.044804866577001, -77.02154422636042]];

                    var polygon = map_polygon.drawPolygon({
                        paths: path_polygons,
                        strokeColor: '#BBD8E9',
                        strokeOpacity: 1,
                        strokeWeight: 3,
                        fillColor: '#BBD8E9',
                        fillOpacity: 0.6
                    });

                    //Static Map----------------------------------
                    var gmap_static_url = GMaps.staticMapURL({
                        size: [$('#gmap-static').width(), 350],
                        lat: -12.043333,
                        lng: -77.028333
                    });
                    $('<img/>').attr('src', gmap_static_url).appendTo('#gmap-static');

                });
        </script>

   

</asp:Content>


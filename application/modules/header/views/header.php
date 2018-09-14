<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>EMedslab - A Complete Pharmacy and Health Solution</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <script type="text/javascript" src="assets/js/jquery-3.2.1.min.js"></script>   
</head>

<body>
 
    <!-- Header -->
    <header class="header">
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 pull-left">
                        <div class="logo">
                            <a title="EmedsLab" href="<?php echo getSiteHost()."home"; ?>"><img alt="emedslab" src="assets/images/emedslab.png" width="308" height="61"></a>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="navbar-collapse collapse" id="navbar">
                            <ul class="nav navbar-nav main-nav pull-right navbar-right">
                                <li><a href=""<?php echo getSiteHost()."home"; ?>"">Home</a></li>
                                
                                <!--<li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="blog.html">Right Sidebar</a></li>
                                        <li><a href="blog-left-sidebar.html">Left Sidebar</a></li>
                                        <li><a href="blog-full-width.html">Full Width</a></li>
                                    </ul>
                                </li> -->
                              
                                <li><a href="<?php echo getSiteHost()."contact"; ?>">Contact Us</a></li>
                                
                                <li><a class="btn btn-primary appoint-btn" href="<?php echo getSiteHost()."contact"; ?>">Appointment</a></li>
                                <?php if($this->session->userdata('user_id') > 0) { ?>
                                   <li><a href="<?php echo getSiteHost()."contact"; ?>"><?php echo "Welcome ".$this->session->userdata('firstname'); ?></a></li>
                                   <li class="dropdown">
                                        <a class="dropdown-toggle " data-toggle="dropdown"><i class="fa fa-users"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<?php echo getSiteHost()."logout"; ?>">Logout</a></li>
                                        </ul>
                                    </li>
                                <?php } else { ?>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle " data-toggle="dropdown"><i class="fa fa-users"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="<?php echo getSiteHost()."login"; ?>">Login</a></li>
                                            <li><a href="<?php echo getSiteHost()."register"; ?>">Register</a></li>
                                            <li><a href="<?php echo getSiteHost()."forgotpwd"; ?>">Forgot Password</a></li>
                                            <!--<li><a href="404.html">404</a></li>-->
                                        </ul>
                                    </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Mobile Header -->
    <header class="mobile-header">
        <div class="panel-control-left"><a class="toggle-menu" href="#side_menu"><i class="fa fa-bars"></i></a></div>
        <div class="page_title">
            <a href="<?php echo getSiteHost()."home"; ?>"><img src="assets/images/emedslab.png" alt="emedslab" class="img-responsive" width="60" height="60"></a>
        </div>
    </header>

    <!-- Mobile Sidebar -->
    <div class="sidebar sidebar-menu" id="side_menu">
        <div class="sidebar-inner slimscroll">
            <a id="close_menu" href="#"><i class="fa fa-close"></i></a>
            <ul class="mobile-menu-wrapper" style="display: block;">
                <li>
                    <div class="mobile-menu-item clearfix">
                        <a href="<?php echo getSiteHost()."home"; ?>">Home</a>
                    </div>
                </li>
<!--                <li>
                    <div class="mobile-menu-item clearfix">
                        <a href="">Blog <i class="fa fa-chevron-down menu-toggle"></i></a>
                    </div>
                    <ul class="mobile-submenu-wrapper" style="display: none;">
                        <li><a href="#">Right Sidebar</a></li>
                        <li><a href="#">Left Sidebar</a></li>
                        <li><a href="blog-full-width.html">Full Width</a></li>
                        <li><a href="blog-grid.html">Blog Grid</a></li>
                        <li><a href="blog-details.html">Blog Details</a></li>
                    </ul>
                </li>-->
                
                <li class="active">
                    <div class="mobile-menu-item clearfix">
                        <a href="<?php echo getSiteHost()."login"; ?>">Login</a>
                    </div>
                </li>
                <li>
                    <div class="mobile-menu-item clearfix">
                        <a href="<?php echo getSiteHost()."register"; ?>"">Register</a>
                    </div>
                </li>
                <li>
                    <div class="mobile-menu-item clearfix">
                        <a href="<?php echo getSiteHost()."forgotpwd"; ?>">Forgot Password</a>
                    </div>
                </li>
                <li>
                    <div class="mobile-menu-item clearfix">
                        <a href="<?php echo getSiteHost()."contact"; ?>">Contact Us</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
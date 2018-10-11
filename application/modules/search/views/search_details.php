<?php
         $this->load->view('header/header');
?>  


 <!-- Content -->
    <div class="main-content">

        <!-- Page Header -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title">
                            <span><?php echo $store_name;?></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 doctor-sidebar">
                        <div class="doctor-list doctor-view">
                            <div class="doctor-inner">
                                <img class="img-responsive" alt="" src="assets/images/emedslab.png">
                                <div class="doctor-details">
                                    <div class="doctor-info">
                                        <h4 class="doctor-name"><?php echo $owner_name; ?></h4>
                                        <p><span class="depart">Category</span></p>
                                    </div>
                                    <ul class="social-list">
                                        <li><a class="facebook" href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a class="twitter" href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a class="phone" href="tel:<?php $phone?>"><i class="fa fa-phone"></i></a></li>
                                        <!--<li><a class="g-plus" href="#"><i class="fa fa-google-plus"></i></a></li>-->
                                    </ul>
                                    <div class="book-appointment">
                                        <a href="#">Upload Prescription</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <div class="about-doctor">
                            <h3 class="sub-title">About the Store</h3>
                            <p>Store Description..............</p>
                        </div>
                        <div class="experience-widget">
                            <h3 class="sub-title">Other Details</h3>
                            <div class="experience-box">
                                <ul class="experience-list">
                                    <li>
                                        <div class="timeline-content">
                                            <h4>Address</h4>
                                            <div>GGN</div>
                                        </div>
                                    </li>
<!--                                    <li>
                                        <div class="timeline-content">
                                            <h4>Health Center Hospital - USA (2012 to 2016)</h4>
                                            <div>Lorem ipsum dolor sit amet</div>
                                        </div>
                                    </li>-->
                                </ul>
                            </div>
                        </div>
<!--                        <div class="education-widget">
                            <h3 class="sub-title">Education Informations</h3>
                            <div class="experience-box">
                                <ul class="experience-list">
                                    <li>
                                        <div class="timeline-content">
                                            <h4>International College of Medical Science (PG) (2003 to 2008)</h4>
                                            <div>FDS</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="timeline-content">
                                            <h4>International College of Medical Science (UG) (2000 to 2003)</h4>
                                            <div>MBBS</div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php
    $this->load->view('footer/footer');
?>

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
                            <span>Our Store</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section-header text-center">
                            <h3 class="header-title">These store exist in your neighborhood's</h3>
							<div class="line"></div>
                        </div>
                    </div>
                </div>
                       
                <div class="row doctors-list">
                    <?php foreach ($data as $store) { ?> 
                     
                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
                        <div class="doctor-list">
                            <div class="doctor-inner">
                                <img class="img-responsive" alt="" src="assets/images/emedslab.png">
                                <div class="doctor-details">
                                    <div class="doctor-info">
                                        <h4 class="doctor-name"><a href=""><?php echo $store->store_name; ?></a></h4>
                                        <p><span class="depart">Physical Therapist</span></p>
                                    </div>
                                    <ul class="social-list">
                                        <li><a class="facebook" href="mailto:<?php echo $store->email;?>"><i class="fas fa-envelope-square"></i></a>
                                        <li><a class="phone" href="tel:<?php echo $store->phone;?>"><i class="fa fa-phone"></i></a></li>
                                        <!--<li><a class="g-plus" href="#"><i class="fa fa-google-plus"></i></a></li>-->
                                    </ul>
                                    <div class="view-profie">
                                        <a href="search_details?id=<?php echo $store->store_id; ?>">View Profile</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
<!--                <div class="row">
                    <div class="col-xs-12 text-center">
                        <a href="#" class="btn btn-primary load-more">Load More</a>
                    </div>
                </div>-->
            </div> 
        </div>
    </div>

 <?php
    $this->load->view('footer/footer');

    ?>
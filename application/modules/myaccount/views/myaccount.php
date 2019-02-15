

     <?php
             $this->load->view('header/header');
            ?>   


        <!-- Bootstrap -->
         <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
     
        <link rel="stylesheet" type="text/css" href="assets/css/custom.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/nprogress.css">
          
      </head>
        <br>
      <body class="nav-md">
        <div class="container body">
          <div class="main_container">
            <div class="right_col" role="main">
              <div class="">
            
                
        <div class="au-breadcrumb-left">
                                          
            <ul class="list-unstyled list-inline au-breadcrumb__list">
            <li class="list-inline-item active"><a href="store/Home">Home</a>
                                                </li>
                                                <li class="list-inline-item seprate">
                                                    <span>/</span>
                                                </li>
                                                <li class="list-inline-item">Update Profile</li>
                                            </ul>
                                </div>

                <div class="row">
           
                  <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
           
                      <div class="x_content">


                        <!-- Smart Wizard -->
                       <div></div>
                        <div id="wizard" class="form_wizard wizard_horizontal">
                    
                          <div id="step-1">
                            <form class="form-horizontal form-label-left">
                            <?php foreach ($result as $key => $value) {?>
                               
                          
                              <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">First Name <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input type="text" id="first-name" required="required" value="<?php print_r($value->firstname)?>" class="form-control col-md-7 col-xs-12">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Last Name <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input type="text" id="last-name" name="last-name" value="<?php print_r($value->lastname)?>"  class="form-control col-md-7 col-xs-12">
                                </div>
                              </div>
                              <div class="form-group">
                                <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">E-mail *</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input id="middle-name" class="form-control col-md-7 col-xs-12" value="<?php print_r($value->email);?>" type="text" name="middle-name">
                                </div>


                              </div>
                               <div class="form-group">
                                <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Mobile Number *</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input id="middle-name" class="form-control col-md-7 col-xs-12"  value="<?php print_r($value->phone);?>" type="text" name="middle-name">
                                </div>


                              </div><?php  } ?>
                             </form>
                          </div> 
                         <a href="#" class="buttonNext btn btn-success">Update</a>  <a href="/home" class="buttonNext btn btn-success">Cancle</a>

                        </div>
                       </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>   
      </body>
    </html>
     <?php
        $this->load->view('footer/footer');

    ?>


4188,8794,8054,7303,7293,6294
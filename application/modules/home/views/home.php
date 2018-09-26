<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('header/header');
?>
<link href="assets/css/css/styles.css" rel="stylesheet">
<div id="wrapper">

      <div id="page-content-wrapper">
       
        <div class="jumbotron" style="padding-top: 82px;">
            <div class="jumb-layer"></div>
            <input type="hidden" name="msg" id="msg" value="">

            <div class="container">
                    <h1>EXPLORE PHARMACY IN YOUR CITY</h1>
                    <p >Find Pharmacy Store in Your NeighbourHoods.<br>You can get your prescribed medicine's at your door step with cash on delivery option.</p>
                    <br>
                <div class="search-box container">
                 <span class="med_search_loader" style="display: none;"><img src="assets/images/loader1.gif" /></span>
                 <!--    <h3>Search Pharmacy</h3> -->
                    <div class="row-search">
                        <form type="GET" action="storelist"> 
                        <div class="input-group back_ground_loader">

                            <input type="text" id="search_query" name="search_query" class="form-control search_medicine" placeholder="Eg: Enter Pincode" maxlength="6" minlength="6">

                        <span class="input-group-btn">
                            <button class="btn btn-default ripple" type="submit" data-color="#39F2F9">
                           <!--      <i class="fas fa-search-location"></i> -->
                                 <img alt="emedslab" src="assets/images/search-location-solid.svg" width="50" height="50">
                            </button>
                        </span>
                       
                        </div>
                             </form>
                    </div>
                    <div class="alert" id="new_med_status" style="margin: 0 auto;display: none; width: 896px; font-size: 18px">
                    </div>
                </div>
            </div>

        </div>
        <div class="upload-section">
                    <div class="container">
                        <img id="image" style="width: 275px;height: 140px;" />
                        <h3 id="link_to_upload">Upload Your Prescription </br>
                            <center><i class="fas fa-cloud-upload-alt"></i> </center>
                        </h3>
                               
                        <div class="upload-img">
                         <form method="POST" action="uploadFile" id="upload_form" accept-charset="UTF-8" id="upload_form" enctype="multipart/form-data"><input name="_token" type="hidden" value="">
                            <input id="fileToUpload" type="file" id="fileToUpload" name="fileToUpload"  class="prescription-upload" onchange="return fileValidation()">
                            <span  id="uploadSubmit" style="display: none;">   
                                 <center><img alt="emedslab" src="assets/images/file-upload-solid.svg" width="50" height="50" onclick="$('#upload_form').submit();"> </center>
                            </span>
                         </form>
                    </div>
                        
                    </div>
        </div>

    <!-- Cateogory -->
    <div class="app-section">
        <div class="container">
            <h3>HealthCare Product's</h3>
           
            <div class="app-container">
                <div class="app-store-img">
                    <a href="#">
                        <img src="assets/images/coming_soon.jpg" alt="" height="230px;" width="280px;" />
                    </a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            </div>
        </div>
    
    <?php
    $this->load->view('footer/footer');

    ?>

</div>
</div>   

<div id="resultModal" class="modal fade " role="dialog">
   <div class="modal-dialog" style="width: 600px !important;">

     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title" id="res-title"></h4>
       </div>
       <div class="modal-body" style="font-size: 18px; text-align: center" id="res-content">  </div>

     </div>

   </div>
 </div>
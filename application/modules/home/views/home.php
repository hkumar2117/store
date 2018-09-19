<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this->load->view('header/header');
?>
<div id="wrapper">

      <div id="page-content-wrapper">
       
        <div class="jumbotron" style="padding-top: 82px;">
            <div class="jumb-layer"></div>
            <input type="hidden" name="msg" id="msg" value="">

            <div class="container">
                    <h1>EXPLORE PHARMACY IN YOUR CITY</h1>
                     <p >We help you to find Pharmacy, emedslabs.

</p>
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
                    <div class="upload-img"></div>
                         <form method="POST" action="#" accept-charset="UTF-8" id="upload_form" enctype="multipart/form-data"><input name="_token" type="hidden" value="">
                         <input type="hidden" name="_token" value="">
                        <input id="input-20" type="file" name="file"  class="prescription-upload" >
                        <span style="display: none;">   <input type="submit" id="upload">  </span>
                       </form>

                    <h3>Click Here To Upload Your Prescription</h3>

                    <img alt="emedslab" src="assets/images/file-upload-solid.svg" width="308" height="61">
                    </div>
        </div>

    <!-- upload section -->
    <div class="app-section">
        <div class="container">
            <h3>Pharmacy Locate In Your Location</h3>
           
            <div class="app-container">
                <div class="app-store-img">
                    <a href="#">
                        <img src="images/download.jpeg" alt="" />
                    </a>
                </div>
                <div class="app-store-img">
                    <a href="#">
                        <img src="images/ef.jpeg" alt="" />
                    </a>
                </div>
                <div class="clear"></div>
            </div>
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

<link href="assets/css/css/styles.css" rel="stylesheet">
 <script>
      var customLabel = {
        restaurant: {
          label: 'R'
        },
        bar: {
          label: 'B'
        }
      };

        function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: new google.maps.LatLng(-33.863276, 151.207977),
          zoom: 12
        });
        var infoWindow = new google.maps.InfoWindow;

          // Change this depending on the name of your PHP or XML file
          downloadUrl('data.xml', function(data) {
            var xml = data.responseXML;
            var markers = xml.documentElement.getElementsByTagName('marker');
            Array.prototype.forEach.call(markers, function(markerElem) {
              var id = markerElem.getAttribute('id');
              var name = markerElem.getAttribute('name');
              var address = markerElem.getAttribute('address');
              var type = markerElem.getAttribute('type');
              var point = new google.maps.LatLng(
                  parseFloat(markerElem.getAttribute('lat')),
                  parseFloat(markerElem.getAttribute('lng')));

              var infowincontent = document.createElement('div');
              var strong = document.createElement('strong');
              strong.textContent = name
              infowincontent.appendChild(strong);
              infowincontent.appendChild(document.createElement('br'));

              var text = document.createElement('text');
              text.textContent = address
              infowincontent.appendChild(text);
              var icon = customLabel[type] || {};
              var marker = new google.maps.Marker({
                map: map,
                position: point,
                label: icon.label
              });
              marker.addListener('click', function() {
                infoWindow.setContent(infowincontent);
                infoWindow.open(map, marker);
              });
            });
          });
        }



      function downloadUrl(url, callback) {
        var request = window.ActiveXObject ?
            new ActiveXObject('Microsoft.XMLHTTP') :
            new XMLHttpRequest;

        request.onreadystatechange = function() {
          if (request.readyState == 4) {
            request.onreadystatechange = doNothing;
            callback(request, request.status);
          }
        };

        request.open('GET', url, true);
        request.send(null);
      }

      function doNothing() {}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=&callback=initMap">
    </script>
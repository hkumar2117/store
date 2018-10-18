    <?php
             $this->load->view('header/header');
            ?> 
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
    .vertical-menu {
    width: 200px;
}

.vertical-menu a {
    background-color: #eee; 
    color: black; 
    display: block; /* Make the links appear below each other */
    padding: 12px; /* Add some padding */
    text-decoration: none; /* Remove underline from links */
}

.vertical-menu a:hover {
    background-color: #ccc; /* Dark grey background on mouse-over */
}

.vertical-menu a.active {
    background-color: #4CAF50; /* Add a green color to the "active/current" link */
    color: white;
}
</style>

<div class="container">
  <div class="vertical-menu" style="padding:20px;
                float:left;">
  <a href="home" class="active">Home</a>
  <a href="myaccount">My Account</a>
  <a href="prescription">Order History</a>
  <a href="#">Address</a>
  <a href="#"></a>
</div>
      <h2>Order</h2>                                                                                   
      <div class="table-responsive">          
      <table class="table">
        <thead>
          <tr>
            <th>Order ID</th>
            <th>Name</th>
            <th>prescription</th>
            <th>Address</th>
             <th>Date</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead><?php
        foreach ($result as $value) {
        if(!empty($value->id)){?>
             <td><?php print_r($value->id); ?></td>
             <td><?php print_r($value->id); ?></td>
             <td><img src="<?php print_r($value->prescription); ?>" width="100px" height="61"></td>
             <td><?php print_r($value->id); ?></td>
             <td><?php print_r($value->time); ?></td>
             <td><?php print_r($value->id); ?></td>
             <td> <button type="button" class="btn">View</button> <button type="button" class="btn">Cancel</button></td>
        <?php }
     if(empty($value->id)) {?> <span>
        <?php echo "No order found !!"; ?></span>
       
   <?php
    } 
 
    }
   ?>
     
        
      </table>
      </div>
    </div>



    <?php
        $this->load->view('footer/footer');
    ?>
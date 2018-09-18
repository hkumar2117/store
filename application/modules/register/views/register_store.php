<?php
         $this->load->view('header/header');
        ?>   
<div class="main-content account-content">
        <div class="content">
            <div class="container">
                <div class="account-box">
                    <form class="form-signin" action="register/save_store" method="post">
                        <div class="account-title">
                            <h3>Register</h3>
                        </div>
                        <div class="form-group">
                            <label>Store Name</label>
                            <input class="form-control" type="text" name="name" id="name" required="" autofocus>
                        </div>
                        <div class="form-group">
                            <label>Store Email</label>
                            <input class="form-control" type="email" name="email" id="email" required="">
                        </div>
                        <div class="form-group">
                            <label>Store Phone Number</label>
                            <input class="form-control" type="text" name="phone" id="phone" required="" maxlength="10" oninput="this.value=this.value.replace(/[^0-9]/g,'');">
                        </div>
                        <div class="form-group">
                            <label>Store Pincode</label>
                            <input class="form-control" type="text" name="zipcode" id="zipcode" required="" minlength="6" maxlength="6" oninput="this.value=this.value.replace(/[^0-9]/g,'');">
                        </div> 
                        
                        <div class="form-group checkbox">
                            <label>
                                <input type="checkbox" name="T&C" id="is_checked" required=""> <a href="<?php echo getSiteHost()."terms_and_condition";?>">I have read and agree the Terms &amp; Conditions </a>
                            </label>
                        </div>
                        <div class="form-group text-center">
                            <button class="btn btn-primary account-btn" type="submit">Signup</button>
                        </div>
                        <div class="text-center login-link">
                            Already have an account? <a href="<?php echo getSiteHost()."login";?>">Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
 <?php
    $this->load->view('footer/footer');

?>


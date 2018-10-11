<?php
         $this->load->view('header/header');
        ?> 
<div class="main-content account-content">
        <div class="content">
            <div class="container">
                <div class="account-box">
                    <form class="form-signin" action="#">
                        <div class="account-title">
                            <h3>Forgot Password</h3>
                        </div>
                        <div class="form-group">
                            <label>Enter Your Email</label>
                            <input type="text" class="form-control" autofocus>
                        </div>
                        <div class="form-group text-center">
                            <button class="btn btn-primary account-btn" type="submit">Reset Password</button>
                        </div>
                        <div class="text-center register-link">
                            <a href="<?php echo base_url("login"); ?>">Back to Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<?php
    $this->load->view('footer/footer');
?>
 <?php
         $this->load->view('header/header');
        ?>   
<div class="main-content account-content">
        <div class="content">
            <div class="container">
                <div class="account-box">
                    <form class="form-signin" action="#">
                        <div class="account-title">
                            <h3>Login</h3>
                        </div>
                        <div class="form-group">
                            <label>Username or Email</label>
                            <input type="text" class="form-control" autofocus>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control">
                        </div>
                        <div class="form-group text-right">
                            <a href="<?php echo base_url("forgotpwd");?>">Forgot your password?</a>
                        </div>
                        <div class="form-group text-center">
                            <button class="btn btn-primary account-btn" type="submit">Login</button>
                        </div>
                        <div class="text-center register-link">
                            Don’t have an account? <a href="<?php echo base_url("register");?>">Register Now</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
 <?php
    $this->load->view('footer/footer');

    ?>
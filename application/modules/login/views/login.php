 <?php
         $this->load->view('header/header');
//         die($error . "---".$message);
        ?>   
<div class="main-content account-content">
        <div class="content">
            <div class="container">
                <div class="account-box">
                    <form class="form-signin" action="login/login_as_customer" method="POST">
                        <div class="account-title">
                            <h3>Login</h3>
                        </div>
                        <div class="form-group">
                            <label>Username or Email</label>
                            <input type="email" name="user_email" id="user_email" class="form-control" autofocus required="" onchange="is_unique_email()">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" id="password" class="form-control" required="" minlength="6">
                            <span class="error-box" <?php if( $error == 0 ){ echo "style='display: none;'"; } ?>><?php echo $message; ?></span>
                        </div>
                        <div class="form-group text-right">
                            <a href="<?php echo getSiteHost()."forgotpwd";?>">Forgot your password?</a>
                        </div>
                        <div class="form-group text-center">
                            <button class="btn btn-primary account-btn" type="submit">Login</button>
                        </div>
                        <div class="text-center register-link">
                            Don’t have an account? <a href="<?php echo getSiteHost()."register";?>">Register Now</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> 
 <?php
    $this->load->view('footer/footer');
 ?>
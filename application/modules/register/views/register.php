 <?php
         $this->load->view('header/header');
        ?>   
<div class="main-content account-content">
        <div class="content">
            <div class="container">
                <div class="account-box">
                    <form class="form-signin" action="#">
                        <div class="account-title">
                            <h3>Register</h3>
                        </div>
                        <div class="form-group">
                            <label>First Name</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input class="form-control" type="email">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input class="form-control" type="password">
                        </div>
                        <div class="form-group">
                            <label>Mobile Number</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group checkbox">
                            <label>
                                <input type="checkbox"> I have read and agree the Terms &amp; Conditions
                            </label>
                        </div>
                        <div class="form-group text-center">
                            <button class="btn btn-primary account-btn" type="submit">Signup</button>
                        </div>
                        <div class="text-center login-link">
                            Already have an account? <a href="login.html">Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
 <?php
    $this->load->view('footer/footer');

?>

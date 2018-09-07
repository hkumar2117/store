<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends MY_Controller {
        
        public function index(){
            $this->load->view('header/header');
            $this->load->view('register/register');
            $this->load->view('footer/footer');
	    }            
}

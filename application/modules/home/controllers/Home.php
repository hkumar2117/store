<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {
        
        public function index(){
            $this->load->view('home/home');
        }
        public function contact(){
            $this->load->view('home/contact');
        }
         public function forgotpwd(){
            $this->load->view('home/forgotpwd');
        }
}

<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {
        
        public function index(){
            if($this->session->userdata('user_id') > 0){
                $data = array();
                $data["username"] = $this->session->userdata('firstname')." ".$this->session->userdata('lastname');
                $data["email"] = $this->session->userdata('email');
                $data['phone'] = $this->session->userdata('email');
                $this->load->view('home/home',$data);
            } else {
                $this->load->view('home/home');
            }
        }
        public function contact(){
            $this->load->view('home/contact');
        }
        public function forgotpwd(){
            $this->load->view('home/forgotpwd');
        }
       
}

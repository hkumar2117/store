<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Myaccount extends MY_Controller {
        
        public function index(){
            if($this->session->userdata('user_id') == '') {
               $this->load->view('myaccount/myaccount');
            } else {
                redirect('login', 'refresh');
            }
        } 
       
}

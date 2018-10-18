<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Myorder extends MY_Controller {
        
        public function myorder(){ 
            if($this->session->userdata('user_id') == '') {
               $this->load->view('myorder/myorder');
            } else {
                redirect('login', 'refresh');
            }
        } 
       
}

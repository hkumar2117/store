<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Myaccount extends MY_Controller {
        
        public function index(){
        	 $this->load->database();
	         $sql = "SELECT * from pharmacy_users where user_id =".$this->session->userdata['user_id'];
	         $query = $this->db->query($sql);
	         $data = array();
	         $data['result'] = $query->result();
            if($this->session->userdata('user_id') != '') {
               $this->load->view('myaccount/myaccount',$data);
            } else {
                redirect('login', 'refresh');
            }
        } 
       
}

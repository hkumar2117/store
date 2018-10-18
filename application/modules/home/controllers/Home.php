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
        
        public function uploadFile(){
             $result = uploadFile();
             if($this->session->userdata('user_id') > 0){
             if($result['flag'] ==1){
                 $this->load->view('home/uploadFile');
                    
             } else {
               echo "prescription already uploaded !!";
             }
         }else{
             $this->load->view('login/login');
         }
        }
         public function prescription(){
         $this->load->database();
         $sql = "SELECT * from prescription where user_id =".$this->session->userdata['user_id'];
         $query = $this->db->query($sql);
         $data = array();
         $data['result'] = $query->result();
          if($this->session->userdata('user_id') > 0){
          $this->load->view('home/prescription',$data);
        }else{
             redirect('register_store', 'refresh');
        }
       
    }
        
    
}

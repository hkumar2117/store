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
                 $this->generatePrescriptionOrder($result);
                 $this->load->view('home/uploadFile');
            } else {
               echo "prescription already uploaded !!";
            }
          } else{
             $this->load->view('login/login');
         }
        }
       
        private function generatePrescriptionOrder($params){
            $this->load->database();
            $data = array(
                'user_id' => $this->session->userdata('user_id'),
                'prescription' => $params['file'],
            );
            $prescription_id = $this->db->insert('pharma_orders', $data);
            
            
            
        }
        
        private function createOrder($params){
             $this->load->database();
            $data = array(
                'user_id' => $this->session->userdata('user_id'),
                'prescription' => $p_info,
            );
            $prescription_id = $this->db->insert('pharma_orders', $data);
        }
}
        


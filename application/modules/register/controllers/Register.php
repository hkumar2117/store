<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends MY_Controller {
        
        public function index(){
            if($this->session->userdata('user_id') == '') {
               $this->load->view('register/register');
            } else {
                redirect('home', 'refresh');
            }
        } 
        public function add_customer(){
            $this->load->database();
            $params = $this->input->post(); 
            if(!empty($params) && $this->is_email_exist($params['email']) && $this->is_phone_exist($params['phone'])) {
                $name = split(" ", $params[name]);
                $data = array(
                   'firstname' => $name[0],
                   'lastname' => $name[1],
                   'email'=>$params['email'],
                   'phone'=>$params['phone'],
                   'password'=>  md5($params['password']),
                   'status' => "A",
                   'user_type' => 'C',
                   'last_passwords' => md5($params['password']),
                   'app_agreement' => 'Y',
                );
                $user_id = $this->db->insert('pharmacy_users',$data);
                $fwdPage = $user_id > 0 ? "login" : "register";
                redirect($fwdPage, 'refresh');    
            } else {
                echo USER_REGISTER_ERROR; exit;
            }   
        }
        public function is_email_exist($email){
             $this->load->database();
             $sql = "SELECT user_id from pharmacy_users where email=? and status='A'";
                $query = $this->db->query($sql,array($email));
                
                if(empty($query->result())) {
                     return TRUE;
                } else {
                     return FALSE;
                }
        }
        public function is_phone_exist($phone){
                $this->load->database();
                $sql = "SELECT user_id from pharmacy_users where phone=? and status='A'";
                $query = $this->db->query($sql,array($phone));
                if(empty($query->result())){
                     return TRUE;
                } else {
                     return FALSE;
                }
        }
        private function terms_and_condition(){
            $this->load->view('register/terms_and_condition');
        }
        
}

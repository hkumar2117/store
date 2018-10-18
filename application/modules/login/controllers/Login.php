<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

	
        public function index(){
            if($this->session->userdata('user_id') == ''){
                $data = array();
                $params = $this->input->get(); 
                
                $data['error'] = isset($params['error'])? 1 : 0;
                $data['message'] = isset($params['message']) ? $params['message'] : '';
                 
                $this->load->view('login/login',$data);
            } else {
                header("Location: home");
            }
        }
	public function login_as_customer(){
            $this->load->database();
            $error= array( );
            $params = $this->input->post(); 
            $error = 0; $message = '';
            $data =array();
            if(isset($params)) {
                $sql = "SELECT user_id,status,user_type,store_id,last_login,firstname,lastname,email,gender,phone,email_verify "
                        . " from pharmacy_users where email=? and password=?";
                $query = $this->db->query($sql,array($params['user_email'], md5($params['password'])));
                if($query->result()) {
                     foreach ($query->result() as $row){
                        if(($row->user_type == 'C' || $row->user_type == 'S') && $row-> status == 'A'){
                             $this->prepare_consumer_session($row);
                             if($this->session->userdata('user_id') > 0){
                                 $redirect = ($row->user_type == 'C') ? 'home' : 'seller';
                                 redirect($redirect, 'refresh');
                             } else {
                                 $error =1;
                                 $message = "Error : Unable to created a user session";
                             }
                         } else {
                             $error =1;
                             $message = USER_BLOCKED;
                         } 
                     }
                } else {
                    $error =1;
                    $message = INVALID_USER_DETAILS;
                }
                $data['error'] = $error;
                $data['message'] = $message;
                redirect("login?error=".$error."&message=".$message, 'refresh');
            }
        }
         
        
         private function prepare_consumer_session($userData){
                $url = "";
                setcookie($this->config->item('sess_cookie_name'), session_id(),time()+8*60*60,$this->config->item('cookie_path'));
                $sessionData = array("user_id" => $userData->user_id,"username" => $userData->firstname,
                                     "store_id" => $userData->store_id,"gender" => $userData->gender,
                                     "email" => $userData->email,"phone" => $userData->phone,"email_verify" => $userData->email_verify); 
                $this->session->set_userdata($sessionData);
                return true;
        }
        
        public function logout(){
            $newdata = array(
                'user_name'  =>'',
                'user_email' => '',
                'logged_in' => FALSE,
               );
            $this->session->unset_userdata($newdata);
            $this->session->sess_destroy();
            redirect('login', 'refresh');
        }       
               
}

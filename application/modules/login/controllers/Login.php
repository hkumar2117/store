<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

	
        public function index(){
            if($this->session->userdata('user_id') == ''){
                $this->load->view('login/login');
            } else {
                header("Location: home");
            }
        }
	public function login_as_customer(){
            $this->load->database();
            $params = $this->input->post(); 
            
            if(isset($params)) {
                $sql = "SELECT user_id,status,user_type,store_id,last_login,firstname,lastname,email,gender,phone,email_verify "
                        . " from pharmacy_users where email=? and password=?";
                $query = $this->db->query($sql,array($params['user_email'], md5($params['password'])));
                if($query->result()) {
                     foreach ($query->result() as $row){
                        if($row->user_type == 'C' && $row-> status == 'A'){
                             $this->prepare_consumer_session($row);
                             if($this->session->userdata('user_id') > 0){
                                 redirect('home', 'refresh');
                             } else {
                                 echo "Error : Unable to created a user session";
                             }
                         } else {
                             echo USER_BLOCKED;exit;
                         } 
                     }
                } else {
                    echo INVALID_USER_DETAILS;exit;
                }
                $this->db->close();
                exit;
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

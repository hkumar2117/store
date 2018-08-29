<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

	
        public function index(){
            $this->load->view('header/header');
            $this->load->view('login/login');
            $this->load->view('footer/footer');
	    }
	    
        /*private function getAccessToken($params,$flag = FALSE){
	        $services_auth_param =$this->config->item('soa_api_loginToken_params');
	        $fields = array(
	                'username' => $params['email'],
	                'password' => $flag == FALSE ? md5($params['password']) : $params['password'],
	                'client_id' => $services_auth_param['client_id'],
	                'client_secret' => $services_auth_param['client_secret'],
	                'grant_type' => $services_auth_param['grant_type']
	            );

	        $ch = curl_init();
	        curl_setopt($ch, CURLOPT_URL, $services_auth_param['url']);
	        curl_setopt($ch, CURLOPT_POST, true);
	        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
                curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
	        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	        $data = curl_exec($ch);
	        if (curl_errno($ch)) {
	            curl_close($ch);
	            return 0;
	        } else {
	            $data = json_decode($data, true);
	            if(!empty($data['access_token'])){
	                curl_close($ch);
	                return $data['access_token'];
	            }else{
	               return 0;
	            }
	        }
	    }
            
        private function getGenericAccessToken(){
                $current_time=TIME();
	        $services_auth_param =$this->config->item('soa_api_genericToken_params');
	        $fields = array(
	                'client_id' => $services_auth_param['client_id'],
	                'client_secret' => $services_auth_param['client_secret'],
	                'grant_type' => $services_auth_param['grant_type']
	            );

	        $ch = curl_init();
	        curl_setopt($ch, CURLOPT_URL, $services_auth_param['url']);
	        curl_setopt($ch, CURLOPT_POST, true);
	        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
                curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
	        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	        $data = curl_exec($ch);
	        if (curl_errno($ch)) {
	            curl_close($ch);
	            return 0;
	        } else {
	            $data = json_decode($data, true);
	            if(!empty($data['access_token'])){
	                curl_close($ch);
	                return $data['access_token'];
	            }else{
	               return 0;
	            }
	        }
	    } */
            
}

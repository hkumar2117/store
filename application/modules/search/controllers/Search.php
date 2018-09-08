<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Search extends MY_Controller {
        
        public function index(){
            $this->load->view('search/search');
        }  
        public function storelist(){
            $this->load->view('search/search_details');
        }  
}


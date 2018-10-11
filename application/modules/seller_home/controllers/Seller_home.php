<?php


defined('BASEPATH') OR exit('No direct script access allowed');

class Seller_home extends MY_Controller {
     public function index() {
        if ($this->session->userdata('store_id') != '') {
            $this->load->view('seller_home/home');
        } else {
            redirect('home', 'refresh');
        }
    }
}


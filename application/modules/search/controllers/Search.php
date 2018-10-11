<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Search extends MY_Controller {

    public function index() {
        $this->load->view('search/search');
    }

    public function storelist() {
        $this->load->database();
        $params = $this->input->get();
        $sql = "SELECT store_id,store_name,zipcode,email,phone,lat,lng,is_cod from pharma_store where zipcode=? and status='A'";
        $query = $this->db->query($sql, array($params['search_query']));
        $data = array();
        if ($query->result()) {
            $counter=0;
            foreach ($query->result() as $row => $val) {
                   $data[$row] = $val;
            }
        }
        $this->load->view('search/search',array("data" => $data));
    }
    public function storedetails() {
        $this->load->database();
        $params = $this->input->get();
        $sql = "SELECT store_id,store_name,zipcode,email,phone,lat,lng,is_cod from pharma_store where store_id=?";
        $query = $this->db->query($sql, array($params['id']));
        $data = array();
        if ($query->result()) {
            $counter=0;
            foreach ($query->result() as $row) {
                   $data['storename'] = $row->store_name;
                   $data['phone'] = $row->phone;
                   $data['owner_name'] = $row->name;
            }
        }
        $this->load->view('search/search',array("data" => $data));
    }

}

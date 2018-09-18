<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends MY_Controller {

    public function index() {
        if ($this->session->userdata('user_id') == '') {
            $this->load->view('register/register');
        } else {
            redirect('home', 'refresh');
        }
    }

    public function add_customer() {
        $this->load->database();
        $params = $this->input->post();
        if (!empty($params) && $this->is_email_exist($params['email']) && $this->is_phone_exist($params['phone'])) {
            $name = explode(" ", $params[name]);
            $data = array(
                'firstname' => $name[0],
                'lastname' => $name[1] == '' ? '' : $name[1],
                'email' => $params['email'],
                'phone' => $params['phone'],
                'password' => md5($params['password']),
                'status' => "A",
                'user_type' => 'C',
                'last_passwords' => md5($params['password']),
                'app_agreement' => 'Y',
            );
            $user_id = $this->db->insert('pharmacy_users', $data);
            $fwdPage = $user_id > 0 ? "login" : "register";
            redirect($fwdPage, 'refresh');
        } else {
            echo USER_REGISTER_ERROR;
            exit;
        }
    }

    public function register_store() {
        if ($this->session->userdata('user_id') == '') {
            redirect('login', 'refresh');
        } else {
            $this->load->view('register/register_store');
        }
    }

    public function save_store() {
        $this->load->database();
        $params = $this->input->post();
        if (!empty($params)) {
            $data = array(
                'store_name' => $params['name'],
                'email' => $params['email'],
                'key_email' => $params['email'],
                'phone' => $params['phone'],
                'zipcode' => $params['zipcode'],
                'status' => "P",
                'terms' => 'Y',
                'lang_code' => "EN",
                'timestamp' => "unix_timestamp(now())",
                'user_accepted_name' => $params['name'],
                'user_accepted_date' => 'now()',
                'is_cod' => "1",
                'country' => "IN"
            );
            $store_id = $this->db->insert('pharma_store', $data);
            //Map store to User & change type as well
            $this->db->set('store_id', $store_id);
            $this->db->set('user_type', "S");
            $this->db->where('user_id', $this->session->userdata('user_id'));
            $this->db->update('pharmacy_users');
            //Insert entry in bank table
            $bank_id = $this->db->insert('store_bank_details', array('store_id' => $store_id));
            $store_loc = $this->db->insert('store_warehouse_location', array('store_id' => $store_id, 'warehouse_pin' => $params['zipcode'], 'store_name' => $params['name']));
            redirect('seller', 'refresh');
        } else {
            redirect('register_store', 'refresh');
        }
    }

    public function is_email_exist($email) {
        $this->load->database();
        $sql = "SELECT user_id from pharmacy_users where email=? and status='A'";
        $query = $this->db->query($sql, array($email));

        if (empty($query->result())) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function is_phone_exist($phone) {
        $this->load->database();
        $sql = "SELECT user_id from pharmacy_users where phone=? and status='A'";
        $query = $this->db->query($sql, array($phone));
        if (empty($query->result())) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    private function terms_and_condition() {
        $this->load->view('register/terms_and_condition');
    }

}

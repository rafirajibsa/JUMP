<?php
class Page extends CI_Controller{
	function __construct(){
		parent::__construct();

		$this->load->library('datatables'); //load library ignited-dataTable
		$this->load->model('page_model'); //load model crud_model

		//validasi jika user belum login
		if($this->session->userdata('masuk') != TRUE){
			$url=base_url();
			redirect($url);
		}
	}

	function index(){
		//Allowing akses to admin only
		if($this->session->userdata('akses')=='1'){
			$this->load->view('admindashboard_view');
		}else{
			echo "Anda tidak berhak mengakses halaman ini";
		}

	}

	function forpass (){
		//Forgot Password View
		$this->load->view('forgotpassword_view');
	}


	function home(){
		//Allowing akses to user only
		if($this->session->userdata('akses')=='2'){
			$this->load->view('home_view');
		}else{
			echo "Anda tidak berhak mengakses halaman ini";
		}
	}




}

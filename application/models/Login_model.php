<?php
class Login_model extends CI_Model{
	//cek data login admin
	function auth_admin($username,$password){
		$query=$this->db->query("SELECT * FROM admin_table WHERE username='$username' AND admin_password=MD5('$password') LIMIT 1");
		return $query;
	}

	//cek data login user
	function auth_user($username,$password){
		$query=$this->db->query("SELECT * FROM user_table WHERE user_name='$username' AND user_password=MD5('$password') LIMIT 1");
		return $query;
	}

}

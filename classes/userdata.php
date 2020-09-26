<?php
class UserData extends DataBase
{

	function authorize($login, $pass)
	{
		$userlogin = filter_var($login, FILTER_SANITIZE_STRING);

		$query = $this->run("SELECT * FROM `users` WHERE user_login='" . $login . "';");
		$password = $query[0]["user_password"];

		if ($pass != $password || empty($password)) {
			return false;
		} else {
			$_SESSION["user"] = $query[0]['user_login'];
			$_SESSION["role"] = $query[0]['user_role'];
			return true;
		}
	}
}

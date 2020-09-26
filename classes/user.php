<?php

class User
{

	public static function isAdmin()
	{
		if (isset($_SESSION["role"]) && $_SESSION["role"] < 9)
			return true;
	}

	public static function isLogged()
	{
		if (isset($_SESSION["role"]))
			return true;
	}

	public static function isFlooder()
	{
		if (empty($_SESSION['flood'])) $_SESSION['flood'] = 0;
		if ($_SESSION['flood'] < 10) return true;
	}

	public static function flood()
	{
		if ($_SESSION['user_agent'] == $_SERVER['HTTP_USER_AGENT'] && $_SESSION['user_ip'] == $_SERVER['REMOTE_ADDR']) $_SESSION['flood']++;

		$_SESSION['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
		$_SESSION['user_ip'] = $_SERVER['REMOTE_ADDR'];
	}
}

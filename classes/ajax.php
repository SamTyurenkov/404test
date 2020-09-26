<?php

class Ajax
{
	function __construct()
	{
		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			$method = $_POST["method"];
		} else if ($_SERVER['REQUEST_METHOD'] === 'GET') {
			$method = $_GET["method"];
		} else {
			$this->exitajax('Only POST and GET are allowed');
		}
		if (method_exists($this, $method)) {
			$this->$method();
		} else {
			$this->exitajax('method does not exist');
		}
	}

	public function exitajax(string $info = 'fail', $data = null)
	{
		header('Content-Type: application/json');
		$response = array();
		$response['info'] = $info;
		$response['data'] = $data;
		echo json_encode($response, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
		die();
	}

	public function ajaxlogin()
	{

		if (isset($_POST["login"]) && isset($_POST["pass"])) {
			$login = $_POST["login"];
			$pass = $_POST["pass"];
		} else {
			$this->exitajax();
		}

		$userdata = new UserData();
		$result = $userdata->authorize($login, $pass);
		if ($result == false) $this->exitajax();

		$this->exitajax('success');
	}

	public function ajaxlogout()
	{

		$_SESSION = array();

		if (ini_get("session.use_cookies")) {
			$params = session_get_cookie_params();
			setcookie(
				session_name(),
				'',
				time() - 42000,
				$params["path"],
				$params["domain"],
				$params["secure"],
				$params["httponly"]
			);
		}
		session_destroy();

		$this->exitajax('success');
	}

	public function ajaxaddlink()
	{
		if (!User::isAdmin()) $this->exitajax(' Доступно только Админам');

		$response = array();

		if (filter_var($_POST["url"], FILTER_VALIDATE_URL)) {
			$url = $_POST["url"];
		} else {
			$this->exitajax('Укажите протокол и/или домен');
		}

		$linkdata = new LinkData();
		$link = $linkdata->addLink($url);
		if ($link == false) $this->exitajax('Ошибка добавления в базу');

		$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";

		$this->exitajax('success', $protocol . $_SERVER['SERVER_NAME'] . '/' . $link);
	}

	public function ajaxgetlink()
	{
		header('Content-Type: application/json');
		$response = array();

		if (!isset($_GET["hash"]))
			$this->exitajax();

		$linkdata = new LinkData();
		$link = $linkdata->getLink($_GET["hash"]);

		if ($link == false) $this->exitajax();

		$this->exitajax('success', $link);
	}
}

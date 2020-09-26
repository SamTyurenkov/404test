<?php
session_start();
session_set_cookie_params(3600);
function loadClasses($class)
{
    $path = __DIR__ . '/classes/';
    require_once $path . strtolower($class) . '.php';
}

spl_autoload_register('loadClasses');

$route = new Router();
$route->request($_SERVER['REQUEST_URI']);

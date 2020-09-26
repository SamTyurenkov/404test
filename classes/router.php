<?php

class Router
{

    function request($request)
    {

        $docroot = $_SERVER['DOCUMENT_ROOT'];

        switch ($request) {
            case '/':
            case '':
                require $docroot . '/views/main.php';
                break;
            case '/ajax':
            case '/ajax/':
                require $docroot . '/views/ajax.php';
                break;
            default:
                $hash = str_replace('/', '', $request);
                $linkdata = new LinkData();
                $link = $linkdata->getLink($hash);
                if ($link == false && User::isFlooder()) {
                    $_SESSION['flood']++;
                    http_response_code(404);
                    require $docroot . '/views/404.php';
                } else if ($link == true) {
                    $linkdata->viewLink($link[0]['ID'], $_SERVER['HTTP_USER_AGENT'], $_SERVER['REMOTE_ADDR'], $_SERVER["HTTP_REFERER"], $_SESSION["user"], date('Y-m-d H:i:s', time()));
                    header('Location: ' . $link[0]['url'], true, 302);
                } else {
                    http_response_code(403);
                }
                break;
        }
    }
}

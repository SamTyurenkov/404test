<?php
class LinkData extends Database
{

  function getLink($hash)
  {
    $link = apc_fetch($hash);

    if ($link == false) {
      $link = $this->run("SELECT * FROM `links` WHERE hash='" . $hash . "';");
    }

    if ($link != false) {
      apc_store($hash, $link);
      return $link;
    }
  }

  function addLink($url)
  {
    $url = filter_var($url, FILTER_VALIDATE_URL);
    $hash = sha1($url);
    $query = $this->run("INSERT INTO `links` (url, hash) VALUES ('" . $url . "','" . $hash . "');");
    return $hash;
  }

  function viewLink($link_id, $user_agent, $user_ip, $referrer, $token_id, $timestamp)
  {
    $query = $this->run("INSERT INTO `stats` (link_id, user_agent, user_ip, referrer, token_id, timestamp) VALUES ('" . $link_id . "','" . $user_agent . "','" . $user_ip . "','" . $referrer . "','" . $token_id . "','" . $timestamp . "');");
    return true;
  }

  function showStats()
  {
    $data = $this->run("SELECT * FROM `stats` order by ID desc limit 10;");
    return $data;
  }
}

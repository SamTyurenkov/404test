<!DOCTYPE html>
<html>
<?php
include_once("views/templates/header.php");
?>

<body>

    <div class="login">
        <?php if (User::isLogged()) { ?>
            <input id="login" type="text" placeholder="Логин" value="<?= $_SESSION['user']; ?>"></input>
            <input id="pass" type="password" placeholder="Пароль" value="****"></input>
            <div id="ajaxlogin" class="button" onClick="ajaxlogout()">Выйти</div>
        <?php } else { ?>
            <input id="login" type="text" placeholder="Логин"></input>
            <input id="pass" type="password" placeholder="Пароль"></input>
            <div id="ajaxlogin" class="button" onClick="ajaxlogin()">Войти</div>
        <?php }; ?>
    </div>
    <div class="error"></div>

    <!-- SECTION WITH POSTS -->
    <div class="posts">
        <?php if (User::isAdmin()) { ?>
            <div class="post">
                <input id="link_url" type="text" placeholder="URL"></input>
                <div id="ajaxaddlink" class="button" onClick="ajaxaddlink()">Добавить ссылку</div>
                <div class="error"></div>
            </div>
        <?php } else if (User::isLogged()) { ?>
            <div class="post">
                <p>У вас нет прав для добавления ссылок</p>
                <div class="error"></div>
            </div>
        <?php } else { ?>
            <div class="post">
                <p>Авторизуйтесь, чтобы добавить ссылку</p>
                <div class="error"></div>
            </div>
        <?php }; ?>
    </div>

    <div class="posts">

        <div class="statsrow">
            <div class="stat">
                <div class="param">ID</div>
                <div class="param">link_id</div>
                <div class="param">user_agent</div>
                <div class="param">user_ip</div>
                <div class="param">http://404test.local/</div>
                <div class="param">token_id</div>
                <div class="param">timestamp</div>
            </div>
            <?php $linkdata = new LinkData();
            $stats = $linkdata->showStats();
            foreach ($stats as $stat) {
                echo '<div class="stat">';
                foreach ($stat as $param) {
                    echo '<div class="param">' . $param . '</div>';
                }
                echo '</div>';
            }
            ?>


        </div>
    </div>

</body>

</html>
-- phpMyAdmin SQL Dump
-- version 4.9.5deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Сен 26 2020 г., 23:33
-- Версия сервера: 10.3.23-MariaDB-0+deb10u1
-- Версия PHP: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `404test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `links`
--

CREATE TABLE `links` (
  `ID` int(11) NOT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `links`
--

INSERT INTO `links` (`ID`, `url`, `hash`) VALUES
(197, 'http://asp.sale', '191e30956097955d22b9b78ac27c1fb40103153e'),
(204, 'https://windowspros.ru', '7f1b3387970efce8ee9a4af5c8e5f3f93cce77fd'),
(212, 'https://asp.sale/adminka', 'ff6cb1cf976b810bcb726bba35372c1323916770'),
(214, 'http://test.com', '50334ee0b51600df6397ce93ceed4728c37fee4e'),
(215, 'https://play-best-games.com', 'f91fc41603dbd71149f11819f0e13ba7058e07a2'),
(216, 'https://google.com', '72fe95c5576ec634e214814a32ab785568eda76a'),
(217, 'https://apple.com', 'ebaefb95c6bcf4349b7ae3f14c1195b5db832ec9'),
(218, 'http://vk.com', '9e16df3db949300b209c4167586ca87e7656783c'),
(219, 'http://ok.ru', '501875f9922e8d89685eb6a1d0874eb6e926d381'),
(220, 'http://this.com', 'be13799093a627e6d2b1607ec6845c1a6efc3b0b'),
(221, 'http://some.link', 'b9626d4a1f70c1262b51d6ce7a4ea75807d89208'),
(223, 'https://asp.sale', '06ccd06a9aa6367080c9b0a06ab1b4a4ad4c5d95'),
(225, 'http://windowspros.ru', 'a134c21b5304ec403f923949ff6feed867d6753f');

-- --------------------------------------------------------

--
-- Структура таблицы `stats`
--

CREATE TABLE `stats` (
  `ID` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `referrer` varchar(100) NOT NULL,
  `token_id` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `stats`
--

INSERT INTO `stats` (`ID`, `link_id`, `user_agent`, `user_ip`, `referrer`, `token_id`, `timestamp`) VALUES
(2, 213, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 17:48:16'),
(3, 214, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:05:49'),
(4, 215, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:17:07'),
(5, 215, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', '', 'not_admin', '2020-09-26 18:18:59'),
(6, 214, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:44:26'),
(7, 214, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:44:31'),
(8, 216, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:46:35'),
(9, 216, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:46:41'),
(10, 217, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:49:59'),
(11, 218, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:55:34'),
(12, 218, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 18:55:39'),
(13, 219, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', '', 'admin', '2020-09-26 19:26:28'),
(14, 219, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 19:26:35'),
(15, 219, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', '', 'not_admin', '2020-09-26 19:27:06'),
(16, 220, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 19:33:10'),
(17, 221, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 19:37:50'),
(18, 225, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '127.0.0.1', 'http://404test.local/', 'admin', '2020-09-26 20:32:34');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `user_login` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_role` int(1) NOT NULL DEFAULT 9
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `user_login`, `user_password`, `user_email`, `user_role`) VALUES
(1, 'admin', '123', 'sam.tyurenkov@gmail.com', 1),
(2, 'not_admin', '123', 'sam.tyurenkov@gmail.com', 9);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `URL` (`url`),
  ADD UNIQUE KEY `HASH` (`hash`);

--
-- Индексы таблицы `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `user_ip` (`user_ip`),
  ADD KEY `user_agent` (`user_agent`),
  ADD KEY `referrer` (`referrer`),
  ADD KEY `token_id` (`token_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LOGIN` (`user_login`),
  ADD KEY `role` (`user_role`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `links`
--
ALTER TABLE `links`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT для таблицы `stats`
--
ALTER TABLE `stats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

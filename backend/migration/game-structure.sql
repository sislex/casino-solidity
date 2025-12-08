-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: mysql:3306
-- Время создания: Дек 08 2025 г., 07:38
-- Версия сервера: 8.0.43
-- Версия PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `game`
--
CREATE DATABASE IF NOT EXISTS `game` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `game`;

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
                         `id` int UNSIGNED NOT NULL,
                         `type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
                         `contractAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `ownerAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `finished_at` timestamp NULL DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                         `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         `end_betting_time` timestamp NULL DEFAULT NULL,
                         `end_game_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `game_data`
--

DROP TABLE IF EXISTS `game_data`;
CREATE TABLE `game_data` (
                             `id` int NOT NULL,
                             `game_id` int UNSIGNED NOT NULL,
                             `bet` int NOT NULL,
                             `players_number` int NOT NULL,
                             `player_number_set` int NOT NULL,
                             `bots` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `game_dice`
--

DROP TABLE IF EXISTS `game_dice`;
CREATE TABLE `game_dice` (
                             `id` int NOT NULL,
                             `game_id` int UNSIGNED NOT NULL,
                             `wallet` varchar(255) NOT NULL,
                             `round` int NOT NULL DEFAULT '1',
                             `result` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `game_players`
--

DROP TABLE IF EXISTS `game_players`;
CREATE TABLE `game_players` (
                                `id` int NOT NULL,
                                `game_id` int UNSIGNED NOT NULL,
                                `wallet` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                `user_id` int NOT NULL,
                                `win` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `game_rock_paper_scissors`
--

DROP TABLE IF EXISTS `game_rock_paper_scissors`;
CREATE TABLE `game_rock_paper_scissors` (
                                            `id` int NOT NULL,
                                            `game_id` int UNSIGNED NOT NULL,
                                            `wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                            `round` int NOT NULL DEFAULT '1',
                                            `result` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `game_types`
--

DROP TABLE IF EXISTS `game_types`;
CREATE TABLE `game_types` (
                              `id` int NOT NULL,
                              `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                              `logic_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `game_types`
--

INSERT INTO `game_types` (`id`, `name`, `logic_address`) VALUES
                                                             (1, 'rock-paper-scissors', ''),
                                                             (2, 'dice', ''),
                                                             (3, 'roulette', ''),
                                                             (4, 'blackjack', ''),
                                                             (5, 'bingo', ''),
                                                             (6, 'slots', ''),
                                                             (7, 'poker', ''),
                                                             (8, 'heads-and-tails', '');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
                              `id` int NOT NULL,
                              `timestamp` bigint NOT NULL,
                              `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `id` int NOT NULL,
                         `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'player',
                         `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `wallet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `encrypted_private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                         `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
                         `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `status`, `password`, `wallet`, `encrypted_private_key`, `created_at`, `updated_at`) VALUES
                                                                                                                             (13, 'kolya1234', 'player', '$2b$10$Ebxq3YvKw.UbDLFwmQvfmuDCp6GRcl7Leo8xff/AZZqcZrurZ4a.O', '0xdD2FD4581271e230360230F9337D5c0430Bf44C0', '0xde9be858da4a475276426320d5e9262ecfc3ba460bfac56360bfa6c4c28b4ee0', '2025-06-23 07:43:43.373318', '2025-08-24 11:51:49.027273'),
                                                                                                                             (14, 'kolya12', 'player', '$2b$10$wGOERwcYmKGsyATcO4cYI.pbYhZw7UWQrqLvf/3biPrnJlbUegVXu', '0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199', '0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e', '2025-06-23 07:45:17.429703', '2025-08-19 07:41:54.149594'),
                                                                                                                             (16, 'alex', 'player', '$2b$10$k6npZPaRRzoMW7yVAimSoegs4V43m3hVCFes79L9/YNnxeLmQ3/SK', '0x60a8c06c73bCA5Efad8433c36a5891Bb228cccFf', '0x9b5911e062839631243ce76c6d783c59412c9d620b52a51b961d45b108d2d800', '2025-07-08 07:39:55.655821', '2025-07-08 07:39:55.655821'),
                                                                                                                             (17, 'TEST_PLAYER', 'player', '$2b$10$DK35kWEoRVgEBEVdcSzVsuSpR2X99UrhXoEynNeKBUumiGR2rREgS', '0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc', '0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba', '2025-09-03 13:27:33.718107', '2025-09-03 13:28:13.497009'),
                                                                                                                             (18, 'Bot_1', 'bot', '$2b$10$EOXxdRPI6BkjwuBgTATcXujw3J1pnU8Fssj4tCos6yc8G7zLl6E0i', '0x5895dD848b7A2357025eC61FDDDFe981Be503fb4', '9454d9e20b5509c171f1c0edb6e990b5b429d727ae73252c98c6f96bf1905884', '2025-09-12 13:47:33.584856', '2025-09-24 21:27:22.659783'),
                                                                                                                             (19, 'Bot_2', 'bot', '$2b$10$PQ/q63OzjxL1DVM81eXdwOzqgcYtd2RepZzjRmdWsvyy0Ksl6VF76', '0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC', '0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a', '2025-09-12 13:47:40.683848', '2025-09-15 09:27:21.662981'),
                                                                                                                             (20, 'Bot_3', 'bot', '$2b$10$lb06bvgjfEArh6ez7nKodu7yTCAHn.BfwG1VoM/kPYg3y2AmXHVuC', '0x90F79bf6EB2c4f870365E785982E1f101E93b906', '0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6', '2025-09-12 13:47:47.812411', '2025-09-15 09:27:38.976495'),
                                                                                                                             (21, 'Bot_4', 'bot', '$2b$10$ors/dmWT6s40aXAySBOJfu4MB5WGUUvu5sWt3dxAb0vm0wODJDLeC', '0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65', '0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a', '2025-09-12 13:47:56.108777', '2025-09-15 09:27:57.185993'),
                                                                                                                             (22, 'real_test_wallet', 'player', '$2b$10$izkqQNpOkc5dRm9BRFzoR.Z7rt391BVrjBjSASyn5xjZ/kJBPfYbC', '0x2Bc3E1bb6C3C68720b392733993Bfef7334d3cbe', '32f561a84be0480b20b69c8633b9ef48464e5bb863627209c502897e823427d3', '2025-09-23 06:39:53.088492', '2025-09-23 06:42:38.280165'),
                                                                                                                             (23, 'real_test_wallet_2', 'player', '$2b$10$IhBiPHA/JSWJyU7/doRTvuPxgsZR4vJjAJWwSw464EgK3oMLFt4q.', '0xbc919E13e9f7dF0124D8442bA463D782F9401dc0', 'd4b36f4fca3f120911357461f2783cb83f172119cf7203e0f3e2d179ccfb0d60', '2025-09-23 06:40:16.957054', '2025-10-09 09:00:03.746950'),
                                                                                                                             (24, 'test_reg', 'player', '$2b$10$X7SZHc4EPdkjHvy7ROkfi.8keKaJQLec.8Mdy6xRPKh.IgewfeTgK', '0xe5caaF7ACF51c9474d8aC4CC40b867BeA5b75386', '68e151385d4112bb55f15b2f63972269ef53bf917c27405b2d2355c90d9e3ca5', '2025-10-09 08:52:47.716384', '2025-10-09 09:01:40.740808');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
    ADD PRIMARY KEY (`id`),
  ADD KEY `idx_games_type_name` (`type`);

--
-- Индексы таблицы `game_data`
--
ALTER TABLE `game_data`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_id` (`game_id`),
  ADD UNIQUE KEY `uk_game_data_game` (`game_id`),
  ADD KEY `idx_game_data_game_id` (`game_id`);

--
-- Индексы таблицы `game_dice`
--
ALTER TABLE `game_dice`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `game_players`
--
ALTER TABLE `game_players`
    ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `idx_game_players_game_id` (`game_id`),
  ADD KEY `idx_game_players_wallet` (`wallet`),
  ADD KEY `fk_game_players_user` (`user_id`);

--
-- Индексы таблицы `game_rock_paper_scissors`
--
ALTER TABLE `game_rock_paper_scissors`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_game_rps_game` (`game_id`);

--
-- Индексы таблицы `game_types`
--
ALTER TABLE `game_types`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_2d443082eccd5198f95f2a36e2` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
    MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=808;

--
-- AUTO_INCREMENT для таблицы `game_data`
--
ALTER TABLE `game_data`
    MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=762;

--
-- AUTO_INCREMENT для таблицы `game_dice`
--
ALTER TABLE `game_dice`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `game_players`
--
ALTER TABLE `game_players`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `game_rock_paper_scissors`
--
ALTER TABLE `game_rock_paper_scissors`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `game_types`
--
ALTER TABLE `game_types`
    MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
    MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `games`
--
ALTER TABLE `games`
    ADD CONSTRAINT `fk_games_game_type` FOREIGN KEY (`type`) REFERENCES `game_types` (`name`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `game_data`
--
ALTER TABLE `game_data`
    ADD CONSTRAINT `fk_game_data_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `game_players`
--
ALTER TABLE `game_players`
    ADD CONSTRAINT `fk_game_players_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_game_players_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `game_rock_paper_scissors`
--
ALTER TABLE `game_rock_paper_scissors`
    ADD CONSTRAINT `fk_game_rps_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

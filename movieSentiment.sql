-- phpMyAdmin SQL Dump
-- version 4.3.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-12-12 09:20:37
-- 服务器版本： 5.6.15
-- PHP Version: 5.5.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `movieSentiment`
--

-- --------------------------------------------------------

--
-- 表的结构 `json_cache`
--

CREATE TABLE IF NOT EXISTS `json_cache` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  `cache_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `raw_tweet` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parsed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tweets_movie`
--

CREATE TABLE IF NOT EXISTS `tweets_movie` (
  `tweet_id` bigint(20) NOT NULL,
  `tweet_text` varchar(160) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tweets_movie_feature1`
--

CREATE TABLE IF NOT EXISTS `tweets_movie_feature1` (
  `tweet_id` bigint(20) NOT NULL,
  `tweet_text` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tweets_movie_feature2`
--

CREATE TABLE IF NOT EXISTS `tweets_movie_feature2` (
  `tweet_id` bigint(20) NOT NULL,
  `tweet_text` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tweets_movie_feature3`
--

CREATE TABLE IF NOT EXISTS `tweets_movie_feature3` (
  `tweet_id` bigint(20) NOT NULL,
  `tweet_text` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tweets_movie_feature4`
--

CREATE TABLE IF NOT EXISTS `tweets_movie_feature4` (
  `tweet_id` bigint(20) NOT NULL,
  `tweet_text` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tweets_movie_feature5`
--

CREATE TABLE IF NOT EXISTS `tweets_movie_feature5` (
  `tweet_id` bigint(20) NOT NULL,
  `tweet_text` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `json_cache`
--
ALTER TABLE `json_cache`
  ADD PRIMARY KEY (`cache_id`), ADD KEY `tweet_id` (`tweet_id`), ADD KEY `cache_date` (`cache_date`);

--
-- Indexes for table `tweets_movie`
--
ALTER TABLE `tweets_movie`
  ADD PRIMARY KEY (`tweet_id`);

--
-- Indexes for table `tweets_movie_feature1`
--
ALTER TABLE `tweets_movie_feature1`
  ADD PRIMARY KEY (`tweet_id`);

--
-- Indexes for table `tweets_movie_feature2`
--
ALTER TABLE `tweets_movie_feature2`
  ADD PRIMARY KEY (`tweet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `json_cache`
--
ALTER TABLE `json_cache`
  MODIFY `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php

/*
 * This is just class definitions the PHP scripts use regularly.
 * DB_CONFIG_DIR is where the DB configuration folder is located 
 * on our server.
 * CODE_DIR is where the code is located for the DB PHP scripts.
 * AJAX_URL is where we keep our AJAX scripts. Didn't really end up
 * using AJAX here; the idea was to display tweets in a scrolling list
 * but decided to use a map instead.
 * TWITTER_CONSUMER KEY through OAUTH_SECRET are permission values you receive
 * from the Twitter API Console. You need to go on that website and make
 * a Twitter account. THrough their API console, you can get authorization
 * access to use their streaming API. These values are sent to Twitter when
 * we make a request from them. It is user specific. We have removed our 
 * key values.
 * 
 * The rest is self explanatory.
 * 
 *  *   // written by: Gradeigh Clark and Xianyi Gao
  // tested by: Gradeigh Clark and Xianyi Gao
  // debugged by: Gradeigh Clark and Xianyi Gao
 */

// Directory for db_config.php
//define('DB_CONFIG_DIR', '/Users/yaodongyang/Sites/database');

// Server path for scripts within the framework to reference each other
//define('CODE_DIR', '/Users/yaodongyang/Sites');

// External URL for Javascript code in browsers to call the framework with Ajax
//define('AJAX_URL', 'http://www.healthmonitoringanalytics.com/140dev/');

// OAuth settings for connecting to the Twitter streaming API
// Fill in the values for a valid Twitter app
define('TWITTER_CONSUMER_KEY','nMCCMiyKJLqGrkMC7xbEskoIv');
define('TWITTER_CONSUMER_SECRET','3X1cltfxwRgk6RaO3ar4tzM3ExJsrfArRBOLTUuOTVp2cHx9FW');
define('OAUTH_TOKEN','1152882559-yzdQoVUokg8gg9Teif3aAgzBTrNX6LOhsLJKirV');
define('OAUTH_SECRET','SRxhn7N0Syje9semo6ntmjX3NZDXkpGU7BCx54bAXjIhP');

// MySQL time zone setting to normalize dates
define('TIME_ZONE','America/New_York');

// Settings for monitor_tweets.php
define('TWEET_ERROR_INTERVAL',10);
// Fill in the email address for error messages
define('TWEET_ERROR_ADDRESS','cctv2206@outlook.com');
?>
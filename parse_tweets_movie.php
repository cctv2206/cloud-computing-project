<?php
/**
* parse_tweets.php
* Populate the database with new tweet data from the json_cache table
 *   // written by: Gradeigh Clark and Xianyi Gao
  // tested by: Gradeigh Clark and Xianyi Gao
  // debugged by: Gradeigh Clark and Xianyi Gao
*/
require_once('140dev_config.php');
require_once('db_lib_movie.php');
$oDB = new db;

// This should run continuously as a background process
while (true) {

  // Process all new tweets
  $query = 'SELECT cache_id, raw_tweet ' .
    'FROM json_cache WHERE NOT parsed';
  // $query = 'SELECT cache_id, raw_tweet ' .
  //   'FROM json_cache';

  $result = $oDB->select($query);

  while($row = mysqli_fetch_assoc($result)) {
		
    $cache_id = $row['cache_id'];
    // Each JSON payload for a tweet from the API was stored in the database  
    // by serializing it as text and saving it as base64 raw data
    $tweet_object = unserialize(base64_decode($row['raw_tweet']));
		
    // Mark the tweet as having been parsed
    $oDB->update('json_cache','parsed = true','cache_id = ' . $cache_id);
		
    // Gather tweet data from the JSON object
    // $oDB->escape() escapes ' and " characters, and blocks characters that
    // could be used in a SQL injection attempt
    $tweet_id = $tweet_object->id_str;
    $tweet_text = $oDB->escape($tweet_object->text);
    $created_at = $oDB->date($tweet_object->created_at);
    if (isset($tweet_object->geo)) {
      $geo_lat = $tweet_object->geo->coordinates[0];
      $geo_long = $tweet_object->geo->coordinates[1];
    } else {
      $geo_lat = $geo_long = 0;
    } 
    $user_object = $tweet_object->user;
    $user_id = $user_object->id_str;
    $screen_name = $oDB->escape($user_object->screen_name);
    $name = $oDB->escape($user_object->name);
    $profile_image_url = $user_object->profile_image_url;
    $entities = $tweet_object->entities;
		
    // Add the new tweet
    // The streaming API sometimes sends duplicates, 
    // so test the tweet_id before inserting
    if (! $oDB->in_table('tweets_movie','tweet_id=' . $tweet_id )) {

      // The entities JSON object is saved with the tweet
      // so it can be parsed later when the tweet text needs to be linkified
      $field_values = 'tweet_id = ' . $tweet_id . ', ' .
        'tweet_text = "' . $tweet_text . '"' ;
        

      if (strpos($tweet_text, 'http') === false){
        $oDB->insert('tweets_movie',$field_values);
      }

    }
		
  } 
		
  // You can adjust the sleep interval to handle the tweet flow and 
  // server load you experience
  //sleep(10);
  
  echo "finished!\n";
  break;
}

?>
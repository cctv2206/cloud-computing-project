# cloud-computing-project
Feature based tweets sentiment analysis on movies

This repository contains all source code for Feature Based Tweets Sentiment Analysis Project.

==================

INSTALLATION

Please install TextBlob:
https://textblob.readthedocs.org/en/dev/install.html

easy installation: 
$ pip install -U textblob
$ python -m textblob.download_corpora

Please install matplotlib
http://matplotlib.org/faq/installing_faq.html#install-osx-binaries

easy installation: 
pip install matplotlib

==================

EXAMPLE

You can run a simple example without database.

movieData.txt contains over 20K real tweets about movie Creed.

SentimentOneMR.py is the MapReduce implementation.

single_thread.py is the single thread implementation.

copy these file along with the Makefile file to your spark directory

Change EXAMPLE_DIR and SPARK_HOME inside the Makefile

run makefile, this will run the MapReduce implementation

You could also run single_thread.py for single thread implementation.

enjoy!

==================

DATA COLLECTION

First, you need to have a mysql database, phpmyadmin(GUI database manager), the php environment and an apache server. You can simply install xampp - a integrated development environment. Or you could install and configure them separately. 

Second, change the configures. In the db_config_movie.php, you should insert your database name and password. But this may influence other files on linking the database, thus it is recommended to use the same database name and password. Then, in the 140dev_config.php, use your own twitter api account (create it by using your own twitter account on the official website).

Third, create a database called "movieSentiment" in your phpmyadmin, and import the movieSentiment.sql to resume the tables. Next, you need to run the ‘php get_tweet_movie.php’ in this directory, you will find data collected in your jsoncache table. Then run the parse_tweet_movie.php to parse the jsoncache into several base tables.

Run saveTweets.py to save all tweets to a txt file

The txt file is the input for SentimentOneMR.py or single_thread.py.

================

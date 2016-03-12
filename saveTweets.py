__author__ = 'kk'
#!/usr/bin/python

import mysql.connector

cnx = mysql.connector.connect(user='root', password='root',
                              host='localhost',
                              database='movieSentiment')
cursor = cnx.cursor()

# general
query = ("SELECT tweet_text FROM tweets_movie")

cursor.execute(query)

f = open("movieData.txt", "w")
for tweetText in cursor:
  #f.write(tweetText[0])
  f.write(tweetText[0].encode('utf-8').strip("\n"))
  f.write("\n")
  #print(tweetText[0])

f.close()

cursor.close()
cnx.close()

print(" === END === ")
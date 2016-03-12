EXAMPLE_DIR = /Users/kk/spark-1.5.2-bin-hadoop2.6/spark-wordcount/
SPARK_HOME=/Users/kk/spark-1.5.2-bin-hadoop2.6/bin

run-local: 
	(unset HADOOP_CONF_DIR; \
	 unset SPARK_YARN_USER_ENV; \
	 $(SPARK_HOME)/spark-submit --master local[2] --deploy-mode client ./SentimentOneMR.py | sort -n -t: -k2 )

clean:
	-hdfs dfs -rm -f -r $(EXAMPLE_DIR)

.PHONY: directories inputs clean run run

# docker-spark

A containerized standalone Spark cluster.

## Build

	docker build -t vantriet/spark .

## Run

	CID=$(docker run -dit vantriet/spark);

## Test

	IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CID);
	spark-submit --master spark://$IP:7077 SimpleApp.py 
	
## Starting a worker node

	docker run -dit vantriet/spark org.apache.spark.deploy.worker.Worker spark://$IP:7077
	docker ps --no-trunc

## WebUI

Go to http://<IP>:8080/

## Disclaimer

It works on my machine :P



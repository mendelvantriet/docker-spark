# docker-spark

This project is still under development.

A containerized standalone Spark cluster.

## Build

	docker build -t vantriet/spark .

## Run

	CID=$(docker run -dit vantriet/spark);
	IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CID);
	docker run -dit vantriet/spark org.apache.spark.deploy.worker.Worker spark://$IP:7077

## Test

	docker ps --no-trunc
	docker exec -it $CID spark-submit --master spark://$IP:7077 examples/src/main/python/pi.py
	
## WebUI

Go to http://<IP>:8080/

## Disclaimer

Fit for no purpose

## TODO

Mount SimpleApp.py inside container


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
	
Spark standalone does not support deploy-mode cluster, so we will be running in client mode (which is the default for `spark-submit`). Consequently, the driver will run on your client (where you run `spark-submit`). Because the executor and master need to connect to the driver, make sure your client is accessible from the cluster. You can either submit applications from within the cluster:

	docker exec -it $CID spark-submit --master spark://$IP:7077 examples/src/main/python/pi.py

Or, if you want to submit applications from your docker host, make sure your firewall settings allow this. In my case this meant running `iptables -P INPUT ACCEPT`. You can also open the port corresponding with your `spark.driver.port` configuration setting (which is set to random by default).

	spark-submit --master spark://$IP:7077 $SPARK_HOME/examples/src/main/python/pi.py

## WebUI

Go to http://<IP>:8080/

## Disclaimer

Fit for no purpose

## TODO

Mount SimpleApp.py inside container


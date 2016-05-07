# docker-spark

## Build

	docker build -t vantriet/spark .

## Run

	docker run -dit vantriet/spark

## Test

	docker ps
	docker inspect --format '{{ .NetworkSettings.IPAddress }}' <ID>
	spark-submit --master spark://<IP>:7077 SimpleApp.py 

## Disclaimer

It works on my machine :P



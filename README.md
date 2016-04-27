# docker-spark

## Build

	sudo docker build -t vantriet/spark .

## Run

	sudo docker run -dit vantriet/spark

## Test

	sudo docker ps
	sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' <ID>
	spark-submit --master spark://<IP>:7077 SimpleApp.py 

## Disclaimer

It works on my machine :P



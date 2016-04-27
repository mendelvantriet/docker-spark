FROM frolvlad/alpine-scala
MAINTAINER mendelvantriet

RUN apk update
RUN apk add --update curl procps

# install spark
RUN curl -s http://apache.cs.uu.nl/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s spark-1.6.1-bin-hadoop2.6 spark
ENV SPARK_HOME /usr/local/spark
ENV PATH $PATH:$SPARK_HOME/bin
WORKDIR $SPARK_HOME

CMD ["org.apache.spark.deploy.master.Master"]
ENTRYPOINT ["bin/spark-class"]



FROM alpine:3.3

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --update openjdk8-jre curl bash procps openssh java-snappy@testing
RUN mkdir -p ~root/.ssh && chmod 700 ~root/.ssh/ && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config && \
    cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/cache/apk/*

RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.6.1-bin-hadoop2.6.tgz | tar -xz -C /usr/local && \
  cd /usr/local/ && \
  ln -s spark-1.6.1-bin-hadoop2.6 spark && \
  rm spark/lib/spark-examples-1.6.1-hadoop2.6.0.jar


ENV SPARK_HOME /usr/local/spark
ENV WORKER_INSTANCES 1
ENV WORKER_MEMORY 1G
ENV WORKER_CORES 1
ENV EXECUTOR_MEMORY 256M
ENV DRIVER_MEMORY 256M

COPY conf/* /usr/local/spark/conf/
COPY run-spark.sh /usr/local/spark/run-spark.sh
COPY run.sh /run.sh
COPY generate-keys.sh /generate-keys.sh

WORKDIR /usr/local/spark

CMD ["sh", "/run.sh"]

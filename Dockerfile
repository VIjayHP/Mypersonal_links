FROM openjdk:alpine

ENV SOCKET_IO_URL "http://15.213.6.50:3001/post_report_packet"
ENV CRAWL_TIMEOUT "240"
ENV CRAWLER_QUEUE "DATA_SERVICE_QUEUE"
ENV REPORT_QUEUE "REPORT_DATA_QUEUE"
ENV RABBITMQ_SERVICE "wsqc-rabbitmq3"
ENV IS_PROXY_REQUIRED "TRUE"
ENV HTTP_PROXY_URL "15.85.195.199"
ENV HTTP_PROXY_PORT "8080"
ENV STACKATO_SERVICES "{\"wsqc-rabbitmq3\": {\"name\":\"guest\",\"hostname\":\"rabbitwsqc\",\"host\":\"rabbitwsqc\",\"port\":5672,\"vhost\":\"wsqc\",\"username\":\"guest\",\"user\":\"guest\",\"password\":\"guest\",\"pass\":\"guest\",\"uri\":\"amqp://guest:guest@rabbitwsqc:5672/wsqc\",\"dashboard_url\":\"http://172.16.1.31:30007\"}}"

COPY WSQCCrawlerService-1.0.jar WSQCCrawlerService-1.0.jar

ENTRYPOINT ["java","-jar","WSQCCrawlerService-1.0.jar","--server.port=8055"]

EXPOSE 8055
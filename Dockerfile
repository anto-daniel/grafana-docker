FROM ubuntu:16.04
MAINTAINER <Anto Daniel J P>

RUN apt-get update && apt-get install curl software-properties-common apt systemd apt-transport-https supervisor -y
RUN curl https://packagecloud.io/gpg.key | apt-key add -
RUN add-apt-repository "deb https://packagecloud.io/grafana/stable/debian/ stretch main"
RUN apt-get install grafana -y
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY run.sh /run.sh
RUN chmod a+x /run.sh
RUN cp /run.sh /usr/local/bin/start_grafana
ENTRYPOINT ["start_grafana"]
EXPOSE 3000
CMD ["grafana"]

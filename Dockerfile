FROM ubuntu

RUN apt-get remove -qy netcat-openbsd
RUN apt-get install -qy netcat

EXPOSE 80
CMD nc -l -p 80 -k -c 'xargs -n1 echo'

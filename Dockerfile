FROM ubuntu:latest AS base

RUN useradd -m abc

RUN apt-get update && apt-get install -y cron

RUN mkdir -p /home/abc/maxi && chown abc:abc /home/abc/maxi

FROM base AS intermediate

COPY ./scriptadu.sh /home/abc/evaluation/

RUN chmod +x /home/abc/evaluation/scriptadu.sh

RUN chown abc:abc /home/abc/evaluation/scriptadu.sh

FROM intermediate AS cleanup

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

FROM cleanup AS create0

RUN echo "0 * * * * abc /home/abc/evaluation/scriptadu.sh 0" >> /etc/crontab

FROM create0 AS create0again

RUN echo "0 0 * * * abc /home/abc/evaluation/scriptadu.sh 0" >> /etc/crontab

FROM create0again AS create1

RUN echo "0 0 * * * abc /home/abc/evaluation/scriptadu.sh 1" >> /etc/crontab

CMD ["cron", "-f"]



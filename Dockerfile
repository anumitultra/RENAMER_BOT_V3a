FROM python:3.10.5-slim-buster
RUN mkdir /app && chmod 777 /app
RUN apt update && apt install -y tcl
RUN apt-get -qq update
RUN apt-get -qq install -y git python3 python3-pip \
    curl pv jq nginx npm
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git python3 python3-pip ffmpeg
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
CMD ["python3","bot.py"]

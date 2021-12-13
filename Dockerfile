FROM node:17.2.0
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /app
COPY package.json .
# Install chromium-browser
RUN apt update
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install ./google-chrome-stable_current_amd64.deb -y
RUN apt install google-chrome-stable -y
# Install youtube-dl
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl
# Install python3
RUN apt update && apt install python3 -y && apt install python3-pip -y
# Install package.json dependencies
RUN npm i
RUN npm install dotenv
RUN whereis python && ln -s /usr/bin/python3 /usr/bin/python
#Prevents docker from removing the container
CMD ["npm", "start"]

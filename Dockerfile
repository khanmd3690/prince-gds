FROM node:20-bookworm

RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        imagemagick \
        webp \
        python3 \
        make \
        g++ && \
    rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["npm", "start"]

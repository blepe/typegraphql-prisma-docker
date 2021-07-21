FROM node:lts-buster
RUN mkdir /app
RUN cd /tmp \
 && git clone https://github.com/MichalLytek/typegraphql-prisma.git \
 && cp -rp /tmp/typegraphql-prisma/examples/1-prototyping/* /app \
 && cp -rp /tmp/typegraphql-prisma/examples/tsconfig.json /app \
 && rm -rf /tmp/typegraphql-prisma
WORKDIR /app
RUN npm i
RUN npx prisma migrate dev --name first_one
CMD npm run start


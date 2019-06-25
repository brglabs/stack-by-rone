FROM node:carbon-alpine

# Copy or mount node app here
WORKDIR /app

ARG PORT_DEFAULT
ENV PORT_DEFAULT=${PORT_DEFAULT}
EXPOSE ${PORT_DEFAULT}

COPY ./entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["sh","/entrypoint.sh"]

CMD ["npm", "start"]
FROM alpine:3.12 as build

WORKDIR /app
RUN apk add --no-cache \
  g++ \
  make \ 
  sqlite-dev

COPY . .
RUN make

FROM alpine:3.12

WORKDIR /app
RUN apk add --no-cache \ 
  sqlite-dev

COPY --from=build /app/AdhocServer /app/AdhocServer

EXPOSE 27312/tcp
ENTRYPOINT [ "/app/AdhocServer" ]

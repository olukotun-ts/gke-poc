FROM golang:1.8-alpine
ADD . /go/src/hello-app
RUN go install hello-app

FROM alpine:latest
COPY --from=0 /go/bin/hello-app .
ENV PORT 8080
ARG CLUSTER_NAME
ARG IMAGE_TAG
ENV CLUSTER_NAME $CLUSTER_NAME
ENV IMAGE_TAG $IMAGE_TAG
CMD ["./hello-app"]

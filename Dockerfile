FROM ubuntu:22.04
RUN apt-get update -y && apt-get install -y curl
CMD ["echo", "Hello from Hangout Jenkins Project!"]

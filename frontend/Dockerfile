FROM node:latest

WORKDIR /frontend
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y tzdata

ENV TZ Asia/Tokyo

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
  git

COPY . /frontend
RUN yarn install

ENV PATH /frontend/node_modules/.bin:$PATH

ENV HOST 0.0.0.0

# Start the main process.
CMD bash -c "yarn dev"

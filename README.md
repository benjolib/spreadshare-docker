# Spreadshare

## Run docker environment

Make sure you have docker installed: https://www.docker.com

### Installation

Clone this repository recursively. There is a submodule with the spreadshare code attached to the /application folder.
````
$ git clone --recursive git@bitbucket.org:spreadshare/spreadshare-docker.git
````

Install composer: https://getcomposer.org/download/
````
$ cd application/
$ composer install
````

### Configuration

Add spreadshare.app in your /etc/hosts file as follows:
````
$ 127.0.0.1 spreadshare.docker
````

### Create and build all containers
````
$ docker-compose build
````

### Start containers
````
$ docker-compose up -d
````

### Run

Open https://spreadshare.docker:444
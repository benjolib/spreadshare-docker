# Spreadshare

## Run docker environment

Make sure you have docker installed: https://www.docker.com

### Installation

Clone this repository recursively. There is a submodule with the spreadshare code attached to the /application folder.
````
$ git clone --recursive git@bitbucket.org:spreadshare/spreadshare-docker.git
````

Install composer (php dependency/package manager): https://getcomposer.org/download/

Then do:
````
$ cd application/
$ composer install
````

### Configuration

Add spreadshare.docker in your /etc/hosts file as follows:
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

We are using 444 here as the port to not interfere with any other locally running webserver.


### Additional info

Use 
````
$ docker-compose build --no-cache
````

to re-build the environment.
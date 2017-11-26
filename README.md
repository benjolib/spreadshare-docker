# Spreadshare

## Run docker environment

Make sure you have docker installed: https://www.docker.com

### Installation

Clone this repository recursively. There is a submodule with the spreadshare code attached to the /application folder.
````
$ git clone --recursive git@bitbucket.org:spreadshare/spreadshare-docker.git
````

### Configuration

Add spreadshare.docker in your /etc/hosts file as follows:
````
$ 127.0.0.1 spreadshare.docker
````

### Create and build all containers
From within the spreadshare-docker root directory, execute the following:
````
$ docker-compose build
````

### Start containers
````
$ docker-compose up -d
````

### Run

Open http://spreadshare.docker:81 or https://spreadshare.docker:444

We are using ports 81 and 444 to not interfere with any other locally running webserver.


### Additional info

Use 
````
$ docker-compose build --no-cache
````

to re-build the environment.
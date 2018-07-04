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
$ 127.0.0.1 dev.spreadshare.co
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

Open http://dev.spreadshare.co:81 or https://dev.spreadshare.co:444

We are using ports 81 and 444 to not interfere with any other locally running webserver.


### Additional info

Use
````
make reset
````

to re-build the environment id you have the autotools installed.

Do
````
docker-compose stop
docker-compose down
docker-compose build --no-cache
docker-compose up -d
````
if not.

Make yourself an admin
````
Connect to the mysql
mysql -h 127.0.0.1 -u spreadshare -pspreadshare spreadshare -P3307

Look for your user id (example):
SELECT * FROM user;

Update to be an admin:
update user set roles =33 where id =XXXXX;
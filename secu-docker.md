# How to secure your Docker

## Install Docker Bench Security

We will use the tool provided by Docker to test the security of its Docker host: Docker Bench Security.

Clone the security utility git repository provided by Docker:
```
git clone https://github.com/docker/docker-bench-security.git 
```
All the files of the utility are now in your HOME directory under the docker-bench-security folder.
```
cd docker-bench-security
```
run the utility
``` 
sudo./docker-bench-security.sh
```
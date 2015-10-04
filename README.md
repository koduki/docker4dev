koduki's Dockerfile
=======================

Docker image for development env.

How to
-----------------------

### make image

```[bash]
docker build -t koduki/docker4dev .
docker images
```

### run image

```[bash]
docker run --rm -v /c/Users/koduki/git/koduki:/git -it -p 3000:3000 koduki/docker4dev /bin/bash
```

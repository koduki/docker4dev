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
docker run -v /c/Users/koduki/git:/git -it koduki/docker4dev /bin/bash
```

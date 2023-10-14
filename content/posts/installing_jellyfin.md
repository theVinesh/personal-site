---
title: "Installing Jellyfin Media System"
date: 2022-08-31T00:44:57+01:00
lastmod: 2022-08-31T00:44:57+01:00
categories: ["tech", "jellifin", "self hosted", "home server"]
imgs: []
cover: ""  # image show on top
readingTime: true  # show reading time after article date
toc: true
comments: false
justify: false  # text-align: justify;
single: false  # display as a single page, hide navigation on bottom, like as about page.
license: ""  # CC License
draft: false
coverRelURL: ""  # abs url of cover
hidedate: false # to hide date
---
# Jellyfish what?
No, ["Jellyfin"](https://jellyfin.org/).

It is a free, open source media system that allows to collect, manage and stream your media to all of you devices.

It's like having your personal Netflix!

<!-- Notes:
```
Talk about how we are going to set up samba and jellyfin

after installing docker, install samba with docker. set up file share and then install jelly fin. Talk about adding content into the shared drive and creating a library on jellyfin and finish by giving links
``` -->
# 1. Install Docker

Update apt just in case

```
sudo apt update
```

Install latest version of docker

```
sudo apt install docker.io
```

Set Docker to run on start up

```
sudo systemctl enable --now docker
```

Grant your user permissions to docker 

```
sudo usermod -aG docker <user>
```
>replace <user> with your username

Test if docker is installed successfully

```
docker --version
```

# 2. Install Jellyfin

Create a folder for Jellyfin to reside

```
mkdir ~/dockers/jellyfin
```

Create cache and config folders for Jellyfin to use

```
mkdir ~/dockers/jellyfin/config ~/dockers/jellyfin/cache
```

Create and run latest Jellyfin in a docker container

```
docker run -d \
-v ~/dockers/jellyfin/config:/config \
-v ~/dockers/jellyfin/cache:/cache \
-v /path/to/content:/media \
--net=host jellyfin/jellyfin:latest
```
> replace /path/to/content

# 3. Launch
Navigate to http://serverip:8096. You should now be able to see Jellyfin 
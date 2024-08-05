---
title: ambhtmx.card3d
emoji: 🏃
colorFrom: pink
colorTo: pink
sdk: docker
pinned: false
---

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<!-- badges: end -->

**THIS IS A WORK IN PROGRESS, DO NOT USE**

## Deployment options

### Hugging Face Spaces

When you push a repository to a Hugging Face Spaces with the option to deploy Dockerfile and include a Dockerfile,  Hugging Face will start building and running your app in the Space.

Try the demo here: 

* Direct URL to the deployed app: https://jrosell-ambhtmx-crud.hf.space/
* Space URL: https://huggingface.co/spaces/jrosell/ambhtmx.card3d


### Runing the example in Docker

All in one:

```
bash deploy_docker.sh
```

Step by step:

1. Building the ambhtmx-image:

```
docker build -f Dockerfile -t ambhtmx-card3d-image . && 
    docker run -p 7860:7860 --name ambhtmx-card3d-container --rm ambhtmx-card3d-image
```

2. Check the app on http://127.0.0.1:3000

4. Stoping and removing the ambhtmx-card3d-container:

```
docker container rm -f ambhtmx-card3d-container
```

5. Removing the image
```
docker images 'ambhtmx-card3d-image' -a -q
docker rmi ID

## Troubleshooting

If you want to see the logs:

```
docker build -f Dockerfile  --no-cache --progress=plain -t ambhtmx-card3d-image . 2>&1 | tee build.log
```

Check the [known issues](https://github.com/jrosell/ambhtmx/issues), and if you have another issue? Please, [let me know](https://github.com/jrosell/ambhtmx/issues).


git init
git add -A
git branch -M main
git remote add origin git@github.com:jrosell/ambhtx.card3d.git
git remote add hg git@hf.co:spaces/jrosell/ambhtmx.card3d
git remote -v
git remote set-url --add --push origin git@github.com:jrosell/ambhtmx.card3d.git
git remote set-url --add --push origin git@hf.co:spaces/jrosell/ambhtmx.card3d
git push -u origin main
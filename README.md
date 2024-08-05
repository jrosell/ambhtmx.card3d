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

When you pushing a repository to a Hugging Face Spaces with the option to deploy Dockerfile and include a Dockerfile, Hugging Face will start building and running your app in the Space.

Try the demo here: 

* Direct URL to the deployed app: https://jrosell-ambhtmx-card3d.hf.space/
* Space URL: https://huggingface.co/spaces/jrosell/ambhtmx.card3d


If you have a repo with git enabled with a github hf remote configured, you can run:

```
bash deploy_hf.sh
```

For example, you can adapt this for your gh and hf repos:

```
git init
git add -A
git commit -m "My changes"
git remote add origin git@github.com:jrosell/ambhtmx.card3d.git
git remote add gh git@github.com:jrosell/ambhtmx.card3d.git
git remote add hf git@hf.co:spaces/jrosell/ambhtmx.card3d
git push --set-upstream gh main
git push --set-upstream hf main
```


### Runing the example in Docker

All in one command:

```
bash deploy_docker.sh
```

It will run:

```
(docker container rm -f ambhtmx-card3d-container || true)\
		&& (docker rmi $(docker images --format '{{.Repository}}:{{.ID}}'| egrep 'ambhtmx-card3d' | cut -d':' -f2 | uniq) --force || true) \
		&& docker build -f Dockerfile -t ambhtmx-card3d-image . \
		&& docker run --env-file=.Renviron -p 7860:7860 --name ambhtmx-card3d-container --rm ambhtmx-card3d-image
```


## Troubleshooting

If you want to see the logs:

```
docker build -f Dockerfile  --no-cache --progress=plain -t ambhtmx-card3d-image . 2>&1 | tee build.log
```

Check the [known issues](https://github.com/jrosell/ambhtmx/issues), and if you have another issue? Please, [let me know](https://github.com/jrosell/ambhtmx/issues).


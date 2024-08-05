(docker container rm -f ambhtmx-card3d-container || true)\
		&& (docker rmi $(docker images --format '{{.Repository}}:{{.ID}}'| egrep 'ambhtmx-card3d' | cut -d':' -f2 | uniq) --force || true) \
		&& docker build -f Dockerfile -t ambhtmx-card3d-image . \
		&& docker run --env-file=.Renviron -p 7860:7860 --name ambhtmx-card3d-container --rm ambhtmx-card3d-image
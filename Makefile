run:
	docker run -it \
	  --rm \
	  --hostname="$(hostname)" \
      --env="WINEARCH=win64" \
      --env="WINEPREFIX=/home/wineuser/.wine" \
	  --env="DISPLAY=host.docker.internal:0" \
	  --volume="${HOME}/wineuser:/home/wineuser" \
	  scottyhardy/docker-wine /bin/bash
UID=`id -u ${USER}`
DOCKER_RUN=docker run -it --user ${UID} -v `pwd`/app:/app -p 80:3000/tcp point212/dive_in_rails

build-image:
	docker build \
	    --build-arg USER=${USER} \
	    --build-arg UID=${UID} \
	    -t point212/dive_in_rails \
	    -f app/Dockerfile.development \
	    app

install-rails:
	${DOCKER_RUN}  /bin/sh -c "cd /app && gem install rails bundle bundler tzinfo-data"

make-app:
	${DOCKER_RUN}  /bin/sh -c "cd / && rails new app"

sh:
	${DOCKER_RUN} /bin/sh

root-sh:
	docker -D run -it -v `pwd`/app:/app point212/dive_in_rails /bin/sh


run:
	${DOCKER_RUN}   /bin/sh -c "cd /app && rails s -b 0.0.0.0"

up:
	docker-compose run dive_in_rails
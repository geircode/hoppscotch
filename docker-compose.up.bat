cd %~dp0

echo GITHUB_TOKEN: %GITHUB_TOKEN%

docker rm -f hoppscotch-1

docker volume rm hoppscotch_appdata

docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable hoppscotch_network

docker-compose -f docker-compose.yml build --no-cache

docker-compose -f docker-compose.yml up -d --remove-orphans
REM wait for 1-2 seconds for the container to start
pause
docker exec -it hoppscotch-1 /bin/bash
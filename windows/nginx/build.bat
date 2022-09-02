docker build -f .\Dockerfile --build-arg NVER=1.22.0 -t lifeym/nginx:stable .
docker build -f .\Dockerfile --build-arg NVER=1.23.1 -t lifeym/nginx:latest .

docker push lifeym/nginx:stable
docker push lifeym/nginx:latest
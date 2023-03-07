Docker hello world

run the following command in the app directory:
sudo docker build -t getting-started .
this builds the current docker image

then, run the following command to start the docker image:
sudo docker run -dp 3000:3000 getting-started
then, go to http://localhost:3000 to see the app

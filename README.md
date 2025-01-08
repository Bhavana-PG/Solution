# Part 1:
#Generate the CSV File

touch gencsv.sh

./gencsv.sh 2 4

docker run -d --name csvserver -v "$(pwd)/inputFile:/csvserver/inputdata" infracloudio/csvserver:latest

#To run the docker container with the csv file

docker run -d --name csvserver \
    -v "$(pwd)/inputFile:/csvserver/inputdata" \
    -e CSVSERVER_BORDER=Orange \
    -p 9393:9300 \
    infracloudio/csvserver:latest

#To get inside the container and to get the port number

docker exec -it csvserver sh

netstat -tuln

#Fetch the raw data

curl -o ./part-1-output http://localhost:9393/raw

#Stop and delete the container

docker stop csvserver

docker rm csvserver


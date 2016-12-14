#Manual for REST and Content Server Containers

##Step by Step Instruction

1. Set external IP variable.
 
	```
	export ExternalIP=<DOCKER_HOST_IP>
	```

2. Start CS container

	```
	docker-compose up -d cs
	```

3. Start method server

	```
	docker exec -d -it ubuntupgcs bash -c "/home/dmadmin/dctm/wildfly9.0.1/server/startMethodServer.sh"
	```

4. Get dfc.properties from CS container for REST

	```
	docker cp ubuntupgcs:/home/dmadmin/dctm/config/dfc.properties rest/config/
	```

5. Start REST container


	```
	docker-compose up -d rest
	```

6. Check the REST services

	```
	curl http://localhost:8080/dctm-rest/repositories/
	
	//or
	 
	curl http://<DOCKER_HOST_IP>:8080/dctm-rest/repositories/
	```

7. Start xPlore

	```
	docker-compose up -d primary
	```

   Use browser to visit URL http://localhost:9300/dsearch or http://<DOCKER_HOST_IP>:9300/dsearch, select index agent mode and start it.

8. Start CPS

	```
	docker-compose up -d cps
	```

9. Start index agent

	```
	docker-compose up -d indexagent
	```

   Use browser to visit URL http://localhost:9200/IndexAgent or 
   http://<DOCKER_HOST_IP>:9200/IndexAgent, select index agent mode and start it.
   *Credential is dmadmin/password.*

10. Test full text search

	```
	http://localhost:8080/dctm-rest/repositories/ubuntudb/search?q=dmadmin
	 
	//or
	 
	curl http://<DOCKER_HOST_IP>:8080/dctm-rest/repositories/ubuntudb/search?q=dmadmin
	```

##Script
There is a script to launch the suite, 

Run the script `./cs-rest-xplore.sh`. It will take several minutes to start.
If you don
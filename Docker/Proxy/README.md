###Actualmente el servidor squid se activsa, y se logra crear contenedores de docker usando volumen y gurdando
informacion sobre nuestros cambios en squid. el comando parea crear nuevos contenedores usando un volumen creado es:

docker run -p 3128:80 -v proxyProbando:/etc/squid/ --detach --name proxy1 datadog/squid:latest

Aunque el volumen no se cree antes de ejecutar el comando, el volumen automaticamente se crea al ejecutar este codigo

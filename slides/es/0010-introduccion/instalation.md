### Instalación

* Usando `.war`
* Linux
* Windows
* MacOS
* Usando docker
* Usando docker in docker

^^^^^^

#### Instalación usando `.war`

* Descargar el fichero .war
* En una terminal ejecutar el comando:
  ```bash
  > java -jar jenkins.war --httpPort=8080.
  ```
* Abrir el navegador y acceder a `http://localhost:8080`


notes:

([ver documentación](https://jenkins.io/doc/book/installing/#war-file))


^^^^^^
#### Instalación usando `.war`


```
...
...
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been 
created and a password generated.
Please use the following password to proceed to installation:

874ca566f02243eabc92226d921756a8

This may also be found at: /home/theuser/.jenkins/secrets/initialAdminPassword

*************************************************************
*************************************************************
```

^^^^^^
#### Instalación usando `.war`

![Unlock Jenkins](/slides/images/es/0010/unlock_jenkins.png)<!-- .element: class="plain" -->


^^^^^^
#### Instalación usando `.war`

![Install selected plugins](/slides/images/es/0010/install_suggested_plugins.png)<!-- .element: class="plain" -->

notes:

Se recomienda la opción para instalar los plugins recomendados. Esta opción instala una batería de plugins
estándar que nos permitirá empezar a trabajar con la herramienta sin demasiado esfuerzo.

Una vez hayas cogido práctica con la herramienta, estarás en mejores condiciones para usar la opción manual
y seleccionar únicamente los plugins que necesites.

^^^^^^
#### Instalación usando `.war`

![Installing plugins](/slides/images/es/0010/installing_plugins.png)<!-- .element: class="plain" -->

^^^^^^
#### Instalación usando `.war`

![Create admin user](/slides/images/es/0010/create_first_admin_user.png)<!-- .element: class="plain" -->

^^^^^^
#### Instalación usando `.war`

![Instance configuration](/slides/images/es/0010/instance_configuration.png)<!-- .element: class="plain" -->

^^^^^^
#### Instalación usando `.war`

![Jenkins is ready](/slides/images/es/0010/jenkins_is_ready.png)<!-- .element: class="plain" -->

^^^^^^
#### Instalación usando `.war`

![Jenkins is ready](/slides/images/es/0010/jenkins_home.png)<!-- .element: class="plain" -->

^^^^^^
#### Instalación en Linux

Jenkins se puede instalar usando `apt` o `rpm`

^^^^^^
##### Instalación en Debian / Ubuntu


```bash
> wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
> sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
> sudo apt-get update
> sudo apt-get install jenkins
```

notes:

([ver documentación](https://jenkins.io/doc/book/installing/#debianubuntu))



^^^^^^
##### Instalación en Debian / Ubuntu


* Configura Jenkins para que se levante como un demonio al arranque (ver /etc/init.d/jenkins para más detalles)
* Crea el usuario `jenkins` para ejecutar el servicio
* Direcciona la salida de la consola de log al fichero `/var/log/jenkins/jenkins.log`
* Añade el fichero `/etc/default/jenkins` con los parámetros de arranque de jenkins (JENKINS_HOME, etc)
* Configura Jenkins para escuchar en el puerto 8080

^^^^^^
##### Instalación en Debian / Ubuntu

* Editar el fichero `/etc/default/jenkins` y cambiar el valor de HTTP_PORT si queremos que arranque en otro puerto

^^^^^^
##### Instalación en Fedora

```bash
> sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
> sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
> sudo dnf upgrade && sudo dnf install jenkins java
> sudo service jenkins start
> sudo chkconfig jenkins on
```

notes:

([ver documentación](https://jenkins.io/doc/book/installing/#fedora))


^^^^^^
##### Instalación en Fedora

Utilizar el siguiente comando para verificar que está correctamente instalado:

```bash
> systemctl status jenkins
```

^^^^^^
#### Instalación en Windows

Dispone de un instalador para windows:

* Descartar la [última versión](http://mirrors.jenkins.io/windows/latest)
* Seguir las instrucciones de instalación


^^^^^^
#### Instalación en MacOS

Se recomienda la instalación usando [`Homebrew`](https://brew.sh/)

* Instala la última versión LTS: `brew install jenkins-lts``
* Inicia el servicio de Jenkins: `brew services start jenkins-lts`
* Reinicia el servicio de Jenkins: `brew services restart jenkins-lts`
* Actualiza la versión de Jenkins: `brew upgrade jenkins-lts`

notes:

([ver documentación](https://jenkins.io/download/lts/macos/))

^^^^^^
#### Instalación usando Docker


```bash
docker run --rm \ 
       -v $(pwd)/jenkins_home:/var/jenkins_home \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -p "8080:8080"  \
       jenkins/jenkins:2.213-alpine
```

^^^^^^
#### Instalación usando Docker

⚠️ CUIDADO

se está exponiendo el socket de docker dentro del contenedor de jenkins con las implicaciones
de seguridad que esto tiene

[Más información](https://raesene.github.io/blog/2016/03/06/The-Dangers-Of-Docker.sock/) 

^^^^^^
#### Instalación usando Docker

Para evitar este problema, se recomienda usar `Docker in Docker` para acceder a docker desde el contenedor de Jenkins

^^^^^^
#### Instalación usando Docker

¿Porqué necesitamos acceder a docker desde Jenkins?

**Para poder utilizar toda la potencia de los contenedores desde Jenkins**


^^^^^^
#### Instalación usando Docker In docker 

Las siguientes diapositivas son un resumen de la documentación que puede encontrarse 
[en este enlace](https://jenkins.io/doc/book/installing/#downloading-and-running-jenkins-in-docker)

^^^^^^
#### Instalación usando Docker In docker 

Creamos una red específica para jenkins

```bash
docker network create jenkins
```

^^^^^^
#### Instalación usando Docker In docker 

Creamos dos contenedores

Uno para almacenar los datos de jenkins:

```bash
docker volume create jenkins-data
```

Otro para almacenar los certificados necesarios de docker

```bash
docker volume create jenkins-docker-certs
```

^^^^^^
#### Instalación usando Docker In docker 

Levantar un contenedor con la imagen `docker:did`

```bash
docker container run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind
```

notes:

* `--name` Asigna el nombre `jenkins-docker` al contenedor en lugar del nombre por defecto que le asignaría docker
* `--rm` Elimina el contenedor cuando lo paremos
* `--detach` Ejecuta el contenedor en segundo plano
* `--privileged` En el momento de escribir este arículo, Docker in Docker requiere esta opción para 
  funcionar correctamente. Esto puede cambiar en futuras versiones del kernel de Linux.
* `--network` Conectamos el contenedor a la red que hemos creado antes
* `--network-alias` Permite que podamos acceder a este contenedor 
  dentro de la red de docker usando el nombre de host `docker`
* `--env` Fija la variable de entorno DOCKER_TLS_CERTDIR en la que indicamos dónde se generarán y compartirán
  los certificados de docker
* `--volume` Montamos los volúmenes creados con anterioridad para que sean accesibles dentro del contenedor
* `--publish` Expone `dockerd` en el host a través del puerto 2376. Útil si queremos acceder a este demonio
  desde el host. En caso contrario se puede omitir.


^^^^^^
#### Instalación usando Docker In Docker 

Ejecutar un contenedor con la imagen de Jenkins
```bash
docker container run \
  --name jenkins \
  --rm \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenkins/jenkins:2.213-alpine
```

notes:

* `--name` Asigna el nombre `jenkins` al contenedor en lugar del nombre por defecto que le asignaría docker
* `--rm` Elimina el contenedor cuando lo paremos
* `--detach` Ejecuta el contenedor en segundo plano
* `--network` Conectamos el contenedor a la red que hemos creado antes
* `--env` Utilizando variables de entorno, configura cómo se conectará jenkins a docker
* `--volume` Montamos los volúmenes creados con anterioridad para que sean accesibles dentro del contenedor.
* `--publish` Expone los puertos 8080 y 5000 para acceder a jenkins desde el host 



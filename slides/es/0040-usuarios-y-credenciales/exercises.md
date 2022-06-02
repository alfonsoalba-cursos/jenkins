### Ejercicios

#### 💻️ Ejercicio 1: Authorize Project Plugin

Instalar y configurar el plugin [Authorize Project Plugin](https://plugins.jenkins.io/authorize-project/)

notes:

Una vez instalado el plugin, vamos a "Manage Jenkins" -> "Configure Global Security" y aparecerá una nueva sección:

![access_controls_for_builds](/slides/images/es/0040/exercises_access_controls_for_builds.png)

Una vez configurada esta opción, dentro de las tareas podremos configurar los permisos con los que se ejecutará
el build. 

^^^^^^

#### 💻️ Ejercicio 2

En la tarea que creamos en el módulo anterior, se genera un ejecutable. Almacenando
credenciales, sube este fichero a la máquina virtual de alguno de los compañeros.

¿tienes cuenta en Dropbox? Sube el ejecutable a Dropbox también.

^^^^^^

#### 💻️ Ejercicio 3

Crear un usuario para gestionar los credenciales de los proyectos. El resto de usuarios
sólo podrán utilizarlos, pero no podrán crear nuevos credenciales.

^^^^^^

#### 💻️ Ejercicio 4

Configurar el envío de notificaciones por email.

^^^^^^

#### 💻️ Ejercicio 5

Aparte de los métodos de autorización explicados en este módulo, existen otras formas de gestionar
los permisos facilitadas por plugins.

^^^^^^

#### 💻️ Ejercicio 5

Utilizando el plugin [Role-based Authorization Strategy](https://plugins.jenkins.io/role-strategy/), implementar
lo siguiente: 
* Equipo 1: puede ver y acceder a los proyectos de la carpeta "Equipo 1"
* Equipo 2: puede ver y acceder a los proyectos de la carpeta "Equipo 2"
* Crear usuarios para cada equipo y verificar que efectivamente cada uno de ellos sólo 
  ve la carpeta que le corresponder

^^^^^^

#### 💻️ Ejercicio 6

El plugin [Credential Bindings](https://plugins.jenkins.io/credentials-binding/) que viene instalado en 
Jenkins por defecto, permite acceder a los credenciales a través de variables de entorno.

En la tarea en la que nos conectamos a Github para descargarnos el repositorio, utilizar la opción 
"Use secret text(s) or file(s)" para mostrar en el log toda la información del credencial.

😱

notes:

Más información:

* [Configuring and Securing Credentials in Jenkins](https://www.cyberark.com/threat-research-blog/configuring-and-securing-credentials-in-jenkins/)
* [Untangling Jenkins](https://www.conjur.org/blog/untangling-jenkins/)

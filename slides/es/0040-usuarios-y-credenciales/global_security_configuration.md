### Configuración Global de Seguridad

Para acceder ir a:

![Go to Global Security Configuration](/slides/images/es/0040/go_to_configure_security.png)<!-- .element: class="plain" -->

^^^^^^

#### Configuración Global de Seguridad


![Access Control](/slides/images/es/0040/configure_security_access_control.png)<!-- .element: class="plain" -->

notes:

Desde esta pantalla podemos:

* Activar el botón "Remember me" en la página de login
* Cambiar la base de datos de usuarios:
  * Usuarios de Jenkins (por defecto)
  * LDAP
  * Unix (/etc/passwd y /etc/shadow)
  * Delegar la seguridad al contenedor de Servlets. Este era el comportamiento de Jenkins por defecto hasta la
    versión 1.163. Este modo resulta útil en dos situaciones: i) cuando heredas una instalación de Jenkins con una versión
    1.163 o anterior y quieres seguir manteniendo el mismo comportamiento y ii) tienes un contenedor de Servlets
    con la configuración de Seguridad adecuada y quieres que Jenkins lo use. En otros casos, es mejor utilizar
    alguno de los métodos anteriores.
* Permitir el registro libre de usuarios
* Configurar el modelo de permisos (Authorization)

^^^^^^
    
#### Configuración Global de Seguridad: permisos
 
Por defecto, vemos que cualquier usuario nuevo que creemos tendrá privilegios para todo.

^^^^^^
    
#### Configuración Global de Seguridad: permisos

Tenemos las siguientes opciones:
* Usuarios autenticados tienen privilegios para todo: Opción por defecto
* Modo 'legacy': Commportamiento de Jenkins < 1.164
* Cualquiera puede hacer cualquier acción: Si se marca esta opción todo el mundo tiene permiso para hacer 
  todo, incluso usuarios anónimos
  
notes:

**Modo 'legacy'**: el administrador tiene permiso para hacer todo. El resto de usuarios sólo tienen
permiso de lectura.
 
**Cualquiera puede hacer cualquier acción**: Esta configuración es útil en entornos de alta confianza, como por ejemplo una intranet. Permite que los usuarios
puedan hacer cualquier operación sin necesidad de acceder al sistema. Cuidado porque si se selecciona esta
opción lo más probable es que nadie se acuerde de acceder y todas las operaciones aparezcan realizadas por
el usuario anónimo. Tiene una utilidad limitada, aunque es bueno saber que existe esta opción.
  
^^^^^^
    
#### Configuración Global de Seguridad: Configuración de seguridad

* Configuración de seguridad: Crea una matriz de permisos global que se aplica a todos los usuarios

![Global Security Authorization Matrix](/slides/images/es/0040/global_security_authorization_matriz.png)<!-- .element: class="plain" -->

^^^^^^
    
#### Configuración Global de Seguridad: Configuración de seguridad

* Los permisos son acumulativos: si un usuario  X está en los grupos A, B, y C, 
  los permisos serán la unión de todos los permisos dados a X, A, B, C, y el usuario anónimo.
  
^^^^^^

#### Configuración Global de Seguridad: Configuración de seguridad

* La base de datos de Jenkins no gestiona grupos
* Estos sólo se usan cuando se usa como base de datos LDAP o los usuarios y grupos del sistema
  
^^^^^^

### 💻️ Práctica: Crear usuario administrador

![Create admin user](/slides/images/es/0040/create_admin_user.png)<!-- .element: class="plain" -->


^^^^^^

#### 💻️ Práctica: Crear usuario administrador

1. Crear los permisos para el usuario administrador
1. Salir y acceder como otro usuario
2. Ver que como ese usuario podremos:
   * Crear tareas nuevas
   * Gestionar las tareas ya existentes, incluso borrarlas 
  
^^^^^^

#### Configuración Global de Seguridad: Configuración de seguridad

![Authorization Matrix Warning](/slides/images/es/0040/authorization_matrix_warning.png)

notes:

Cuando activamos la configuración de seguridad se nos muestra este aviso.

Cuando jenkins lanza una ejecución, lo hace con el usuario virtual SYSTEM que tiene todos los permisos por defecto.
Si un usuario tiene por ejemplo acceso restringido a la tarea A, pero puede configurar otras tareas o crear nuevas, 
este usuario podría crear la tarea B y hacer que esta al terminar lance la tarea A

La solución a este problema es utilizar algún plugin que permita configurar el control de acceso a las ejecuciones,
como por ejemplo [Authorize Project Plugin](https://plugins.jenkins.io/authorize-project). 

[Más información](https://jenkins.io/doc/book/system-administration/security/build-authorization/)

^^^^^^

#### Configuración Global de Seguridad: Estrategia de seguridad para el proyecto

![Authorization Matrix For Projects](/slides/images/es/0040/authorization_matrix_for_projects.png)

notes:

Como habrás notado, se parece mucho a la matriz de permisos que nos aparecía en la opción 
"configuración de seguridad"

¿En qué se diferencia?...

^^^^^^

#### Configuración Global de Seguridad: Estrategia de seguridad para el proyecto

* Cada tarea tiene su propia matriz de permisos de forma que podemos configurar
 quién tiene acceso y quién no
* Los permisos configurados aquí se sumarán a los permisos definidos en cada proyecto

^^^^^^

### 💻️ Práctica: Permisos por proyecto

* Crear un usuario administrador
* Crear un usuario que pueda 
  * crear, administrar y ejecutar sus tareas
  * ver todas las demás

^^^^^^

#### 💻️ Práctica: Permisos por proyecto

![Authorization Matrix for Projects 1](/slides/images/es/0040/authorization_matrix_for_projects_example_1.png)

notes:

* Creamos el usuario administrador
* Damos permiso de lectura y creación de tareas a los usuarios autenticados. De esta forma
  ven todo pero sólo podrán acceder a aquellos
  
^^^^^^

#### 💻️ Práctica: Permisos por proyecto

Si accedemos como usuario no administrador, veremos los proyectos y podremos crear nuevos

![Authorization Matrix for Projects 1](/slides/images/es/0040/authorization_matrix_for_projects_example_2.png)

^^^^^^

#### 💻️ Práctica: Permisos por proyecto

Si entramos a un proyecto ya existente, vemos que no podemos hacer nada ¡sólo verlo!

![Authorization Matrix for Projects 3](/slides/images/es/0040/authorization_matrix_for_projects_example_3.png)

^^^^^^

#### 💻️ Práctica: Permisos por proyecto

Al crear una tarea nuevo, podremos asignarle permisos:

![Authorization Matrix for Projects 4](/slides/images/es/0040/authorization_matrix_for_projects_example_4.png)

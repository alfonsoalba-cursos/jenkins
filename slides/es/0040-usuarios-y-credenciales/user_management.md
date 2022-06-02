### Gestión de usuarios

Es importante que cada usuario tenga su propia cuenta en Jenkins:
* Auditoría y trazabilidad
* Control de acceso
  
notes:

Un error común cuando los equipos se inician en Jenkins es el de crear una única cuenta para
el equipo de desarrollo y compartirla entre los diferentes miembros del equipo.

La creación de cuentas separadas para cada miembro permite:

* Auditar quién hizo qué dentro del sistema de integración o despliegue contínuo.

  Ten en cuenta que muchas veces Jenkins se configura para que realice despliegues automáticos.
  Poder auditar estas acciones y saber quién lo hizo es fundamental para descubrir errores y depurarlos
  con mayor celeridad

* Control de acceso: el sistema de permisos de Jenkins permite controlar qué usuarios pueden hacer qué cosas,
  limitando el acceso a recursos y credenciales
  
  
^^^^^^

#### Gestión de usuarios: Listado de usuarios

Ir a "Administrar Jenkins" -> "Gestión de usuarios"

![user management](/slides/images/es/0040/user_management.png)<!-- .element: class="plain" -->


^^^^^^

#### Gestión de usuarios: Crear un usuario

![create user](/slides/images/es/0040/create_user.png)<!-- .element: class="plain" -->

^^^^^^

#### Gestión de usuarios: Crear un usuario

Como veremos en breve, por defecto los usuarios creados tienen todos los permisos dentro de Jenkins.

notes:

En la siguiente sección dentro de este módulo, veremos cómo cambiar este comportamiento.

^^^^^^

#### Gestión de usuarios: Editar un usuario

![edit user: status](/slides/images/es/0040/edit_user_status.png)<!-- .element: class="plain" -->


notes:

Al editar un usuario, podemos seleccionar en el menú de la izquierda diferentes opciones:
* Ejecuciones: muestra todas las ejecuciones que han sido lanzadas por un usuario
* Configurar: Acceso a la configuración de la cuenta del usuario
* Borrar el usuario

^^^^^^

#### Gestión de usuarios: Ejecuciones

![edit user: builds](/slides/images/es/0040/edit_user_builds.png)<!-- .element: class="plain" -->

^^^^^^

#### Gestión de usuarios: Configurar

![edit user: configure](/slides/images/es/0040/edit_user_configure.png)<!-- .element: class="plain" style="height: 50vh" -->

notes:

* Clave del API (Token): Token que permite hacer llamadas desde Jenkins CLI o la API REST de Jenkins
* Credenciales: Los credenciales que pertenecen a este usuario (aparecerá vacío de momento ya que todavía
  no hemos creado ninguno)
* Notification URL: el usuario puede seleccionar la interfaz de usuario por defecto a la que le redirigen las
  notificaciones. Es decir, cuando se recibe una notificación por email o slack por ejemplo, la URL que se
  recibe será la que aquí se configure.
* Contraseña: permite cambiar la contraseña del usuario
* SSH Public Keys: Claves públicas de este usuario. Se utilizan por ejemplo por Jenkins CLI para autenticar
  un usuario
* Session Termination: Permite cerrar todas las sesiones que tenga abiertas un usuario
* Setting for search: Configura cómo queremos que se comporte el buscador
* User Defined Time Zone: huso horario para mostrar las fechas a este usuario
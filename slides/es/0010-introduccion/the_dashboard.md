### El panel

![Jenkins Dashboard](/slides/images/es/0010/jenkins_dashboard.png)<!-- .element: class="plain" -->


^^^^^^

#### Cambiando la descripción

![Change Description](/slides/images/es/0010/change_description.png)<!-- .element: class="plain" -->

^^^^^^

#### Menú del usuario

![Change Description](/slides/images/es/0010/user_menu.png)<!-- .element: class="plain" -->


notes:

* Ejecuciones (Builds): lista todas las ejecuciones que han sido lanzadas por el usuario
* Configurar: Acceso a la configuración de nuestro perfil. Aquí podemos definir el huso horario con el que queremos 
  ver las fechas y horas del panel
* Vistas:
* Credenciales: acceso a las credenciales de Jenkins (solo visibles si este usuario puede acceder a ellas)

^^^^^^

#### Menú principal

![Main Menu](/slides/images/es/0010/main_dashboard_menu.png)<!-- .element: class="plain" -->

notes:

* Nueva tarea: Crea una nueva tarea, que puede ser un trabajo, un pipeline, etc
* Personas: Lista los usuarios que tienen acceso a esta instancia de jenkins
* Historial de trabajos: Muestra todas las ejecuciones
* Administrar Jenkins: Acceso a la administración de Jenkins
* Mis vistas: Lista las vistas del usuario que ha accedido al sistema
* Lockable resources: Esta sección aparece cuando se instala el plugin 
  [`Lockable Resources Plugin`](https://wiki.jenkins.io/display/JENKINS/Lockable+Resources+Plugin). Este plugin permite
  definir recursos (una impresora, un teléfono o una máquina) y luego utilizar estos recursos en las ejecuciones. 
  Por ejemplo, si en una ejecución se está usando uno de estos recursos y este queda bloqueado, cualquier
  otra ejecución que use este recurso se quedará en pausa hasta que este se libere.
* Credentials: Lista los usuarios y los credenciales almacenados en el sistema
* New View: Permite crear una nueva vista

^^^^^^

#### Acceso a la API REST y versión de jenkins

![REST API and version](/slides/images/es/0010/rest_api_and_version.png)<!-- .element: class="plain" -->


notes:


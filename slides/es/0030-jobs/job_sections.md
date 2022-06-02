### Secciones de una tarea de tipo estilo libre

![sections_of_a_free_style_project](/slides/images/es/0030/sections_of_a_free_style_project.png)<!-- .element: class="plain" -->

* [General](/#freestyle_general_section)
* [Origen del código fuente](/#freestyle_source_code_section)
* [Disparadores de la ejecución](/#freestyle_build_triggers_section)
* [Entorno de ejecución](/#freestyle_build_environment_section)
* [Ejecutar](/#freestyle_build_section)
* [Acciones para después de ejecutar](/#freestyle_post_build_actions_section)

notes:

Un proyecto de estilo libre es el más versatil de Jenkins. Consiste en una serie de operaciones que se ejecutan secuencialmente. 

Este tipo de proyectos se utilizan habitualmente para ejecutar tareas como por ejemplo:
* Ejecutar tests
* Compilar y empaquetar nuestra aplicación
* Generar informes y distribuirlos por correo electrónico o slack
* Incluso ejecutar comandos de shell que necesitemos para conseguir nuestro objetivo 

Revisaremos las diferentes secciones de una tarea de estilo libre en las siguientes diapositivas.

^^^^^^
<!-- .element: id="freestyle_general_section" -->
### Secciones: General

![freestyle_general_section](/slides/images/es/0030/freestyle_general_section.png)<!-- .element: class="plain" -->


^^^^^^

#### Secciones: General

**Desechar ejecuciones antiguas**: Si marcamos esta opción, podemos desechar ejecuciones anteriores. Se pueden seguir dos criterios:
* Borrar por antiguedad
* Mantener un número fijo de ejecuciones

^^^^^^

#### Secciones: General

**Esta ejecución debe parametrizarse**: Permite pasar parámetros a la ejecución. Lo veremos más adelante dentro de este mismo módulo

^^^^^^

#### Secciones: General

**GitHub project**: Conecta esta tarea a un repositorio de github. Esto nos dará un enlace al repositorio en github desde la página de inicio de la tarea


^^^^^^

#### Secciones: General

**This build requires lockable resources**: Marca esta opción si esta tarea necesita bloquear algún tipo de recurso

Recuerda que si una ejecución bloquea un recurso, cualquier otra tarea que 
requiera de este recurso quedará suspendida hasta que la tarea que lo está utilizando termine


^^^^^^

#### Secciones: General

**Throttle builds**: obliga a que pase un determinado tiempo entre ejecuciones de una tarea


^^^^^^

#### Secciones: General

**Desactivar la ejecución** Si se marca esta casilla, no se lanzarán ejecuciones de esta tarea. Útil, por ejemplo, si necesitamos
hacer mantenimiento de la base de datos y no queremos que ciertas tareas se ejecuten mientras lo hacemos


^^^^^^

#### Secciones: General

* **Lanzar ejecuciones concurrentes en caso de ser necesario**: Por defecto, solo se puede lanzar una ejecución simultánea de un proyecto
* Esta opción permite lanzar ejecuciones concurrentemente en función del número de `executors` disponibles
* Si se intentan lanzar más ejecuciones de las permitidas, las nuevas quedarán suspendidas hasta que alguna de las que se están ejecutando termine y se liberen `executors`

^^^^^^

#### Secciones: General - opciones avanzadas

![free_style_general_section_advanced](/slides/images/es/0030/free_style_general_section_advanced.png)<!-- .element: class="plain" -->

^^^^^^

#### Secciones: General - opciones avanzadas

* **Periodo de espera**: Si se activa esta opción, cuando se activa una nueva ejecución esta se demorará el tiempo marcado en esta opción.

notes:

Esto permite que si llegan por ejemplo varios pushes al repositorio dentro de este tiempo de espera, en lugar de lanzarse una ejecución
por push, se lanza una ejecución que contiene ya todos los commits.

Esto ahorra recursos y permite que los desarrolladores reciban el feedback más rápido.

^^^^^^

#### Secciones: General - opciones avanzadas

* **Contador de reintentos**: Número de veces que Jenkins intentará contectarse al repositorio para descargarse el código
* Por defecto es cero: la tarea falla si no se puede conectar

^^^^^^

#### Secciones: General - opciones avanzadas

* **Congelar el lanzamiento cuando haya un proyecto padre ejecutándose**: congela la ejecución si una dependencia del proyecto está en ejecución o en cola

^^^^^^

#### Secciones: General - opciones avanzadas

* **Bloquear la ejecución cuando un projecto relacionado está en ejecución**: Bloquea la ejecución si un proyecto hijo está en ejecución o en cola

^^^^^^

#### Secciones: General - opciones avanzadas

* **Utilizar un directorio de trabajo personalizado**: permite seleccionar un `workspace` para ejecutar la tarea en lugar de que Jenkins cree uno.

notes:

¿Cuándo viene bien usar esta funcionalidad?
* Por ejemplo: si tenemos un código en el que las rutas están en código y la ejecución debe lanzarse desde una carpeta determinada. Aunque
  esta no es la situación ideal, Jenkins nos da esta herramienta para poder lidiar con ella
* Otro ejemplo es si en lugar de lanzar una ejecución de un proyecto, estamos sencillamente ejecutando un script como si fuese una
  tarea cron en la máquina que aloja Jenkins. 

Se pueden usar rutas absolutas o relativas `$JENKINS_HOME`

^^^^^^

#### Secciones: General - opciones avanzadas

* **¿Conservar los 'logs' de dependencias de las ejecuciones?**: Si se activa, no se rotarán los logs de la ejecuciones que estén referenciadas 
desde ejecuciones de esta tarea 

notes:

When your job depends on other jobs on Jenkins and you occasionally need to tag your workspace, it's often convenient/necessary 
to also tag your dependencies on Jenkins. The problem is that the log rotation could interfere with this, since the build your project 
is using might already be log rotated (if there have been a lot of builds in your dependency), and if that happens you won't be 
able to reliably tag your dependencies.

This feature fixes that problem by "locking" those builds that you depend on, thereby guaranteeing that you can always tag your complete dependencies.

^^^^^^
<!-- .element: id="freestyle_source_code_section" -->

### Secciones: Origen del código fuente

![freestyle_source_code_section](/slides/images/es/0030/freestyle_source_code_section.png)<!-- .element: class="plain" -->

Configuramos el origen del código fuente. Por defecto podemos seleccionar repositorio de Git o Subversion


^^^^^^
<!-- .element: id="freestyle_build_triggers_section" -->


### Secciones: Disparadores de ejecuciones

![freestyle_build_triggers_section](/slides/images/es/0030/freestyle_build_triggers_section.png)<!-- .element: class="plain" -->

Configuramos qué eventos o cómo se van a lanzar las ejecuciones de esta tarea

^^^^^^

#### Secciones: Disparadores de ejecuciones

* **Lanzar ejecuciones remotas**: permite lanzar ejecuciones a través de una URL
* Útil si queremos hacerlo desde un script por ejemplo

^^^^^^

#### Secciones: Disparadores de ejecuciones

* **Construir tras otros proyectos**: Lanza una ejecución después de que termine la ejecución de alguno de los proyectos seleccionados

notes:

Esta acción es complementaria a la acción "Ejecutar otros proyectos" que tenemos disponible en la sección "acción para ejecutar después"


^^^^^^

#### Secciones: Disparadores de ejecuciones

* **Ejecutar periódicamente**: Permite programar la ejecución periódica utilizando una sintaxis parecida a Cron


^^^^^^

#### Secciones: Disparadores de ejecuciones

* **GitHub hook trigger for GITScm polling**: Lanza la ejecución cuando se recibe una notificación desde Github
* Necesario configurar un hook en Github que haga una llamada a Jenkins cuando se recibe un push

^^^^^^

#### Secciones: Disparadores de ejecuciones

* **Consultar repositorio (SCM)**: consulta el repositorio de forma periódica (polling) para descargarse los cambios


^^^^^^
<!-- .element: id="freestyle_build_environment_section" -->

### Secciones: Entorno de ejecución

![freestyle_build_environment_section](/slides/images/es/0030/freestyle_build_environment_section.png)<!-- .element: class="plain" -->

Configura el entorno en el que se lanzará la ejecución

^^^^^^

#### Secciones: Entorno de ejecución

* **Delete workspace before build starts**: borra el `workspace` antes de comenzar la ejecución
* Por defecto lo borra completa
* Permite ser más selectivo y borrar sólo algunos ficheros

^^^^^^

#### Secciones: Entorno de ejecución

* **Use secret text(s) or file(s)**: hace que los credenciales seleccionados estén dispnibles durante la ejecución como variables de entorno

^^^^^^

#### Secciones: Entorno de ejecución

* **Abortar la ejecución si se atasca**: Permite definir diferentes criterios para abortar una ejecución en caso de que este se quede atascada

^^^^^^

#### Secciones: Entorno de ejecución

* **Add timestamps to the Console Output**: En la salida de consola de la ejecución, muestra un timestamp junto a la ejecución de cada comando

^^^^^^

#### Secciones: Entorno de ejecución

* **Inspect build log for published Gradle build scans**: Si se detecta en el log de la ejecución un `build scan` de `Gradle`, 
se muestra una insignia en la página de la ejecución

^^^^^^

#### Secciones: Entorno de ejecución

* **With Ant**: prepara el entorno para lanzar ejecuciones que utilicen Ant

^^^^^^
<!-- .element: id="freestyle_build_section" -->
### Secciones: Ejecutar 

![freestyle_build_section](/slides/images/es/0030/freestyle_build_section.png)<!-- .element: class="plain" -->

Configuramos los pasos que conforman el proceso de construcción de nuestro proyecto.

^^^^^^
<!-- .element: id="freestyle_post_build_actions_section" -->

### Secciones: Acciones para después de ejecutar

![freestyle_post_build_actions_section](/slides/images/es/0030/freestyle_post_build_actions_section.png)<!-- .element: class="plain" -->

Configuramos las diferentes acciones que queremos que se lleven a cabo después de la ejecución

^^^^^^

#### Secciones: Acciones para después de ejecutar

* **Almacenar firma de ficheros**: activa la firma de ficheros ([`fingerprinting`](https://wiki.jenkins.io/display/JENKINS/Fingerprint))

notes:

La firma de ficheros debe activarse en el proyecto y en cualquier otro proyecto que utilice alguno de los ficheros que se firman.


^^^^^^

#### Secciones: Acciones para después de ejecutar

* **Guardar los archivos generados**: hace que los archivos seleccionados se guarden y se puedan descargar desde la página web de Jenkins

^^^^^^

#### Secciones: Acciones para después de ejecutar

* **Editable Email Notification**: Envía una notificación por email. Los textos de esta notificación se pueden cambiar

^^^^^^

#### Secciones: Acciones para después de ejecutar

* **Notificación por correo**: Envía una notificación por email. Los textos de esta notificación no se pueden cambiar

^^^^^^

#### Secciones: Acciones para después de ejecutar

* **Git Publisher**: permite hacer push de merges, ramas o tags generados durante la ejecución
### Añadir nodos a Jenkins: SSH

<img src="/slides/images/es/0070/master_slaves/master_slaves.001.png" alt="master_slave" class="r-stretch">

notes:

En esta sección vamos a añadir nodos. La máquina virtual que hemos estado usando hasta el momento
actuará como controlador y añadiremos un nodo adicional que será nuestro agente.

^^^^^^

#### Añadir nodos: instalar ssh en el nuevo nodo

* Copiar la máquina virtual
* Configurar una red de tipo _bridge networking_ de manera que ambas máquinas se vean a través de la red
* Instalar y configurar ssh en el agente

```bash 
> sudo apt install ssh
```

^^^^^^
#### Añadir nodos: Añadir credencial de acceso al nuevo nodo

<img src="/slides/images/es/0070/add_nodes_create_credential_step_1.png" alt="add_nodes_create_credential_step_1" class="r-stretch">


^^^^^^
#### Añadir nodos: Añadir credencial de acceso al nuevo nodo

<img src="/slides/images/es/0070/add_nodes_create_credential_step_2.png" alt="add_nodes_create_credential_step_2" class="r-stretch">

^^^^^^
#### Añadir nodos: Añadir credencial de acceso al nuevo nodo

<img src="/slides/images/es/0070/add_nodes_create_credential_step_3.png" alt="add_nodes_create_credential_step_3" class="r-stretch">


^^^^^^

#### Añadir nodos

<img src="/slides/images/es/0070/add_nodes_step_1.png" alt="add_nodes_step_1" class="r-stretch">

notes:

Accedemos a la configuración de Jenkins, en particular a la aplicación para gestionar los nodos de
nuestra infraestructura.

^^^^^^

#### Añadir nodos

<img src="/slides/images/es/0070/add_nodes_step_2.png" alt="add_nodes_step_2" class="r-stretch">

notes:

Aquí tenemos un listado con los nodos que ya forman parte de la infraestructura. En este momento
sólo tenemos el nodo master, que es el que hemos estado usando hasta ahora durante el curso.

^^^^^^

#### Añadir nodos

<img src="/slides/images/es/0070/add_nodes_step_3.png" alt="add_nodes_step_3" class="r-stretch">


^^^^^^

#### Añadir nodos

<img src="/slides/images/es/0070/add_nodes_step_4_1.png" alt="add_nodes_step_4_1" class="r-stretch">

notes:

Algunos comentarios sobre estas opciones de configuración del nodo:

* nombre: Nombre con el que identificaremos el nodo dentro de Jenkins
* Número de `executors`: seleccionaremos dos ejecutores, lo que nos permitirá lanzar dos ejecuciones en
  este nodo
* Directorio raiz: Dónde se almacenarán los ficheros de jenkins. No hace falta tener privilegios de root. 
  Para el curso pondremos los ficheros de Jenkins en la carpeta `/home/jks/jenkins`. Un lugar más adecuado
  en un agente en un sistema en producción sería `/var/jenkins`. El usuario con el que nos conectemos al
  nodo deberá tener permiso de escritura, lectura y ejecución sobre esta carpeta
* Etiquetas: palabras clave que identifican este nodo, separadas por **espacios**. Conviene evitar caracteres 
  especiales como `!&|<>(),` ya que tendremos problemas con las expresiones que filtran los agentes por etiqueta
  
  Las etiquetas nos permiten seleccionar los agentes que pueden ejecutar ciertas tareas. Por ejemplo, si tenemos
  varios agentes etiquetados como `windows`, podemos hacer que ciertas tareas se ejecuten sólo en agentes
  que tengan esta etiqueta
* Usar: define la política de Jenkins para utilizar este nodo. Tenemos dos opciones:
  * Utilizar este nodo tanto como sea posible: siempre que Jenkins pueda planificar una ejecución en este nodo,
    lo hace. Este es el comportamiento por defecto
  * Dejar este nodo para ejectuar solamente tareasv vinculadas a él: sólo ejecuta tareas en este nodo cuando
    las tareas requieran que los nodos tengan ciertas etiquetas y este nodo cumpla con ese requerimiento. Esto
    se puede usar para:
    * Limitar el tipo de tarea que se ejecuta en cada nodo
    * Combinado con un número de `Executors` de 1, garantizar que sólo una tarea de un tipo se ejecuta en este nodo.
      Esto puede ser útil para hacer pruebas de rendimiento o _benchmarking_
 
 
^^^^^^
 
#### Añadir nodos
 
<img src="/slides/images/es/0070/add_nodes_step_4_2.png" alt="add_nodes_step_4_2" class="r-stretch">

notes:

**Métodos de ejecución**: Para este primer ejemplo usaremos _Arrancar agentes remotos en máquinas Unix vía SSH_.

A continuación comentaremos los métodos para conectarnos por SSH a los agentes.
* Nombre de máquina: IP nombre del agente
* Credenciales: los credenciales que usaremos para acceder a la máquina. Seleccionaremos los que hemos creado
  en el paso anterior 'ssh-jenkins-agent'. Si no lo hemos creado previament,e, podemos crearlo desde aquí 
* Host Key Verification Strategy: Controla cómo Jenkins verifica la identidad de la máquina cliente. Disponemos
  de las siguientes opciones:
  * Known hosts file Verification Strategy: la identidad del agente se valida contra el fichero `~/.ssh/known_hosts`
    del usuario con el que se ejecuta Jenkins
  * Manually provided key Verification Strategy: incluimos la clave SSH del servidor de manera manual
  * Manually trusted key Verification Strategy: Permite que en la primera conexión un usuario valide la
    clave del servidor. Para ello, el usuario debe tener el permiso `Computer.CONFIGURE` y debe marcarse 
    la opción "Require manual verification of initial connection"
  * Non Verifying Verification Strategy: no verifica el agente 

En este curso utilizaremos la conexión por SSH para conectarnos con los agentes.

En el [siguiente enlace](https://github.com/jenkinsci/ssh-slaves-plugin/blob/master/doc/CONFIGURE.md)
puedes acceder a la página del plugin SSH Slaves Plugin con la información detallada de todas estas opciones. 

**Disponibilidad**: Controla cuándo Jenkins levanta o para este nodo

* _Keep this agent online as much as possible_: Jenkins mantiene este nodo en línea la mayor cantidad posible de tiempo. 
  Si se pierde conexión con el agente, por ejemplo por un fallo de red, Jenkins verificará periódicamente si
  el agente vuelve a estar disponible 
* _Bring this agent online and offline at specific times_: Permite programar cuándo queremos que este nodo
  esté disponible y durante cuánto tiempo.
  
  <img src="/slides/images/es/0070/add_nodes_availability_scheduled.png" alt="" class="r-stretch">  
  
  Si el agente se cae durante el tiempo en que debería estar online, Jenkins intenta reiniciarlo periódicamente.

  Una vez haya pasado el número de minutos en los que el agente debe estar levantado, Jenkins lo detiene.
  Si se ha marcado la opción _Keep online while builds are running_, Jenkins esperará a que las tareas
  terminen de ejecutarse antes de detener el agente
* _Bring this agent online when in demand, and take offline when idle_: 
    * Jenkins levanta el agente si:
      * Las tareas han estado en cola al menos el tiempo especificado en el campo "Espera bajo demanda" y
      * Las tareas pueden ejecutarse en ese nodo

    * Jenkins tira el agente si
      * No hay ninguna ejecución en este nodo y
      * Este agente ha estado en reposo el tiempo indicado en el campo "Espera cuando disponible"

  <img src="/slides/images/es/0070/add_nodes_availability_in_demand.png" alt="" class="r-stretch">

^^^^^^
 
#### Añadir nodos
 
<img src="/slides/images/es/0070/add_nodes_step_5.png" alt="add_nodes_step_5" class="r-stretch">

notes:

Si los credenciales son correctos y no hay problemas de conectividad, veremos esta pantalla.

A la izquierda vemos que ya tenemos disponibles los dos nuenos `Executors` disponibles en el agente.

^^^^^^

#### Añadir nodos Windows con SSH

Es posible añadir nodos con el sistema operativo Windows utilizando `cygwin` ([Más información](https://wiki.jenkins.io/display/JENKINS/SSH+slaves+and+Cygwin))
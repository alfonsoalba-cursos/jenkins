### Introducción

Las ejecuciones distribuidas se han implementado siguiendo el modelo Master / Slave

^^^^^^

#### Introducción: Nomenclatura

* `nodo`: Una máquina que forma parte del entorno de Jenkins 
  y que es capaz de ejecutar `Pipelines` o tareas. Tanto `controlador` como `agentes` se
  consideran nodos

^^^^^^

#### Introducción: Nomenclatura

* `executor`: 
  * un slot para ejecutar el trabajo definido por un `Pipeline` o una tarea en un nodo 
  * Un nodo puede tener cero o más `executors` configurados. 
  * Estos `executors` se corresponden con el número de tareas o
    `Pipelines` que se pueden ejecutar de manera simultánea en ese nodo  

^^^^^^

#### Introducción: Nomenclatura

* `controlador`: es el nodo central que coordina los procesos, almacena la configuración, 
  carga los plugins y genera las interfaces de usuario que vemos como usuarios de Jenkins

^^^^^^

#### Introducción: Nomenclatura

* `agente`: una máquina (o contenedor) que se conecta al controlador y ejecuta las tareas 
  asignadas a él por el `controlador`
  
^^^^^^

<img src="/slides/images/es/0070/master_slaves/master_slaves.001.png" alt="master_slave" class="r-stretch">

notes:

Esta es la infraestructura que vamos a levantar durante este módulo del curso:

* Un controlador
* Dos agentes

Desde el controlador ejecutaremos nuestras tareas en los agentes.

Para los nodos utilizaremos una copia de la máquina virtual que hemos utilizado hasta ahora durante el curso. 
### Tipos de tareas

* Proyecto de estilo libre (Freestyle Job)
* Pipeline
* Proyecto con configuración múltiple
* Carpeta
* Multibranch Pipeline
* Github Organization

^^^^^^

#### Tipos de tareas: estilo libre

* Es la característica principal de Jenkins.
* Cuando Jenkins comenzó, todo eran proyectos de estilo libre
* Es el más antiguo y el más versatil
* Te permite ejecutar prácticamente cualquier cosa que se te ocurra

^^^^^^

#### Tipos de tareas: estilo libre

En este módulo de curso nos centraremos en las tareas de estilo libre

^^^^^^

#### Tipos de tareas: Pipeline

> Continous Delivery Pipeline: Expresión en formato de código del proceso que nos permite llevar el
  código fuente del SCM a nuestros clientes o usuarios

notes:

Este tipo de _Pipeline_ permite que cada cambio que hagamos a nuestro código y que sea incluido 
en nuestro sistema de control de versions, pase a través de un proceso complejo de varios pasos
hasta que sea finalmente desplegado. Este proceso debe permitir construir y desplegar nuestro
proyecto con confianza. También debemos ser capaces de repetirlo las veces que sea necesario sabiendo 
que en todos los casos se repetirán los mismos pasos. 


^^^^^^

#### Tipos de tareas: Pipeline

* Jenkins permite **programar y versionar** este proceso de construcción del software
* Basta incluir un fichero `Jenkinsfile` en nuestro repositorio que describirá los pasos necesarios
  para hacerlo

^^^^^^

#### Tipos de tareas: Pipeline

```
pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                // 
            }
        }
        stage('Test') { 
            steps {
                // 
            }
        }
        stage('Deploy') { 
            steps {
                // 
            }
        }
    }
}
```

notes:

En esta diapositiva tenemos un ejemplo de un *Pipeline* declarativo de Jenkins.
Consta de tres pasos:
* `Build` en el que construremos el software
* `Test` en el que se ejecutarán los test automatizados del proyecto
* `Deploy` en el que se despliega el software

Si uno de los pasos falla, el proceso se detiene y nos llegará una notificación 
a través de un canal configurable.

^^^^^^

#### Tipos de tareas: Pipeline

* Más información:
  * Módulo posterior del curso
  * https://jenkins.io/doc/book/pipeline/


^^^^^^

#### Tipos de tareas: multi-configuración

Útil para aquellos proyectos en los que las ejecuciones son muy parecidas entre sí.

Un proyecto multi-configuración nos permite no duplicar pasos

^^^^^^

#### Tipos de tareas: multi-configuración

```
Ant: set-target-alpha debug compile
Ant: set-target-beta debug compile
Ant: set-target-gamma debug compile
Ant: set-target-alpha release compile
Ant: set-target-beta release compile
Ant: set-target-gamma release compile
```

notes:

Supongamos un proyecto en el que tenemos que construir diferentes targets, como por ejemplo generar
ejecutables para diferentes sistemas operativos.

Si usásemos un proyecto de estilo libre, tendríamos que repetir los pasos que se indican en la diapositiva.

^^^^^^

#### Tipos de tareas: multi-configuración

```
Ant: $target $releasetype compile
```

notes:

Un proyecto multiconfiguración nos permitiría sustituir todas las líneas de la diapositiva anterior
por una única línea: la que se muestra en esta diapositiva.

^^^^^^

#### Tipos de tareas: Carpeta

Organiza las tareas en una estructura jerárquiqua de carpetas, como si fuesen ficheros y directorios de un
sistema de ficheros.

notes:

Este plugin es especialmente potente cuando se combina con otros plugins como por ejemplo:
* Role-Based Access Control plugin: Permite asignar roles a nivel de carpeta, facilitando el control
  de acceso de los usuarios a las tareas
* Templates plugin: si se crea un template en una carpeta, este sólo afectará a las tareas creadas
  dentro de esa carpeta
  
^^^^^^

#### Tipos de tareas: Carpeta

Más información:
* [Página del plugin `Folders`](https://docs.cloudbees.com/docs/admin-resources/latest/plugins/folder)
* [Página del plugin `Folders Plus`](https://docs.cloudbees.com/docs/admin-resources/latest/plugins/folders-plus)

^^^^^^

#### Tipos de tareas: Multibranch Pipeline

La configuración del `pipeline` se lee del SCM.

Jenkins lee las ramas definidas en la configuración de la tarea y crea un subproyecto para cada rama que encuentra.

Jenkins espera encontrar en cada rama un fichero `Jenkinsfile` con las instrucciones para la ejecución. 

^^^^^^

#### Tipos de tareas: Multibranch Pipeline

Más información:

* [Documentación del plugin `pipeline-plugin`](https://github.com/jenkinsci/pipeline-plugin/blob/master/TUTORIAL.md#creating-multibranch-projects)


^^^^^^

#### Tipos de tareas: Github Organization

Escanea una organización de Github y extrae de ella tareas de tipo
Multibranch Pipeline para los repositorios seleccionados en base a unas reglas.

notes:

Este tipo de tarea no lo utilizaremos durante el curso.
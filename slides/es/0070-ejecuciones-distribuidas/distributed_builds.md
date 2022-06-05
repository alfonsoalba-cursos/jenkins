### Ejecuciones distribuidas

* [Tareas de estilo libre](/#build_distributed_freestyle_projects)
* [_label expressions_](/#label_expressions)
* [Pipelines](/#build_distributed_pipelines)

^^^^^^
<!-- .element: id="build_distributed_freestyle_projects" -->
#### Ejecuciones distribuidas: Tareas de estilo libre 

Vamos a crear una tarea que se ejecuta en el agente `agente_jnlp`

Vamos a "Jenkins" -> "Nueva Tarea"

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_1.png" alt="distributed_builds_free_style_projects_step_1" class="r-stretch">

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

En la sección general marcamos la opción "Restringir dónde se puede ejecutar este proyecto"

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_2.png" alt="distributed_builds_free_style_projects_step_2" class="r-stretch">

notes:

Cuando marcamos la opcón "Restringir dónde se puede ejecutar este proyecto", Jenkins nos pide que 
introduzcamos una expresión. En este primer caso sencillo, vamos a introducir directamente el nombre
del agente en el que queremos que se ejecute la tarea.

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

Continuamos configurando el resto de los campos de la tarea.

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_3.png" alt="distributed_builds_free_style_projects_step_3" class="r-stretch">

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_4.png" alt="distributed_builds_free_style_projects_step_4" class="r-stretch">

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_5.png" alt="distributed_builds_free_style_projects_step_5" class="r-stretch">

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_6.png" alt="distributed_builds_free_style_projects_step_6" class="r-stretch">

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

Una vez creado el proyecto, procedemos a ejecutarlo...

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_7.png" alt="distributed_builds_free_style_projects_step_7" class="r-stretch">

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

Debería ejecutarse en el agente...

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_8.png" alt="distributed_builds_free_style_projects_step_8" class="r-stretch">

^^^^^^
#### Ejecuciones distribuidas: Tareas de estilo libre 

<img src="/slides/images/es/0070/distributed_builds_free_style_projects_step_9.png" alt="distributed_builds_free_style_projects_step_9" class="r-stretch">

^^^^^^
<!-- .element: id="label_expressions" -->
### Label Expressions

Expresión que nos permite seleccionar en qué nodos se ejecuta una tarea.

Puede ser:

* El nombre de un nodo
* El nombre de una etiqueta
* Una expresión booleana en Groovy


^^^^^^
#### Label Expressions: operadores

* (expression) - propiedad asociativa  
* !expression - negación
* a && b - AND
* a || b - OR
* a -> b - "implies", equivalente a "!a || b". Por ejemplo "linux -> x64", se interpreta: si se utiliza el agente "Linux", 
  este debe ser "x64"
  
* a <-> b - "si y solo si", equivalente a "a && b || !a && !b"

^^^^^^
#### Label Expressions: ejemplos

* `windows && maven`
* `ubuntu || debian`
* `jdk-8 && ((windows && x32) || (linux && x64))`


^^^^^^
<!-- .element: id="build_distributed_pipelines" -->
### Pipelines

Para configurar el nodo en el que se ejecuta un `pipeline` utilizamos la instrucción `agent`.

[Más información sobre `agent`](https://jenkins.io/doc/book/pipeline/syntax/#agent)

^^^^^^
#### Pipelines

`agent` puede tomar los siguientes valores:

* `none`: este valor implica que cada stage deberá definir su propio agente
* `any`: Utiliza cualquier agente disponible
* `label`: selecciona el agente según la etiqueta definida: `agent { label 'my-defined-label' }`

^^^^^^
#### Pipelines

* `node`: `agent { node { label 'labelName' } }` es muy parecida a `label`, permite definir más opciones
  como `customWorkspace` 
* `docker`: Ejecuta el paso dentro de un contenedor. Dentro de esta opción podemos usar `label` para
  seleccionar el agente
* otras opciones: `dockerfile`, `kubernetes`


notes:

Estas opciones tiene valores comunes que se pueden usar en varias de ellas. En 
[este enlace](https://jenkins.io/doc/book/pipeline/syntax/#common-options)
puedes encontrar más información sobre ellas.

^^^^^^

### 💻️ Ejercicio

Convertir el `Pipeline` en paralelo del capítulo 5 para que ejecute 
los pasos en paralelo, pero cada uno de ellos en un agente diferente.

notes:

```Jenkinsfile
pipeline {
    agent any 
    stages {
        stage('Paso 1') {
                parallel {
                  stage('first') {
                    agent {label "master" }
                    steps {
                        echo "${currentBuild.number}: ¡Hola ${params.NAME} desde el primer paso de ${BRANCH_NAME} en ${NODE_NAME}!"
                        sleep 2
                        
                    }
                  }
                  stage('second') {
                    agent { label "agente_jnlp" }
                    steps {
                        echo "${currentBuild.number}: ¡Hola ${params.NAME} desde el segundo paso de ${BRANCH_NAME} en ${NODE_NAME}!"
                        sleep 2
                    }
                  }
                }
        }
    }
}
```

^^^^^^

#### 💻️ Ejercicio

Ayuda:
* [`agent`](https://jenkins.io/doc/book/pipeline/syntax/#agent)
* [`parallel`](https://jenkins.io/doc/book/pipeline/syntax/#parallel)
* ...puedes utilizar `replay` para depurar antes de hacer el commit definitivo del nuevo `Pipeline`
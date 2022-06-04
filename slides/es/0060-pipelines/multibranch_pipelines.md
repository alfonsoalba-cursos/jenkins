### Multi-branch Pipelines

Este tipo de tareas permiten implementar diferentes `Pipelines` para diferentes ramas de un repositorio.

Desde el propio repositorio podemos gestionar los `Pipelines` usando ramas.

^^^^^^

#### Multi-branch Pipelines

<img src="/slides/images/es/0060//multi_branch_pipeline_create_step_1.png" alt="multi_branch_pipeline_create_step_1" class="r-stretch">

notes:

Utilizaremos el siguiente repositorio durante el ejemplo:

[https://github.com/alfonsoalba-cursos/jenkins-jenkinsfile-example](https://github.com/alfonsoalba-cursos/jenkins-jenkinsfile-example)

^^^^^^

#### Multi-branch Pipelines

Configuramos el repositorio:

<img src="/slides/images/es/0060//multi_branch_pipeline_create_step_2.png" alt="multi_branch_pipeline_create_step_2" class="r-stretch">

notes:

En el ejemplo que vamos a poner, seleccionaremos las ramas master y development únicamente de manera que
las nuevas ramas que creemos no generarán una nueva tarea.

Si utilizásemos por ejemplo la opción "Discover Branches" o "Discover Tags" o utilizando un filtro que
incluya varias ramas, cada vez que se hace push una rama nueva que cumple con los criterios, se crearía automáticamente
una nueva tarea.

En la sección "Behaviours" configuramos los pasos que se dan para indexar las ramas del repositorio
y crear las correspondientes tareas. En este ejemplo, combinamos dos:
* `Discover branches` para obtener todas las ramas del repositorio
* `Filter by name` para filtrar las ramas y quedarnos sólo con master 

^^^^^^

#### Multi-branch Pipelines

Indicamos a Jenkins dónde está el `Jenkinsfile`:

<img src="/slides/images/es/0060//multi_branch_pipeline_create_step_3.png" alt="multi_branch_pipeline_create_step_3" class="r-stretch">

^^^^^^

#### Multi-branch Pipelines

¿Cuándo buscamos nuevas ramas?

<img src="/slides/images/es/0060//multi_branch_pipeline_create_step_4.png" alt="multi_branch_pipeline_create_step_4" class="r-stretch">

notes:

Dentro de la configuración de cada tarea nueva que se creará (una por rama), se pueden configurar
diferentes triggers en cada una de ellas. El más habitual es el que lanza una nueva ejecución cuando
se hace un push de una de las ramas. Si la tarea forma parte de un Multibranch Pipeline, cuando se recibe
este evento se escanea el repositorio en busca de nuevas ramas.

Esta opción permite que, además de en esos eventos, se escanee el repositorio de manera periódica.
Esto permite que podamos crear una nueva rama en nuestro repositorio y que se cree su correspondiente
`Pipeline` en Jenkins sin tener que hacer push a una rama ya existente.

^^^^^^

#### Multi-branch Pipelines

¿Qué pasa si borramos una rama?

<img src="/slides/images/es/0060//multi_branch_pipeline_create_step_5.png" alt="multi_branch_pipeline_create_step_5" class="r-stretch">

notes:

Cuando Jenkins detecta que se ha borrado una rama, se borra su correspondiente tarea. Esta sección
nos permite configurar una política para no borrar estas tareas de manera inmediada. 

^^^^^^

#### Multi-branch Pipelines

<img src="/slides/images/es/0060//multi_branch_pipeline_create_step_6.png" alt="multi_branch_pipeline_create_step_6" class="r-stretch">

^^^^^^

#### Multi-branch Pipelines

Variables de entorno adicionales:

* `BRANCH_NAME`: nombre de la rama en ejecución
* `CHANGE_ID`: un identificados que permite identificar los cambios introducidos, como por ejemplo el ID del pull request

^^^^^^

#### Multi-branch Pipelines

Esta funcionalidad sólo está operativa para Github y Bitbucket:

* [GitHub Branch Source Plugin](https://plugins.jenkins.io/github-branch-source/)
* [Bitbucket Branch Source Plugin](https://plugins.jenkins.io/cloudbees-bitbucket-branch-source/)

^^^^^^

#### 💻️ Multi-branch Pipelines

Cambiar la configuración de la tarea para que también procese la rama development

notes:

<img src="/slides/images/es/0060//multi_branch_pipeline_create_add_development_branch.png" alt="multi_branch_pipeline_create_step_6" class="r-stretch">
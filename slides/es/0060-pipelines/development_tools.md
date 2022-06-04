### 🔧 Herramientas

* [Blue Ocean Pipeline Editor](/#development_tools_blue_ocean)
* [Command-line Interface](/#command_line_interface)
* [Command-line Pipeline Linter](/#command_line_pipeline_linter)
* [Replay](/#replay_pipeline)
* [Restart from Stage](/#restart_from_stage)

^^^^^^
<!-- .element: id="development_tools_blue_ocean" -->

#### 🔧 Herramientas: Blue Ocean Pipeline Editor

[Blue Ocean Pipeline Editor 📄](https://jenkins.io/doc/book/blueocean/pipeline-editor/) es una interfaz
gráfica para crear y editar `Pipelines` 

^^^^^^

#### 🔧 Herramientas: Blue Ocean Pipeline Editor

¡Lo mejor es verlo en acción!

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Instalar los plugins:

* Blue Ocean
* Config API for Blue Ocean
* Blue Ocean Pipeline Editor


^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Una vez instalado, dispondremos de un acceso directo en el Dashboard

<img src="/slides/images/es/0060//blue_ocean_installation_step_1.png" alt="blue_ocean_installation_step_1" class="r-stretch">

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

<img src="/slides/images/es/0060//blue_ocean_installation_step_2.png" alt="blue_ocean_installation_step_2" class="r-stretch">

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Si accedemos al proyecto, veremos el dashboard: 

<img src="/slides/images/es/0060//blue_ocean_installation_step_3.png" alt="blue_ocean_installation_step_3" class="r-stretch">

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Si accedemos a una ejecución: 

<img src="/slides/images/es/0060//blue_ocean_installation_step_4.png" alt="blue_ocean_installation_step_4" class="r-stretch">

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

También lo podemos utilizar para crear un nuevo pipeline: 

<img src="/slides/images/es/0060//blue_ocean_new_pipeline_step_1.png" alt="blue_ocean_new_pipeline_step_1" class="r-stretch">

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Vamos a recrear la misma tarea de tipo `Multi-branch Pipeline` que ya tenemos pero utilizando Blue Ocean

<img src="/slides/images/es/0060//blue_ocean_new_pipeline_step_2.png" alt="blue_ocean_new_pipeline_step_2" class="r-stretch">

notes:

La URL del repositorio es 
[https://github.com/Be-Core-Code/curso-intro-jenkins-modulo-5-sample-repository-with-jenkinsfile.git](https://github.com/Be-Core-Code/curso-intro-jenkins-modulo-5-sample-repository-with-jenkinsfile.git)

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

<img src="/slides/images/es/0060//blue_ocean_new_pipeline_step_3.png" alt="blue_ocean_new_pipeline_step_3" class="r-stretch">

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

<img src="/slides/images/es/0060//blue_ocean_new_pipeline_step_4.png" alt="blue_ocean_new_pipeline_step_4" class="r-stretch">


^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Ha sido mucho más rápido y la interfaz es bastante más agradable a la vista...


^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Además, podemos editar gráficamente los Jenkinfiles:

<img src="/slides/images/es/0060//blue_ocean_new_pipeline_step_5.png" alt="blue_ocean_new_pipeline_step_5" class="r-stretch">

^^^^^^

#### 💻️ Práctica: Instalar Blue Ocean Pipeline Editor

Para editar
es necesario dar permiso de escritura sobre el repositorio.

^^^^^^
<!-- .element: id="command_line_interface"-->

#### 🔧 Herramientas: Command-Line Interface (CLI)

Jenkins pone a nuestra disposición un interfaz de comandos para operar sobre Jenkins.

--- 
[Documentación](https://jenkins.io/doc/book/managing/cli/)

^^^^^^
#### 🔧 Herramientas: Command-Line Interface (CLI)

Se puede operar con ella:
* a través de ssh
* utilizando un cliente java

^^^^^^
#### 🔧 Herramientas: Command-Line Interface (CLI)

Para descargarnos el cliente java:

```bash
> wget http://localhost:8080/jnlpJars/jenkins-cli.jar
```

En el siguiente punto veremos un ejemplo de uso.

^^^^^^
#### 🔧 Herramientas: Command-Line Interface (CLI)

¿qué operaciones podemos hacer? Accede a `http://localhost:8080/cli/`

<img src="/slides/images/es/0060//jenkins_cli_commands.png" alt="jenkins_cli_commands" class="r-stretch">

^^^^^^

<!-- .element: id="command_line_pipeline_linter"-->

#### 🔧 Herramientas: Command-line Pipeline Linter

[Command-line Pipeline Linter](https://jenkins.io/doc/book/pipeline/development/#linter) es una herramienta
que facilita Jenkins para validar nuestro `Jenkinsfile`.

^^^^^^
#### 🔧 Herramientas: Command-line Pipeline Linter

```bash
> java -jar jenkins-cli.jar -s http://localhost:8080/ -auth admin:admin -webSocket declarative-linter < ./Jenkinsfile
```

^^^^^^
<!-- .element: id="replay_pipeline" -->

#### 🔧 Herramientas: Replay

<img src="/slides/images/es/0060//pipeline_tools_replay_1.png" alt="pipeline_tools_replay_1" class="r-stretch">

notes:

Esta funcionalidad está disponible desde dentro de una ejecución de un `Pipeline`

^^^^^^

#### 🔧 Herramientas: Replay

<img src="/slides/images/es/0060//pipeline_tools_replay_2.png" alt="pipeline_tools_replay_2" class="r-stretch">

notes:

Podemos volver a lanzar el `Pipeline` cambiando el fichero de definición.

Esto nos permitiría por ejemplo hacer pruebas o depurar un problema antes de
hacer commit de las modificaciones de manera definitiva en el repositorio.

^^^^^^

#### 🔧 Herramientas: Replay

La opción de Replay también está disponible desde la interfaz de Blue Ocean

<img src="/slides/images/es/0060//pipeline_tools_replay_3.png" alt="pipeline_tools_replay_3" class="r-stretch">

^^^^^^

#### 🔧 Herramientas: Replay

<img src="/slides/images/es/0060//pipeline_tools_replay_4.png" alt="pipeline_tools_replay_4" class="r-stretch">


^^^^^^
<!-- .element: id="restart_from_stage" -->
#### 🔧 Herramientas: Restart from stage

Esta herramienta permite volver a empezar un `Pipeline` desde un paso determinado.

[Documentación](https://jenkins.io/doc/book/pipeline/running-pipelines/#restart-from-a-stage)


^^^^^^
#### 🔧 Herramientas: Restart from stage

Esta funcionalidad está disponible desde dentro de una ejecución de un `Pipeline`

<img src="/slides/images/es/0060//pipeline_tools_restart_1.png" alt="pipeline_tools_restart_1" class="r-stretch">

^^^^^^
#### 🔧 Herramientas: Restart from stage

<img src="/slides/images/es/0060//pipeline_tools_restart_2.png" alt="pipeline_tools_restart_2" class="r-stretch">

^^^^^^
#### 🔧 Herramientas: Restart from stage

<img src="/slides/images/es/0060//pipeline_tools_restart_3.png" alt="pipeline_tools_restart_3" class="r-stretch">

^^^^^^
#### 🔧 Herramientas: Restart from stage

La opción Restart también está disponible desde la interfaz de Blue Ocean

<img src="/slides/images/es/0060//pipeline_tools_restart_4.png" alt="pipeline_tools_restart_4" class="r-stretch">

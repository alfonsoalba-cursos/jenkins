### Usando `Jenkinsfile` desde un repositorio

Forma de crear un `Pipeline`:

* ✅ Utilizando la interfaz gráfica de Jenkins
* ➡️ A través de nuestro repositorio (Jenkinsfile)
* Utilizando el [plugin de Blue Ocean](https://jenkins.io/doc/book/pipeline/getting-started/#through-blue-ocean) (interfaz gráfica)
 
^^^^^^

#### Usando `Jenkinsfile` desde un repositorio

Al crear un `Pipeline` podemos indicarle a Jenkins dónde está el fichero `Jenkinsfile` dentro del
repositorio:

<img src="/slides/images/es/0060//jenkinsfile_create_pipeline_from_scm.png" alt="jenkinsfile_create_pipeline_from_scm" class="r-stretch">

notes:

En el ejemplo utilizaremos el siguiente repositorio: 
[https://github.com/alfonsoalba-cursos/jenkins-jenkinsfile-example](https://github.com/alfonsoalba-cursos/jenkins-jenkinsfile-example)

En la diapositiva vemos el campo para indicar la ruta al fichero `Jenkinsfile`. Esta
ruta es relativa a la raiz del repositorio.

Por defecto se asume que el fichero está en la raiz del repositorio.

^^^^^^

#### Usando `Jenkinsfile` desde un repositorio

Si ejecutamos el `Pipeline`:

<img src="/slides/images/es/0060//jenkinsfile_create_pipeline_from_scm_results.png" alt="jenkinsfile_create_pipeline_from_scm" class="r-stretch">

^^^^^^

### 💻️ Ejercicio: de tarea de estilo libre a `Pipeline`

Añadir un `Jenkinsfile` a nuestro programa en C y convertir la tarea de tipo estilo libre
que teníamos en Jenkins en un `Pipeline`.

Mejoras: 
* Usar make para compilar
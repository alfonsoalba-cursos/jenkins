### Primeros pasos

Forma de crear un `Pipeline`:

* Utilizando la interfaz gráfica de Jenkins
* A través de nuestro repositorio (Jenkinsfile)
* Utilizando el [plugin de Blue Ocean](https://jenkins.io/doc/book/pipeline/getting-started/#through-blue-ocean) (interfaz gráfica)
 
En esta primera sección utilizaremos la interfaz gráfica de Jenkins

^^^^^^

#### Primeros pasos: Crear una tubería

<img src="/slides/images/es/0060//classic_ui_pipeline_step_1.png" alt="Creando una tubería: paso 1" class="r-stretch">

^^^^^^

#### Primeros pasos: Crear una tubería

<img src="/slides/images/es/0060//classic_ui_pipeline_step_2.png" alt="Creando una tubería: paso 2" class="r-stretch">

notes:

```Jenkinsfile
pipeline {
    agent any 
    stages {
        stage('Paso 1') {
            steps {
                echo '¡Hola desde el primer paso!' 
            }
        }
        stage('Paso 2') {
            steps {
                echo '¡Hola desde el segundo paso!' 
            }
        }
    }
}
```

^^^^^^

#### Primeros pasos: Ejecutar la tubería

Tras ejecutar la tubería vemos: 

<img src="/slides/images/es/0060//classic_ui_pipeline_step_3.png" alt="Creando una tubería: paso 3" class="r-stretch">

^^^^^^

#### Primeros pasos: Ejecutar la tubería

 <img src="/slides/images/es/0060//classic_ui_pipeline_step_4.png" alt="Creando una tubería: paso 4" class="r-stretch">

^^^^^^

#### Primeros pasos: Documentación integrada

* ${YOUR_JENKINS_URL}/pipeline-syntax
* A través del enlace que aparece en cualquier tarea de tipo `Pipeline`

<img src="/slides/images/es/0060//link_to_pipeline_built_in_documentation.png" alt="link_to_pipeline_built_in_documentation" class="r-stretch">


^^^^^^

#### Primeros pasos: Documentación integrada

El `Snippet Generator` nos ayuda a generar las instrucciones
para incluir dentro de un bloque `step`

<img src="/slides/images/es/0060//pipeline_built_in_documentation_snippet_generator.png" alt="pipeline_built_in_documentation_snippet_generator" class="r-stretch">

^^^^^^

#### 💻️ Primeros pasos: snippet generator

Utilizando el `snippet generator` modificar la tubería
que hemos creado para:

* Retrasar la ejecución durante dos segundos
* Ejecuta los dos pasos en paralelo 

notes:

```Jenkinsfile
pipeline {
    agent any 
    stages {
        stage('Paso 1') {
            steps {
                parallel(
                  first: {
                    echo '¡Hola desde el primer paso!' 
                    sleep 2
                  },
                  second: {
                    echo '¡Hola desde el segundo paso!' 
                    sleep 2
                  }
                )
            }
        }
    }
}
```

^^^^^^

#### Primeros pasos: Documentación integrada

Otro elemento importante de la Documentación integrada es _Global Variable Reference_

<img src="/slides/images/es/0060//pipeline_built_in_documentation_global_variable_reference.png" alt="pipeline_built_in_documentation_global_variable_reference" class="r-stretch">

notes:

Documentación de las variables que los diferentes plugins
exponen en un `Pipeline` y que podemos utilizar dentro del
`Jenkinsfile`

^^^^^^

#### 💻️ Primeros pasos: Documentación integrada

* Añadir el parámetro NAME al `Pipeline`
* Mostrar en la consola el número de la ejecución junto con el parámetro utilizado

notes:

```Jenkinsfile
pipeline {
    agent any 
    stages {
        stage('Paso 1') {
            steps {
                parallel(
                  first: {
                    echo "${currentBuild.number}: ¡Hola ${params.NAME} desde el primer paso!"
                    sleep 2
                  },
                  second: {
                    echo "${currentBuild.number}: ¡Hola ${params.NAME} desde el segundo paso!"
                    sleep 2
                  }
                )
            }
        }
    }
}
```

^^^^^^

#### Primeros pasos: Documentación integrada

`Declarative Directive Generator` nos ayuda a generar la documentación para las
directivas dentro del bloque `pipeline`, como por ejemplo `agent`, `stage`, `docker`, etc.

^^^^^^

#### Primeros pasos: Documentación integrada

<img src="/slides/images/es/0060//pipeline_built_in_documentation_declarative_directive_generator.png" alt="pipeline_built_in_documentation_declarative_directive_generator" class="r-stretch">

### Shared Libraries

¿Qué hacemos para evitar repetir el código que define nuestros `Pipelines`?

notes:

A medida que nuestro proyecto va creciendo o que vamos teniendo más proyectos dentro del equipo, llegará el momento 
en el que empezaremos a copiar y pegar código entre los diferentes `Pipelines`. Al igual que nos ocurre con el código
fuente, mantener este tipo de ficheros Jenkinfiles puede convertirse en un problema. Imagínate que necesitas
cambiar algo en un Jenkinsfile dentro de una tarea Multibranch que tiene varias decenas de pull-requests abiertos.
Tendrías que ir uno a uno actualizándo todas las ramas.

Para evitar este tipo de situaciones, podemos encapsular aquellas partes del código que define el `Pipeline`
dentro una biblioteca compartida ([_shared library_](https://jenkins.io/doc/book/pipeline/shared-libraries/)).

^^^^^^

#### Shared libraries: ¿Qué podemos reutilizar?

* Código para realizar un despliegue
* Leer y procesar ficheros de configuración
* Realizar análisis de código (por ejemplo SonarQube /Fortify)

^^^^^^

#### Shared libraries: ¿Qué son?

Colección de scripts escritos en [Groovy](https://groovy-lang.org/) que podemos cargar en tiempo de ejecución
en nuestro `Jenkinsfile`.

^^^^^^

#### Shared libraries: ¿Dónde las definimos?

En un repositorio en Git que tenga la siguiente estructura:

```bash
(root)
+- src                     # Groovy source files
|   +- org
|       +- foo
|           +- Bar.groovy  # for org.foo.Bar class
+- vars
|   +- log.groovy          # for global 'log' variable
|   +- log.txt             # help for 'log' variable
+- resources               # resource files (external libraries only)
|   +- org
|       +- foo
|           +- bar.json    # static helper data for org.foo.Bar
```

notes:

* `src`: esta carpeta se añade al `classpath` de java cuando se ejecutan los pipelines. Las clases aquí definidas
  estarán disponibles para usarse dentro de nuestro código en Groovy
* `vars`: scripts que se exponen como variables en los `Pipelines`. El nombre del fichero será el nombre de la variable
  en el `Pipeline`. Así, en el ejemplo que hemos mostrado en la diapositiva, si el fichero `log.groovy` define una función
  `def info()...`, podemos utilizar esta función en nuestro `Pipeline` escribiendo: `log.info`
  
  El fichero `log.txt` contiene la documentación del método y aparecerá en la página 
  [Global Variable Reference](https://jenkins.io/doc/book/pipeline/getting-started/#global-variable-reference). Aunque
  la extensión sea `.txt`, este puede contener HTML o Markdown. 


^^^^^^

#### 💻️ Shared libraries: Práctica 

Crear una biblioteca compartida con nuestro saludo:

```
pipeline {
    agent any
    stages {
        stage('Paso 1') {
            steps {
                parallel(
                  first: {
                    echo "${currentBuild.number}: ¡Hola ${params.NAME} desde el primer paso de ${BRANCH_NAME}!"
                    sleep 2
                  },
                  second: {
                    echo "${currentBuild.number}: ¡Hola ${params.NAME} desde el segundo paso de ${BRANCH_NAME}!"
                    sleep 2
                  }
                )
            }
        }
    }
}
```
^^^^^^ 
#### 💻️ Shared libraries: Práctica 
 
Creamos una carpeta e inicializamos un repositorio en git:

```bash 
> mkdir shared-library-demo
> cd shared-library-demo
> git init
```
^^^^^^ 

#### 💻️ Shared libraries: Práctica 
 
Creamos la clase `org.acme.GlobalVars` en el fichero `src/org/acme/GlobalVars.groovy`;

```groovy 
  
#!/usr/bin/env groovy
package org.acme

class GlobalVars {
   static String salutation = "Hola"
}
```

notes:

Creamos esta clase para ilustrar cómo podemos utilizar una variable global dentro de nuestro `Pipeline`

^^^^^^

#### 💻️ Shared libraries: Práctica 
 
Creamos el script `vars/sayHello.groovy`:

```groovy
#!/usr/bin/env groovy

def call(String name = 'human') {
  echo "${currentBuild.number}: ¡${org.acme.GlobalVars.salutation} ${name} desde el primer paso de ${BRANCH_NAME}!"
}
```

^^^^^^

#### 💻️ Shared libraries: Práctica 

Creamos un repositorio en GitHub y hacemos push de nuestros cambios:

```bash
> git remote add origin https://github.com/alfonsoalba-cursos/jenkins-jenkinsfile-example.git
> git push -u origin master 
```

^^^^^^

#### 💻️ Shared libraries: Práctica 

Importamos la biblioteca en Jenkins: vamos a "Administrar Jenkins" -> "Configurar el sistema"


<img src="/slides/images/es/0060//shared_library_step_1.png" alt="shared_library_step_1" class="r-stretch">

^^^^^^

#### 💻️ Shared libraries: Práctica 

<img src="/slides/images/es/0060//shared_library_step_2.png" alt="shared_library_step_2" class="r-stretch">

^^^^^^

#### 💻️ Shared libraries: Práctica 

En el siguiente paso le indicamos a Jenkins dónde puede encontrar esta biblioteca:

<img src="/slides/images/es/0060//shared_library_step_3-1.png" alt="shared_library_step_3-1" class="r-stretch">

notes:

Esta sección de configuración es demasiado larga para que quepa en una sola
diapositiva, por lo que se ha separado en tres partes que se muestran a continuación.

^^^^^^

#### 💻️ Shared libraries: Práctica 

<img src="/slides/images/es/0060//shared_library_step_3-2.png" alt="shared_library_step_3-2" class="r-stretch">

^^^^^^

#### 💻️ Shared libraries: Práctica 

<img src="/slides/images/es/0060//shared_library_step_3-3.png" alt="shared_library_step_3-3" class="r-stretch">


^^^^^^

#### 💻️ Shared libraries: Práctica 

¡Ya tenemos lista nuestra función para utilizarla!

^^^^^^

#### 💻️ Shared libraries: Práctica 

Volvemos a nuestro repositorio Multibranch Pipeline y modificamos el `Jenkinsfile`: 

```Jenkinsfile
@Library('shared-library-demo') _
pipeline {
    agent any
    stages {
        stage('Paso 1') {
            steps {
                parallel(
                  first: {
                    script {
                      sayHello(params.NAME)
                    }
                    sleep 2
                  },
                  second: {
                    script {
                      sayHello(params.NAME)
                    }
                    sleep 2
                  }
                )
            }
        }
    }
}
```

notes:

Si añadimos este fichero a la rama desarrollo por ejemplo y hacemos push, la tarea se lanzará 
y se creará una nueva ejecución.  

^^^^^^

#### 💻️ Shared libraries: Práctica 

Si todo ha ido bien, deberíamos ver la misma salida que teníamos antes
aunque estaremos usando nuestra biblioteca compartida:

<img src="/slides/images/es/0060//shared_library_step_4.png" alt="shared_library_step_3-3" class="r-stretch">


^^^^^^

#### 💻️ Shared libraries: Práctica 

* [Documentación](https://jenkins.io/doc/book/pipeline/shared-libraries/)
* [Documentación: cómo escribir bibliotecas compartidas](https://jenkins.io/doc/book/pipeline/shared-libraries/#writing-libraries)

 


### Trabajando con nuestro `Jenkinsfile`

En esta sección vamos a ver:

* Detalles de la sintaxis del fichero Jenkinsfile
* Caraterísticas y funcionalidades relevantes para construir nuestros `Pipeline`

^^^^^^

#### Trabajando con nuestro `Jenkinsfile`

* Interpolación de cadenas de texto
* Uso de variables de entorno
* Uso de credenciales
* Uso de parámetros
* Gestión de fallos
* Uso de múltiples agentes
* Ejecución en paralelo

^^^^^^
#### Interpolación de cadenas de texto

* Para interpolar variables se usa `${NOMBRE_DE_VARIABLE}`
* Sólo se interpolan las variables definidas entre comillas dobles:

```Jenkinsfile
step {
    echo 'Hola ${params.NAME}'
    echo "Hola ${params.NAME}"
}
```

Genera: 

```
Hola ${params.NAME}
Hola Alfonso
```

^^^^^^
#### Variables de entorno

Como comentamos en la sección [Primeros pasos y documentación integrada](/#getting_started) 

Jenkins nos da una serie de variables de entorno que podemos utilizar desde nuestro `Jenkinsfile`:
* BUILD_ID
* BUILD_NUMNER
* WORKSPACE
* ... (ver ${YOUR_JENKINS_URL}/pipeline-syntax/globals#env)

^^^^^^
#### Variables de entorno

```Jenkinsfile
pipeline {
    agent any
    stages {
        stage('Ejemplo') {
            steps {
                echo "Ejecutando ${env.BUILD_ID} en ${env.JENKINS_URL}"
            }
        }
    }
}
```

^^^^^^
#### Variables de entorno

Asignar valores a variables de entorno:

```Jenkinsfile
pipeline {
    agent any
    environment { 
        CC = 'clang'
    }
    stages {
        stage('Compilar') {
            environment { 
                DEBUG_FLAGS = '-g'
            }
            steps {
                sh 'make'
            }
        }
        stage('Tests') {
        }
    }
}
```

notes:

La variable `CC` definida en el bloque `pipeline` estará disponibles en todos los
pasos del `Pipeline`.

La variable `DEBUG_FLAGS` sólo estará disponible en el paso `Compilar`.

^^^^^^
#### Variables de entorno

Definir valores dinámicamente usando un [script](https://jenkins.io/doc/pipeline/steps/workflow-durable-task-step/)

```Jenkinsfile
pipeline {
    agent any
    environment { 
        // Using returnStdout
        CC = """${sh(
                returnStdout: true,
                script: 'echo "clang"'
            )}""" 
        // Using returnStatus
        EXIT_STATUS = """${sh(
                returnStatus: true,
                script: 'exit 1'
            )}"""    }
    stages {
        stage('Compilar') {
            environment { 
                DEBUG_FLAGS = '-g'
            }
            steps {
                sh 'make'
            }
        }
        stage('Tests') {
        }
    }
}
```

^^^^^^
#### Trabajando con nuestro `Jenkinsfile`

* ✅ Interpolación de cadenas de texto
* ✅ Uso de variables de entorno
* Uso de credenciales
* Uso de parámetros
* Gestión de fallos
* Uso de múltiples agentes
* Ejecución en paralelo

^^^^^^
#### Uso de credenciales: texto, usuario/contraseña y ficheros

Podemos acceder a estos tres tipos credenciales utilizando el helper `credentials()`

notes:

Este helper acepta como argumento el ID del credencial.

^^^^^^
#### Uso de credenciales: texto

```Jenkinsfile
pipeline {
    agent {
        // Define agent details here
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    stages {
        stage('Compilar') {
            steps {
            }
        }
        stage('Tests') {
            steps {
            }
        }
    }
}
```

^^^^^^
#### Uso de credenciales: texto

Si se intenta ejecutar `echo AWS_ACCESS_KEY_ID`, Jenkins devolverá "****" en lugar
del valor del credencial.

**⚠️ Esto sólo evita una exposición accidental de los valores**

Un `Pipeline` que usa credenciales también puede revelar sus valores. **Utiliza únicamente `Pipelines` de fuentes de confianza.**

 
^^^^^^
#### Uso de credenciales: usuario/contraseña

```
environment {
    GITHUB_CREDS = credentials('jenkins-guthub-creds')
}
```

^^^^^^
#### Uso de credenciales: usuario/contraseña

Esta llamada genera tres variables de entorno:
* GITHUB_CREDS: contiene el usuario y contraseña en el formato username:password
* GITHUB_CREDS_USR: contiene sólo el usuario
* GITHUB_CREDS_PSW: contiene sólo la contraseña

^^^^^^
#### Uso de credenciales: usuario/contraseña

Si se intenta ejecutar `echo GITHUB_CREDS_*`, Jenkins devolverá "****" en lugar
del valor del credencial.

**⚠️ Esto sólo evita una exposición accidental de los valores**

Un `Pipeline` que usa credenciales también puede revelar sus valores. **Utiliza únicamente `Pipelines` de fuentes de confianza.**

^^^^^^
#### Uso de credenciales: Ficheros

Funcionan igual que los credenciales de tipo texto.

^^^^^^
#### Uso de credenciales: Claves SSH o Certificados

Se recomienda utilizar el `Snippet Generator` que vimos en la sección 
[Primeros pasos y documentación integrada](/#getting_started)

^^^^^^
#### Uso de credenciales: Claves SSH o Certificados

Ejemplos de uso de credenciales para SSH:

```Jenkinsfile
withCredentials(
    bindings: [sshUserPrivateKey(
                credentialsId: 'jenkins-ssh-key-for-server', \
                keyFileVariable: 'SSH_KEY_FOR_SERVER', \
                passphraseVariable: '', \
                usernameVariable: '')
               ]) {}
```

notes:

Esta instrucción asigna a la variable de entorno `SSH_KEY_FOR_SERVER` la ruta al fichero
necesario para la autenticación por SSH usando claves pública/privada

^^^^^^
#### Uso de credenciales: Claves SSH o Certificados

[Más información](https://jenkins.io/doc/book/pipeline/jenkinsfile/#handling-credentials)
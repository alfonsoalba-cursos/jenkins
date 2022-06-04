### ¿Qué es un `Pipeline`?

Conjunto de plugins de Jenkins que permiten implementar
los diferentes pasos en la construcción, testeo y despliegue del software.

^^^^^^

#### ¿Qué es un `Pipeline`?

Estos plugins nos facilitan un [DSL](https://jenkins.io/doc/book/pipeline/syntax) 
para modelar, utilizando código, el flujo de despliegue de nuestros proyectos.

^^^^^^

#### ¿Qué es un `Pipeline`?

Este DSL es extremadamente versatil y potente y permite modelar desde los flujos
más sencillos a los más complejos.

^^^^^^

#### ¿Qué es un `Pipeline`?: tipos

* `Scripted`: Escritas en Groovy
* `Declarative`: Más recientes y más comunes, utilizan un [DSL](https://jenkins.io/doc/book/pipeline/syntax)

^^^^^^

#### ¿Qué es un `Pipeline`?: Qué nos aporta

* Código: La declaración de cómo se despliega el software **está junto al software**, normalmente en el mismo repositorio 
* Durabilidad: Están diseñadas para seguir funcionando cuando el servidor maestro de Jenkins se reinicia, tanto de forma
  espontánea por un fallo como planificada

^^^^^^

#### ¿Qué es un `Pipeline`?: Qué nos aporta

* Se pueden pausar: Se pueden detener en un momento dado para solicitar interacción de un usuario o aprovación previa antes de
  continuar con el siguiente paso
* Son versátiles: Permiten implementar flujos complejos que requieran forks, trabajos en paralelo o bucles
* Son extensibles: el DSL puede extenderse, cualidad que utilizan múltiples plugins para integrarse
  con el `Pipeline` y añadir nuevas funcionalidades
  
notes:

Como se comenta en la diapositiva, los pipelines son extensibles a través de
de [_bibliotecas de funciones compartidas (Plugin Shared Libraries)_](https://jenkins.io/doc/book/pipeline/shared-libraries/)
  
^^^^^^
#### ¿Qué es un `Pipeline`?: Estructura del fichero `Jenkinsfile`

```Jenkinsfile
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

* `pipeline`: bloque principal que define un `Pipeline`. Define todo el trabajo
  que se llevará a cabo
* `agent`: bloque que define dónde se debe ejecutar los pasos definidos en el `Pipeline`
* `stages`: bloque que define los pasos que conforman el flujo de trabajo deñ `Pipeline`
* `stage`: bloque que define cada uno de los pasos
* `steps`: bloque en el que se concreta qué se debe ejecutar en cada paso, como por ejemplo
  ejecutar `make`, lanzar los tests, compilar, etc.



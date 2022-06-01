### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 1](/slides/images/es/0010/first_jenkins_job_step_1.png)<!-- .element: class="plain" -->

notes:

Al hacer click en "Nueva tarea" dentro del menú principal del panel de Jenkins, llegamos a este formulario.

A lo largo del curso veremos todas las opciones disponibles para crear tareas, de momento seleccionaremos
la primera opción "Crear un proyecto de estilo libre".

Este tipo de tareas son idóneas para programar y ejecutar tareas sencillas que no tienen dependencias entre sí
ni un flujo condicional de ejecución.

En la tarea que vamos a ejecutar de ejemplo, compilaremos un pequeño programa en C que genera un número aleatorio
y en función de si ese número es mayor o menor que cero, la tarea fallará o se completará con éxito.

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 2](/slides/images/es/0010/first_jenkins_job_step_2.png)<!-- .element: class="plain" -->


notes:

En el primer paso incluiremos una descripción para nuestra tarea únicamente. El resto de opciones
las dejamos sin marcar.

Como se puede observar en la captura que una de las opciones es la reservar un recurso 
(This build requirese lockable resources). En una diapositiva anterior hemos comentado que el 
plugin [`Lockable Resources Plugin`](https://wiki.jenkins.io/display/JENKINS/Lockable+Resources+Plugin)
permite definir recursos y solicitarlos durante la ejecución de las tareas. Aquí vemos cómo podemos hacerlo:

![First Jenkins Job Step 2 with lockable resource](/slides/images/es/0010/first_jenkins_job_step_2_with_lockable_resource.png)<!-- .element: class="plain" -->

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 3](/slides/images/es/0010/first_jenkins_job_step_3.png)<!-- .element: class="plain" -->

notes:

En el siguiente paso le decimos a nuestra tarea de dónde sacará el código fuente. Seleccionamos ninguno
ya que en este ejemplo vamos a incluir el código en C dentro de la propia tarea.

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 4](/slides/images/es/0010/first_jenkins_job_step_4.png)<!-- .element: class="plain" -->

notes:

En el siguiente paso le decimos a nuestra tarea cómo queremos que esta se empiece a ejecutar.
No seleccionaremos ninguna opción porque la lanzaremos nosotros manualmente.

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 5](/slides/images/es/0010/first_jenkins_job_step_5.png)<!-- .element: class="plain" -->

notes:

En el siguiente paso podemos configurar el entorno de ejecución. Como se ve en la captura,
seleccionaremos la opción que muestra en la consola un timestamp de ejecución de los comandos.


^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 6.1](/slides/images/es/0010/first_jenkins_job_step_6_1.png)<!-- .element: class="plain" -->

notes:

Una vez realizada la configuración, pasamos al corazón de la tarea: el lugar en el que ejecutamos aquello que queramos
hacer.

Seleccionamos la opción "Ejecutar línea de comandos"


^^^^^^
#### Nuestro Primer trabajo en Jenkins

Crear fichero `main.c` en el Workspace de la tarea

```C
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main()
{
    int randomnumber = 0;
    srand(time(NULL));
    randomnumber = rand() % 10;
    printf("randomnumber=%d\n", randomnumber);
    if(randomnumber <= 4) {
      return 0;
    } else {
      return 1;
    }
}
```

notes:

Este fichero se guarda en el Workspace de la tarea que está en `$JENKINS_HOME/workspace/Primera\ tarea/`.

En mi máquina esa carpeta se encuentra en `/Users/aalba/.jenkins/workspace/Primera tarea`.

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 6.3](/slides/images/es/0010/first_jenkins_job_step_6_3.png)<!-- .element: class="plain" -->

notes:

Agregamos un nuevo paso de tipo "Ejecutar línea de comandos" para compilar el programa

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 6.4](/slides/images/es/0010/first_jenkins_job_step_6_4.png)<!-- .element: class="plain" -->

notes:

Agregamos un nuevo paso de tipo "Ejecutar línea de comandos" para ejecutar el programa

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 7](/slides/images/es/0010/first_jenkins_job_step_7.png)<!-- .element: class="plain" -->

notes:

En el último paso, definimos qué queremos acciones queremos qué ocurran después de la ejecución.
Podemos enviar notificaciones, publicar los resultados de los tests, borrar el espacio de trabajo,
y un sin fin de opciones que podemos ampliar a través de plugins.

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 8](/slides/images/es/0010/first_jenkins_job_step_8.png)<!-- .element: class="plain" -->


notes:

Una vez creada la tarea, procedemos a ejecutarla.

^^^^^^
#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Step 9](/slides/images/es/0010/first_jenkins_job_step_9.png)<!-- .element: class="plain" -->


^^^^^^

#### Nuestro Primer trabajo en Jenkins

![First Jenkins Job Results](/slides/images/es/0010/first_jenkins_job_results.png)<!-- .element: class="plain" -->

notes:

Cuando ejecutamos la tarea, si el número aleatorio es menor que 5, jenkins recoge un cero como salida
del ultimo paso y considera que la ejecución ha sido exitosa (icono azul).

Si por el contrario, el número el mayor o igual que 5, jenkins recoge un 1 y considera que la ejecución
ha fallado, mostrando un icono rojo.

^^^^^^

#### Nuestro Primer trabajo en Jenkins: Información de una ejecución

![Build dashboard](/slides/images/es/0010/build_dashboard.png)<!-- .element: class="plain" -->


notes:

Podemos hacer click sobre una ejecución para acceder a la información sobre la misma.

^^^^^^

#### Nuestro Primer trabajo en Jenkins: Información de una ejecución

![Build console output](/slides/images/es/0010/build_console_output.png)<!-- .element: class="plain" -->


notes: 

En la sección de la salida por consola podemos ver el log de todo el proceso de ejecución de la tarea, incluyendo
los timestamps que hemos activado en la configuración de la tarea así como la salida estándar de nuestro programa en C.
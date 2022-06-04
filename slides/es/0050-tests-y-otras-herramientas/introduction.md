### Introducción: Herramientas

En esta sección vamos a partir de un código fuente muy sencillo y vamos a 
añadirle diversas herramientas para mejorar la calidad del mismo.

^^^^^^

#### Introducción: Herramientas

El objetivo de la integración de estas herramientas dentro de nuestro sistema de 
integración / despliegue contínuo es la

**automatización de su uso**

notes:

Lo que se pretende es que sean el sistema el que haga todas estas comprobaciones de manera 
automática. Buscamos evitar que los miembros del equipo tengan que estar pendientes de 
ejecutar todas estas herramientas cada vez que quieren subir código al repositorio. 

^^^^^^

#### Introducción: Herramientas

* DOxygen: sistema de auto-documentación de código
* Cppcheck: Análisis estático de código
* Warnings Plugin - Next Generation: muestra los warnings de nuestro código
* Cppunit: Test unitarios

^^^^^^

#### Introducción: Tarea de estilo libre

Para instalar y probar las herramientas que usamos en esta sección, necesitaremos una 
tarea de estilo libre.

Repositorio: [https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number](https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number)

^^^^^^

#### Introducción: Tarea de estilo libre

<img src="/slides/images/es/0050/create_freestyle_job_step_1.png" alt="Create Free Style Job Step 1" class="r-stretch">

^^^^^^

#### Introducción: Tarea de estilo libre

<img src="/slides/images/es/0050/create_freestyle_job_step_2.png" alt="Create Free Style Job Step 2" class="r-stretch">

^^^^^^

#### Introducción: Tarea de estilo libre

<img src="/slides/images/es/0050/create_freestyle_job_step_3.png" alt="Create Free Style Job Step 3" class="r-stretch">

^^^^^^

#### Introducción: Tarea de estilo libre

<img src="/slides/images/es/0050/create_freestyle_job_step_4.png" alt="Create Free Style Job Step 4" class="r-stretch">


^^^^^^

#### Introducción: Tarea de estilo libre

Creamos el proyecto que usaremos en el resto de las secciones
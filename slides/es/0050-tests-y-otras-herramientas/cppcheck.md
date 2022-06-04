### Análisis estático de código: CppCheck

CppCheck es un analizador estátido de código:

* Dead pointers
* Division by zero
* Integer overflows
* Invalid bit shift operands
* y más...

[Ir al proyecto](http://cppcheck.sourceforge.net)

^^^^^^

### CppCheck

El [código del ejemplo](https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number)
contiene una función que CppCheck detecta como errónea y dará un error.

^^^^^^

### CppCheck

Instalar la herramienta:

```bash
> sudo apt install cppcheck
```

^^^^^^

### CppCheck

Verificar que funciona:

```bash
ejemplo-modulo-6 > cppcheck main.c
Checking main.c ...
[main.c:94]: (error) Array 'stack[20]' accessed at index 20, which is out of bounds.
ejemplo-modulo-6 >
```

^^^^^^

### CppCheck: Instalar el plugin

<img src="/slides/images/es/0050/cppcheck_plugin_installation_step_1.png" alt="cppcheck_plugin_installation_step_1" class="r-stretch">

^^^^^^

### CppCheck: Configuración global

Este Plugin no requiere de una configuración global como ocurría con DOxygen.

^^^^^^

### CppCheck: Añadir paso para generar el informe

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_step_1.png" alt="cppcheck_add_step_to_job_step_1" class="r-stretch">

^^^^^^

### CppCheck: Añadir paso para generar el informe

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_step_2.png" alt="cppcheck_add_step_to_job_step_2" class="r-stretch">

notes:

Si miras [el repositorio](https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number)
podrás ver que en `Makefile` del mismo se crearon las siguientes tareas para correr `cppcheck`

```Makefile
cppcheck-xml :
        cppcheck *.c --xml --xml-version=2 --enable=all --inconclusive --language=c *.c 2>reports/cppcheck/report.xml
cppcheck : 
        cppcheck *.c --enable=all --inconclusive --language=c *.c

```

En particular, la tarea `cppcheck-xml` genera un informe en formato XML que es el que usaremos
en el siguiente paso para obtener el informe.

^^^^^^

### CppCheck: Añadir paso para generar el informe

Añadimos una acción para ejecutar después:

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_step_3-1.png" alt="cppcheck_add_step_to_job_step_3-1" class="r-stretch">

^^^^^^

### CppCheck: Añadir paso para generar el informe

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_step_3-2.png" alt="cppcheck_add_step_to_job_step_4" class="r-stretch">

notes:

En este paso ponemos la ruta del fichero con el informe que hemos utilizado en la tarea `cppcheck-xml` del 
[`Makefile`](https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number/blob/master/Makefile)


^^^^^^

### CppCheck: Añadir paso para generar el informe

En las opciones avanzadas

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_step_3-3.png" alt="cppcheck_add_step_to_job_step_3-2" class="r-stretch">

notes:

Al poner un umbral de 0, la ejecución fallará cuando haya al menos un error o warning en 
cppcheck.

^^^^^^

#### CppCheck: Añadir paso para generar el informe

⚠️ ¡Atención! Si estamos ejecutando Jenkins sobre Java 11, veremos el siguiente error en
el log de la ejecución:

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_error_with_java_11.png" alt="cppcheck_job_error_with_java_11" class="r-stretch">

^^^^^^

### CppCheck: Añadir paso para generar el informe

Para instalar Java 8:

```bash 
> sudo apt install openjdk-8-jdk
> sudo update-alternatives --config java
> sudo systemctl restart jenkins
```

Una vez reiniciado, lanzar una nueva ejecución...

^^^^^^

#### CppCheck: Añadir paso para generar el informe

Si no ponemos ningún umbral, la ejecución no fallará a pesar de que se generen errores en cppcheck:

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_cppcheck_results_without_threshold.png" alt="cppcheck_results" class="r-stretch">

^^^^^^

#### CppCheck: Añadir paso para generar el informe

Si ponemos un umbral, la ejecución será inestable cuando se generen errores en cppcheck:

<img src="/slides/images/es/0050/cppcheck_add_step_to_job_cppcheck_results_with_threshold.png" alt="cppcheck_results" class="r-stretch">

^^^^^^

### CppCheck

[Página del Plugin](https://plugins.jenkins.io/cppcheck/)

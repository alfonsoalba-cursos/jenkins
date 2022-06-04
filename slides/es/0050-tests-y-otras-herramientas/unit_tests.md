### CMocka: Tests Unitarios en C

Para demostrar cómo ejecutar los tests y mostrar los resultados en Jenkins,
usaremos [`CMocka`](https://cmocka.org)

notes:

¿Porqué hemos seleccionado este framework de testing en C? Los motivos han sido prácticos y pedagógicos principalmente:

* Es un framework utilizado en varios proyectos de software libre de renombre como puede ser Samba o Open VPN
* Genera directamente la salida en un formato XML que jenkins entiende. Cppunit requiere transformar el XML para que
  Jenkins lo pueda leer
* Es sencillo de utilizar e integrar en el código que usamos en los ejemplos, lo que hace que no
  tengamos que dedicarle demasiado tiempo a pensar en CMocka y dediquemos nuestra energía a ver cómo
  integrarlo en Jenkins, que es el objetivo de este curso.
  
En el [este enlace](https://stackoverflow.com/a/65845) tienes una lista con varios otros frameworks que puedes investigar.

^^^^^^

#### CMocka: Tests Unitarios en C

[El repositorio de ejemplo](https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number) 
ya tiene creados dos sencillos test unitarios de la función `is_armstrong_number`.

Para poder correrlos necesitamos hacer los siguiente:

```bash
> sudo apt install libcmocka-dev libcmocka0
> make tests
```
^^^^^^
#### CMocka: Instalar el plugin

No hace falta instalar el plugin, sólo ejecutar los tests y exportar los resultados en el
formato adecuado:

```Makefile
tests-xml: clean armstrong.o stack.o
        gcc tests/test_is_armstrong_number.c armstrong.o stack.o -lm -lcmocka -o tests/build/test_is_armstrong_number
        CMOCKA_XML_FILE=reports/cmocka/%g.xml CMOCKA_MESSAGE_OUTPUT=xml ./tests/build/test_is_armstrong_number
```

^^^^^^

#### CMocka: Añadir paso para ejecutar los tests

<img src="/slides/images/es/0050/cmocka_add_step_to_job_step_1.png" alt="Add make tests-xml step" class="r-stretch">

notes:

Si miras [el repositorio](https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number)
podrás ver que en `Makefile` del mismo se crearon las siguientes tareas para correr `cmocka`

```Makefile
tests: clean armstrong.o stack.o
        gcc tests/test_is_armstrong_number.c armstrong.o stack.o -lm -lcmocka -o tests/build/test_is_armstrong_number
        CMOCKA_MESSAGE_OUTPUT=stdout CMOCKA_XML_FILE='' ./tests/build/test_is_armstrong_number

tests-xml: clean armstrong.o stack.o
        gcc tests/test_is_armstrong_number.c armstrong.o stack.o -lm -lcmocka -o tests/build/test_is_armstrong_number
        CMOCKA_XML_FILE=reports/cmocka/%g.xml CMOCKA_MESSAGE_OUTPUT=xml ./tests/build/test_is_armstrong_number
```

En este paso utilizamos la tarea tests-xml.

^^^^^^

#### CMocka: Añadir acción para ejecutar después

<img src="/slides/images/es/0050/cmocka_add_step_to_job_step_2.png" alt="add post action" class="r-stretch">

^^^^^^

#### CMocka: Añadir acción para ejecutar después

<img src="/slides/images/es/0050/cmocka_add_step_to_job_step_3.png" alt="add post action" class="r-stretch">

^^^^^^

#### CMocka: Resultados

<img src="/slides/images/es/0050/cmocka_results_build_status_page.png" alt="cmocka_results" class="r-stretch">


notes:

En este caso, vemos que los tests están pasando y no se ha producido errores. Haciendo click sobre
podremos ver el detalle de los tests.

En esta diapositiva se puede observar, además de que los tests están pasando, 
**que los cambios introducidos en el código han resuelto todos los warnings que estaba
dando cppcheck** y mejorando con ello la calidad de nuestro código:

<img src="/slides/images/es/0050/cmocka_results_build_status_page_cppcheck.png" alt="cppcheck warnings fixed" class="r-stretch">
 


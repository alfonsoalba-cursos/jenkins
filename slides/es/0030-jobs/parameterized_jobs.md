### Tareas Parametrizadas

Permiten lanzar una ejecución pasando uno o varios parámetros.

Estos parámetros están disponibles durante la ejecución de la tarea como **variables de entorno**.

^^^^^^

#### Tareas Parametrizadas

En la sección "General" de la configuración de la tarea, seleccionamos la opción "Esta ejecución debe parametrizarse".

<img src="/slides/images/es/0030/parameterized_build_1.png" alt="parameterized builds" class="r-stretch"><!-- .element: class="plain" -->


^^^^^^

#### Tareas Parametrizadas

Seleccionamos el tipo de parámetro y rellenamos los valores que ese parámetro necesita.

<img src="/slides/images/es/0030/parameterized_build_2.png" alt="parameterized builds" class="r-stretch"><!-- .element: class="plain" -->


^^^^^^

#### Tareas Parametrizadas

Cuando lancemos la ejecución manualmente, debemos rellenar los parámetros.

<img src="/slides/images/es/0030/parameterized_build_3.png" alt="parameterized builds" class="r-stretch"><!-- .element: class="plain" -->


^^^^^^

#### Tareas Parametrizadas

* Los plugins pueden definir sus propios tipos de parámetros
* Cuando se utiliza un disparador de ejecución **no es posible pasar parámetros** 
  (se usa el valor por defecto)
* Si se usa una URL como disparador, es posible pasar los parámetros por URL

```
http://server/job/myjob/buildWithParameters?PARAMETER=Value
```

notes:

Algunos de los disparadores que no permiten el uso de parámetros son SCM polling, downstream builds y ejecuciones programadas.
En estos casos se utilizará el valor por defecto definido al configurar el parámetro.

Los parámetros que se pasan por URL diferencian mayúsculas de minúsculas por lo que no 
es lo mismo

```
http://server/job/myjob/buildWithParameters?PARAMETER=Value
```

que

```
http://server/job/myjob/buildWithParameters?Parameter=Value
```

^^^^^^

#### 💻️ Tarea: Ejemplo de uso de parámetro de tipo fichero

Crea una nueva tarea de tipo estilo libre.

^^^^^^

#### 💻️ Tarea: Ejemplo de uso de parámetro de tipo fichero

Parametriza la tarea para que admita un fichero:

<img src="/slides/images/es/0030/parameterized_build_example_1_set_parameters.png" alt="parameterized_build_example_1_set_parameters" class="r-stretch">

^^^^^^

#### 💻️ Tarea: Ejemplo de uso de parámetro de tipo fichero

Parametriza la tarea para que admita un fichero:

<img src="/slides/images/es/0030/parameterized_build_example_1_build_step.png" alt="parameterized_build_example_1_build_step" class="r-stretch">

^^^^^^

#### 💻️ Tarea: Ejemplo de uso de parámetro de tipo fichero

Ejecuta la tarea, sube un fichero de texto y verifica que efectivamente la información sale en
log de la tarea.

notes:

Accede al workspace y verifica que el fichero está físicamente ahí.

Con esto podemos hacer cosas tan inútiles como subir un fichero mp3 y reproducirlo. Para ello,
instalamor sox en la máquina virtual:

```bash 
> sudo apt install sox libsox-fmt-all
```

Y luego añadir un paso que reproduzca el fichero. Con las máquinas virtuales
no se escucha siempre pero si tienes Jenkins instalado en tu máquina si se escucha.



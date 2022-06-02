### Tareas Parametrizadas

Permiten lanzar una ejecución pasando uno o varios parámetros.

Estos parámetros están disponibles durante la ejecución de la tarea como **variables de entorno**.

^^^^^^

#### Tareas Parametrizadas

En la sección "General" de la configuración de la tarea, seleccionamos la opción "Esta ejecución debe parametrizarse".

![parameterized builds](/slides/images/es/0030/parameterized_build_1.png)<!-- .element: class="plain" -->


^^^^^^

#### Tareas Parametrizadas

Seleccionamos el tipo de parámetro y rellenamos los valores que ese parámetro necesita.

![parameterized builds](/slides/images/es/0030/parameterized_build_2.png)<!-- .element: class="plain" -->


^^^^^^

#### Tareas Parametrizadas

Cuando lancemos la ejecución manualmente, debemos rellenar los parámetros.

![parameterized builds](/slides/images/es/0030/parameterized_build_3.png)<!-- .element: class="plain" -->


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

![parameterized_build_example_1_set_parameters](/slides/images/es/0030/parameterized_build_example_1_set_parameters.png)

^^^^^^

#### 💻️ Tarea: Ejemplo de uso de parámetro de tipo fichero

Parametriza la tarea para que admita un fichero:

![parameterized_build_example_1_build_step](/slides/images/es/0030/parameterized_build_example_1_build_step.png)

^^^^^^

#### 💻️ Tarea: Ejemplo de uso de parámetro de tipo fichero

Ejecuta la tarea, sube un fichero de texto y verifica que efectivamente la información sale en
log de la tarea.

notes:

Accede al workspace y veerifica que el fichero está físicamente ahí.

Con esto podemos hacer cosas tan inútiles como subir un fichero mp3 y reproducirlo. Para ello,
instalamor sox en la máquina virtual:

```bash 
> sudo apt install sox libsox-fmt-all
```

Y luego añadir un paso que reproduzca el fichero. Con las máquinas virtuales
no se escucha siempre pero si tienes Jenkins instalado en tu máquina si se escucha.



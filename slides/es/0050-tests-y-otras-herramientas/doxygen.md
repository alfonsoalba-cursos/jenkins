### DOxygen

Generar documentación para nuestro código.

^^^^^^

#### DOxygen

Instalamos la herramienta en el maestro:

```bash
> sudo apt install doxygen graphviz
...
> doxygen --version
1.8.13
> 
```

^^^^^^

#### DOxygen

Clonar [el repositorio](https://github.com/alfonsoalba-cursos/openwebinars-jenkins-is-armstrong-number)
si no lo has clonado todavía.

^^^^^^

#### DOxygen

Generar la documentación para verificar que la instalación de DOxygen funciona correctamente

```bash
> doxygen
...
Generating alphabetical compound index...
Generating hierarchical class index...
Generating graphical class hierarchy...
Generating member index...
Generating file index...
Generating file member index...
Generating example index...
finalizing index lists...
writing tag file...
Running dot...
lookup cache used 7/65536 hits=9 misses=7
finished...
``` 
^^^^^^

#### DOxygen

<img src="/slides/images/es/0050/doxygen_main_c_file_documentation.png" alt="doxygen_main_c_file_documentation" class="r-stretch">

^^^^^^

#### DOxygen: Instalar el plugin de DOxygen

<img src="/slides/images/es/0050/doxygen_plugin_installation_step_1.png" alt="doxygen_plugin_installation_step_1" class="r-stretch">

^^^^^^

#### DOxygen: Configuración global

Ir a "Jenkins" -> "Global Tool Configuration"

<img src="/slides/images/es/0050/global_doxygen_configuration.png" alt="Global DOxygen Configuration" class="r-stretch">

^^^^^^

#### DOxygen: Añadir paso para generar la documentación

Ir a la configuración de la tarea `modulo-6`

<img src="/slides/images/es/0050/doxygen_add_step_to_job_step_1.png" alt="doxygen_add_step_to_job_step_1" class="r-stretch">

^^^^^^

#### DOxygen: Añadir paso para generar la documentación

<img src="/slides/images/es/0050/doxygen_add_step_to_job_step_2.png" alt="doxygen_add_step_to_job_step_2" class="r-stretch">


^^^^^^

#### DOxygen: Añadir paso para generar la documentación

Añadimos una acción para ejecutar después:

<img src="/slides/images/es/0050/doxygen_add_step_to_job_step_3.png" alt="doxygen_add_step_to_job_step_3" class="r-stretch">

^^^^^^

#### DOxygen: Añadir paso para generar la documentación

Añadimos una acción para ejecutar después:

<img src="/slides/images/es/0050/doxygen_add_step_to_job_step_4.png" alt="doxygen_add_step_to_job_step_4" class="r-stretch">

^^^^^^

#### DOxygen: Añadir paso para generar la documentación

Lanzamos una ejecución de la tarea y...

<img src="/slides/images/es/0050/doxygen_view_build_generated_documentation.png" alt="doxygen_view_build_generated_documentation" class="r-stretch">


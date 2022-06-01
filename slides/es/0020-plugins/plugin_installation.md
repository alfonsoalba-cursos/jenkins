
### Instalación de plugins

Los plugins de Jenkins son posiblemente la causa de que Jenkins sea uno de los 
proyectos más de software libre más utilizado en la industria.

^^^^^^

#### Instalación de plugins

Los plugins aportan a Jenkins:

* Extensibilidad
* Adaptabilidad
* Flexibilidad

notes:

El sistema de plugins permite extender Jenkins prácticamente hasta el infinito.

Partiendo de una funcionalidad básica, se puede extender Jenkins para adaptarlo prácticamente
a cualquier entorno: Java, PHP, Python, Ruby, nodejs... 

Si al sistema de plugins le añadimos la integración con Docker, Jenkins nos permite automatizar
casi cualquier proyecto que necesitemos.

^^^^^^

#### Instalación de plugins

![Plugin installation step 1](/slides/images/es/0020/plugin_installation_step_1.png)

notes:

Podemos acceder desde el panel de jenkins o utilizando la barra con los breadcrumbs, desplegando el menú
del primer elemento: "Jenkins"

![Plugin installation step 1 option](/slides/images/es/0020/plugin_installation_step_1_option.png)


^^^^^^

#### Instalación de plugins

![Plugin installation step 2](/slides/images/es/0020/plugin_installation_step_2.png)

^^^^^^

#### Instalación de plugins

![Plugin installation step 3](/slides/images/es/0020/plugin_installation_step_3.png)

notes:

En esta pantalla podemos ver los plugins que tienen pendiente alguna actualización.

En las otras ventanas podemos ver:

* Plugins que tenemos instalados
* Todos los plugins, entre los que podemos buscar plugins nuevos para extender la funcionalidad de nuestro Jenkins
* Configuración avanzada en la que podemos cambiar el repositorio de plugins, instalarlos a partir de un fichero .hpi
  o configurar el proxy para la descarga.
  

^^^^^^

#### 💻️ Instalación de plugins: Instalar el plugin de Chuck Norris...

<video controls>
  <source data-src="/slides/videos/es/0020/instalar_chuck_norris_plugin_en_jenkins.mp4" type="video/mp4" />
</video>

notes:

Una vez instalado el plugin, lo que haremos será incluirlo en nuestra tarea.

^^^^^^

#### 💻️ Instalación de plugins: Activar Chuck Norris en nuestra tarea...

<video controls>
  <source data-src="/slides/videos/es/0020/activar_plugin_chuck_norris.mp4" type="video/mp4" />
</video>

^^^^^^

### Repositorio de plugins

[https://plugins.jenkins.io/](https://plugins.jenkins.io/)

notes:

Esta página nos recopila la información de los plugins de Jenkins.

Podemos buscar por ejemplo el plugin que acabamos de instalar:

[https://plugins.jenkins.io/chucknorris](https://plugins.jenkins.io/chucknorris)

En la página del plugin se nos indica cómo activarlo.

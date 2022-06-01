### Gestión de plugins

Antes de ponernos como locos a instalar plugins...

* Leer su documentación para verificar que resuelve lo que necesitamos
* Verificar las estadísticas de uso y la frecuencia de actualización
* Verificar compatibilidad con nuestra versión de Jenkins
* Entender bien el funcionamiento del plugin para poder sacarle el máximo partido

notes:

Los plugins de Jenkins debemos tratarlas como una dependencia más de nuestro proyecto. Al igual que
no incluimos librerías de código desconocidas y que no tiene mantenimiento, con los plugins
debemos ser igual de cuidadosos. 

Además, la elección de un plugin que no tenga mantenimiento puede hacer que a medio o largo plazo 
no podamos actualizar Jenkins al no disponer de una versión compatible.

Estas recomendaciones son válidas para casi cualquier sistema de gestión de dependencias, que es como debemos
tratar los plugins de Jenkins.

^^^^^^

### Gestión de plugins: Borrar plugins

![Installed Plugins](/slides/images/es/0020/installed_plugins.png)<!-- .element: class="plain" -->

notes:

Para borrar plugins, accedemos a la pestaña "Plugins instalados" dentro de gestión de plugins. 

^^^^^^

#### Gestión de plugins: Borrar plugins

![Installed Plugins](/slides/images/es/0020/uninstall_plugins.png)<!-- .element: class="plain" -->

notes:

En la columna de la derecha disponemos de un botón desinstalar plugins. No podemos desinstalar cualquier plugin...
Si ponemos el ratón sobre el botón desinstalar, nos indicará porqué no podemos desinstalarlo como vemos en la siguiente
diapositiva.

^^^^^^

#### Gestión de plugins: Borrar plugins

![Installed Plugins](/slides/images/es/0020/why_i_cannot_uninstall_a_plugin.png)<!-- .element: class="plain" -->

notes:

Si queremos saber porqué no podemos desinstalar un plugin, basta poner el ratón sobre el botón "Desinstalar"

^^^^^^
#### Gestión de plugins: Borrar plugins

Al desinstalar un plugin:
* Se borra el fichero `.jpi` o `.hpi` del disco duro
* El plugin continúa funcionando con normalidad hasta que Jenkins se reinicia
* Una vez Jenkins se reinicia, el plugin y todas sus opciones desaparecen
* La configuración del plugin permanece intacta: si se vuelve a instalar el plugin la recuperaremos

^^^^^^
#### Gestión de plugins: Borrar plugins

Al desinstalar un plugin:
* Si alguna configuración de una vista, tarea, ejecución o esclavo depende del plugin, Jenkins informará durante el
  arranque e ignorará los fragmentos relacionados con los plugins existentes como si no estuviesen
* Si queremos borrar la configuración, podemos hacerlo desde "Administrar Jenkins" -> "Datos Antiguos"

^^^^^^

### Gestión de plugins: Desactivar plugins

![Disable Plugins](/slides/images/es/0020/disable_plugins.png)<!-- .element: class="plain" -->

^^^^^^

#### Gestión de plugins: Desactivar plugins

![Why I cannot disable a plugin](/slides/images/es/0020/why_i_cannot_disable_a_plugin.png)<!-- .element: class="plain" -->

notes:

Si queremos saber porqué no podemos desactivar un plugin, basta poner el ratón sobre el checkbox para desinstalar
el plugin.

^^^^^^

#### Gestión de plugins: Desactivar plugins

Al desinstalar un plugin:
* NO se borra el fichero `.jpi` o `.hpi` del disco duro
* Jenkins renocerá el plugin como instalado pero no lo iniciará, por lo que las 
  extensiones relacionadas con él no serán visibles
* A la configuración de un plugin desactivado le ocurrirá lo mismo que a la de 
  un plugin que ha sido borrado

^^^^^^

#### Gestión de plugins: Desactivar plugins

Un plugin también puede desactivarse creando el fichero:

```
$JENKINS_HOME/plugins/$PLUGIN_NAME.jpi.disabled
```

Pueden reactivarse borrando ese fichero.

^^^^^^

### Gestión de plugins: Downgrade plugins

A veces, al actualizar un plugin, podemos encontrarnos con fallos inesperados debido a 
incompatibilidad con otros plugins.

^^^^^^
#### Gestión de plugins: Downgrade plugins

Jenkins permite volver a la versión anterior de un plugin recientemente actualizado:

![Downgrade Plugins](/slides/images/es/0020/downgrade_plugins.png)<!-- .element: class="plain" -->

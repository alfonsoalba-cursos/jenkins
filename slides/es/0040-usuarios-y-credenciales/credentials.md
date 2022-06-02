### Credenciales

Forma que tiene Jenkins de almacenar _secrets_ (contraseñas, claves privadas, certificados, etc)
de manera segura.

^^^^^^

#### Credenciales

Los credenciales almacenados pueden ser usados:
* Por cualquier objeto de Jenkins (credenciales globales)
* Por una determinada tarea o pipeline
* Por un determinado usuario

^^^^^^

#### Credenciales: tipos

* Cadena de texto
* Usuario / Contraseña
* Fichero
* Usuario y clave privada SSH
* Certificado

^^^^^^

#### Credenciales: ¿cómo funcionan?

Jenkins almacena los credenciales cifrados dentro de la instancia Master del cluster. 

A cada credencial se le asigna un ID.

^^^^^^

#### Credenciales: ¿cómo funcionan?

Si una Tarea o Pipeline necesita usar un credencial, este almacena el ID del credencial que necesita 
y solicita a Jenkins los valores en tiempo de ejecución.

Así el usuario puede usar los credenciales sin necesidad de verlos.

^^^^^^

#### Credenciales: permisos

Cualquier usuario que tenga el permiso "Credentials > Create" puede crear nuevos credenciales.

^^^^^^

#### Credenciales: Nuevo credencial

![Create Credentials](/slides/images/es/0040/credentials_create_1.png)<!-- .element: class="plain" -->

^^^^^^

#### Credenciales: Nuevo credencial

Los campos comunes a cualquier credencial que se cree son:

* Tipo
* Scope: `Global` o `Jenkins`
* ID: cadena de texto que identifica el credencial (p.e. `clave-ssh-github-proyecto-xyz`)
* Descripción

notes:

El _scope_ de un credencial puede ser:

* `Global`: si el credencial se quiere utilizar dentro de una Tarea o un Pipeline.
* `Jenkins`: si se trata de un credencial que va a utilizar la propia instancia de Jenkins 
  para desempeñar alguna función administrativa como por ejemplo autenticarse para enviar un email, 
  conectarse con un agente, etc.


^^^^^^

#### Credenciales: Nuevo credencial


![Create Credentials](/slides/images/es/0040/credentials_create_2.png)<!-- .element: class="plain" -->

^^^^^^

#### Credenciales: Nuevo credencial


![Create Credentials](/slides/images/es/0040/credentials_create_3.png)<!-- .element: class="plain" -->


^^^^^^

#### Credenciales: Usando un credencial ya existente

![Create Credentials](/slides/images/es/0040/credentials_create_4.png)<!-- .element: class="plain" -->

  
notes:

El credencial que acabamos de crear podemos utilizarlo dentro de una tarea. Por ejemplo,
como se muestra en la captura, para conectarnos a un repositorio privado de git por https y
descargarnos el código fuente en el Workspace.   

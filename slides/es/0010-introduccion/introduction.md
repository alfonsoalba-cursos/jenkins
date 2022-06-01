### Introducción

* Es uno de los programas de automatización más utilizado en la industria
* Escrito en Java y se ejecuta sobre la máquina virtual de Java
* Portable: Linux, Windows y OSX
* [Código abierto](https://github.com/jenkinsci/jenkins)

^^^^^^

#### Introducción

* Sumamente extensible a través de [plugins](https://plugins.jenkins.io/)
* Comunidad muy extensa y muy activa
* Permite escalar vertical y horizontal
  * Ejecutar más jobs en una sola máquina (escalado vertical)
  * Distribuir jobs entre múltiples máquinas (escalado horizontal)

^^^^^^

#### Introducción

* Actualizaciones y parches de seguridad liberados habitualmente
* Gracias a los `pipelines` es posible escribir los procesos de automatización usando código,
  **integrándolo en nuestro código fuente**

notes:

Desde el punto de vista de la seguridad, debemos esperar que esta aplicación sea blanco de los ataques a nuestra
infraestructura. El motivo es que jenkins contiene todo lo necesario para desplegar nuestro proyecto:
* Credenciales
* Claves privadas y certificados
* API keys de terceros
* El código fuente del proyecto
* Acceso a los repositorios que contienen el código

El equipo de jenkins es consciente y libera de manera rápida y con mucha frecuencia parches y mejoras
para corregir los problemas que se van detectando.

Nosotros debemos ser conscientes de esto y tomas las medidas adecuadas para proteger esta pieza de 
nuestra infraestructura.

## `pipelines`

Durante el curso veremos una de las características más potentes de jekins, los `pipelines`.

Con esto, podemos describir en código dentro de nuestro repositorio cuales serán nuestros procesos de automatización.


------

###  CI / CD / CD

^^^^^^

#### Continuous integration

Es la práctica de integrar el código de múltiples desarrolladores en un repositorios central de manera constante 
(y a ser posible, automatizada)

^^^^^^

#### Continuous integration

* Objetivo: Reducir los conflictos y facilitar su resolución


notes:

Cada vez que una persona introduce código nuevo en la aplicación, este se integra con el resto del código, se ejecutan
los tests y, en caso de que se encuentre algún problema se notifica al desarrollador responsable. 

Suele ser un requisito imprescindible en equipos de desarrollo con varias personas manipulando el mismo código fuente. 

^^^^^^

#### Continuous integration

¿Qué nos aporta?:

* Reducción de los problemas derivados de la integración de ramas de larga duración
* Nos ayuda a detectar los errors antes y facilita su resolución ya que hay menos código involucrado
* Ahorra tiempo y dinero
* El equipo recibe feedback constante
* Promueve el testeo automatizado
* Promueve una mejora en la calidad del software

^^^^^^

#### Continuous delivery

Es la práctica de mantener el software en un estado tal que **siempre esté listo para ser desplegado**. 

Es decir, cualquier versión del software ha sido probada y está lista para ser desplegada en entornos de producción
o similares

^^^^^^

#### Continuous delivery

¿Qué nos aporta?:

* Reducción de riesgo
* Progreso visible
* Feedback del usuario

notes:

* Reducción de riesgo: se despliegan cambios más pequeños de manera más frecuente, lo que reduce el riesgo de que 
  grandes problemas se cuelen en producción. Además, los errors y problemas son más fáciles de encontrar y de corregir
* Progreso visible: Si medimos el progreso en base a la cantidad de funcionalidades que se despliegan en producción **y que funcionan**, 
  esta práctica nos asesgura que el proyecto estará constantemente en progreso.
* Feedback del usuario: al disponer de un software que puede ser probado por usuarios, departamentos de calidad, jefes de producto o por cualquier perfil
  del equipo, estaremos constantemente recibiendo un valioso feedback. Esto nos permitirá priorizar las mejoras de una manera mucho más efectiva

^^^^^^

#### Continuous deployment

Es la práctica de desplegar de manera automática cada cambio en producción.

# Máquina virtual

Configuración de Vagrant para levantar una máquina virtual de Ubuntu 22.10 con el paquete de Jenkins instalado y todas 
las dependencias que necesitamos para hacer el curso de Jenkins.

Nota: la instalación de Jenkins no está terminada, sólo se han instalado los paquetes .deb.

1. [Instala VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. [Instala vagrant](https://www.vagrantup.com/docs/installation/)
1. Instala el plugin [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) si no lo tienes instalado ya
   ```bash 
   > vagrant plugin install vagrant-vbguest
   ```
1. Clona este repositorio:
   ```bash
   > git clone https://github.com/Be-Core-Code/curso-intro-jenkins-vagrant.git
   ``` 
1. Accede al respositorio
   ```bash
   > cd curso-intro-jenkins-vagrant
   ``` 
1. Levanta la máquina virtual:
   ```bash
   > vagrant up --provider virtualbox
   ```
1. Cuando la máquina se descargue y se aprovisionen todos los paquetes, puedes acceder a la máquina virtual:
   ```bash
   > vagrant ssh

   Welcome to Ubuntu 20.10 (GNU/Linux 5.3.X-XX-generic x86_64)

    * Documentation:  https://help.ubuntu.com
    * Management:     https://landscape.canonical.com
    * Support:        https://ubuntu.com/advantage

   System information as of Tue Mar 17 13:36:07 UTC 2022

   System load:  0.12              Processes:             124
   Usage of /:   21.7% of 9.63GB   Users logged in:       0
   Memory usage: 45%               IP address for enp0s3: 10.0.2.15
   Swap usage:   0%


   9 updates can be installed immediately.
   9 of these updates are security updates.
   To see these additional updates run: apt list --upgradable


   vagrant@ubuntu-eoan:~$
   ```

# Más comandos de Vagrant

Para parar la máquina virtual, utiliza `vagrant halt`.

Para borrar la máquina virutal, utiliza `vagrant destroy`


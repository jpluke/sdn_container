# sdn_container

Este repositorio está destinado a alojar los ficheros para crear las imágenes docker necesarias para las prácticas de SDN (Software Defined Networking) de Laboratorio de Redes en Ingeniería de Computadores del Grado en Ingeniería Informática de La Universidad de La Laguna.

Las instrucciones para hacer uso del mismo son las siguientes:

1. Instalar docker

	Siga las instrucciones de: https://docs.docker.com/install/

2. Clonar este repositorio mediante:

	git clone https://github.com/jpluke/sdn_container.git

3. Crear la imagen docker

	docker build . -t sdn/2019.1

4. Ejecutar el contenedor

	sh my_run.sh


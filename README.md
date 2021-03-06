## Reserva del Laboratorio Docente de Aulas Computarizadas (LDAC)
### Versiones
* Rails v4.2.2 
* ruby v2.2.2
* grunt-cli v0.1.13
* grunt v0.4.5
* bower v1.6.5

###Setup del front-end

1. Instalar `nodejs` y `npm`

2. Instalar los componentes de yeoman:

`# npm install -g grunt-cli bower yo generator-karma generator-angular`

3. En la carpeta app/ instalar los componentes de bower y npm:

`$ cd app/`

`$ bower install`

`$ npm install`

###Guia rapida para programar en el front-end

* Para crear controladores, rutas, directivas, filtros, vistas, servicios o decoradores utilizar yo angular:

`$ yo angular:[controller|route|view|...] name`

Para mas informacion leer el [README](https://github.com/yeoman/generator-angular#readme) de yeoman-angular

* Para compilar la app:

`$ grunt`

* Para correr el servidor (de pruebas) del front-end:

`$ grunt serve`

Para mayor informacion sobre **grunt** leer [getting-started#grunt](http://gruntjs.com/getting-started)


### Información para desarrolladores
Mantenemos las tareas pendientes en [trello](https://trello.com/b/WLexTA9j/reserva)

Para mayor información sobre el levantamiento de recursos y proximamente detalles de implementación revisar el [wiki](https://github.com/MAC-USB/reserva/wiki)

La comunicación y documentación se realiza en español


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Departamento.create!(nombre:"Matematica",pcontacto:"not set",codigo:"MA")
Departamento.create!(nombre:"fisica",pcontacto:"not set",codigo:"FS")
Departamento.create!(nombre: "Computacion", codigo:"CI", pcontacto:"not set")

Sala.create!(nombre: "A", windows: false, linux: true,
        video_beam: true, capacidad: 19, ubicacion: "MYS planta baja",
        responsable: "AA")
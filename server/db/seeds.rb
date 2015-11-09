# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Departamento.create!(nombre:"Matematica",codigo:"MA")
Departamento.create!(nombre:"fisica",codigo:"FS")
Departamento.create!(nombre: "Computacion", codigo:"CI")

# No se puede asignar un responsable porque no hay usuarios existentes
Sala.create!(nombre: "A", windows: false, linux: true,
        video_beam: true, capacidad: 19, ubicacion: "MYS planta baja")

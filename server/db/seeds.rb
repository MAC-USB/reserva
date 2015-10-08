# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ci2691 = Materia.create(codigo: "CI2691", 
  nombre: "Laboratorio de Algoritmos y Estructuras I",
  departamento: "CI")

co3211 = Materia.create(codigo: "CO3211", 
  nombre: "Cálculo numérico",
  departamento: "CI")

a = Sala.create(name: "A", 
  capacidad: "19", 
  ubicacion: "MYS planta baja", 
  responsable: "AA", 
  windows: false,
  linux: true, 
  video_beam: true)

e = Sala.create(name: "E", 
  capacidad: "12", 
  ubicacion: "MYS planta baja", 
  responsable: "JP", 
  windows: true,
  linux: true, 
  video_beam: true)

codeblocks = Software.create(nombre: "Code Blocks", 
  version: "1.1.2", 
  link: "http://www.codeblocks.org/", 
  sala: "A")

matlab = Software.create(nombre: "Matlab", 
  version: "2.0", 
  link: "www.mathworks.com/products/matlab", 
  sala: "E")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = Sala.create!(
    nombre: "A",
    windows: false,
    linux: true,
    video_beam: true,
    capacidad: 19,
    ubicacion: "MYS planta baja",
    responsable: "AA"
  )

materias = [
  [
    "CI2691",
    "Laboratorio de Algoritmos y Estructuras I",
    "CI"
    ],
    [
    "CO3211",
    "Cálculo numérico",
    "CI"
    ],
]

softwares = [
  [
    "Code Blocks",
    "1.1.2",
    "http://www.codeblocks.org/"
  ],
  [
    "Matlab",
    "2.0",
    "www.mathworks.com/products/matlab"
  ],
  [
    "Emacs",
    "2.0",
    "https://www.gnu.org/software/emacs/"
  ]
]

materias.each do |codigo, nombre, dpto|
  Materia.create!(codigo: codigo, nombre: nombre, departamento: dpto)
end

softwares.each do |nombre, version, link|
  Software.create!(nombre: nombre, version: version, link: link,
    sala_id: a.id)
end

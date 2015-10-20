namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    [Materia, Software, Sala].each(&:delete_all)

    a = Sala.create!(nombre: "A", windows: false, linux: true,
        video_beam: true, capacidad: 19, ubicacion: "MYS planta baja",
        responsable: "AA")

    d = departamento.create!(nombre: "")

    materias = [
      [ "CI2691", "Laboratorio de Algoritmos y Estructuras I", "CI"],
      ["CO3211", "Cálculo numérico", "CI"],
    ]

    softwares = [
      ["Code Blocks", "1.1.2", "http://www.codeblocks.org/"],
      ["Matlab", "2.0", "www.mathworks.com/products/matlab"],
      ["Emacs", "2.0", "https://www.gnu.org/software/emacs/"]
    ]

    materias.each do |codigo, nombre, dpto|
      Materia.create!(codigo: codigo, nombre: nombre, departamento: dpto)
    end

    softwares.each do |nombre, version, link|
      Software.create!(nombre: nombre, version: version, link: link,
        sala_nombre: a.nombre)
    end

  end
end
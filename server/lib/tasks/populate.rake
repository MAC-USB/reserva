namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    [Materia, Software, Sala, Reserva].each(&:delete_all)

    a = Sala.create!(nombre: "A", windows: false, linux: true,
        video_beam: true, capacidad: 19, ubicacion: "MYS planta baja",
        responsable: "AA")

    materias = [
      [ "CI2691", "Laboratorio de Algoritmos y Estructuras I", "CI"],
      ["CO3211", "Cálculo numérico", "CI"],
    ]

    softwares = [
      ["Code Blocks", "1.1.2", "http://www.codeblocks.org/"],
      ["Matlab", "2.0", "www.mathworks.com/products/matlab"],
      ["Emacs", "2.0", "https://www.gnu.org/software/emacs/"]
    ]

    reservas = [
      ["A", true, ""],
      ["A", false, "Vim, Emacs, Sublime"],
      ["A", true, "Supercollider"],
    ]

    materias.each do |codigo, nombre, dpto|
      Materia.create!(codigo: codigo, nombre: nombre, departamento: dpto)
    end

    softwares.each do |nombre, version, link|
      Software.create!(nombre: nombre, version: version, link: link,
        sala_nombre: a.nombre)
    end

    reservas.each do |sala_nombre, video_beam, software|
      Materia.all.each do |materia|
        Reserva.create!(sala_nombre: sala_nombre, materia: materia,
          video_beam: video_beam, software: software)
      end
    end

  end
end
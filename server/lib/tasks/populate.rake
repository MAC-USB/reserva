namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    [Materia, Software, Reserva, Horario, Usuario, Anuncio].each(&:delete_all)

    @d = Departamento.find_by(codigo: "CI")

    @a = Sala.find_by(nombre: "A")

    materias = [
      [ "CI2691", "Laboratorio de Algoritmos y Estructuras I"],
      ["CO3211", "Cálculo numérico"],
    ]

    softwares = [
      ["Code Blocks", "1.1.2", "http://www.codeblocks.org/"],
      ["Matlab", "2.0", "www.mathworks.com/products/matlab"],
      ["Emacs", "2.0", "https://www.gnu.org/software/emacs/"]
    ]

    reservas = [
      ["A", true, ""],
      ["A", false, "Vim, Emacs, Sublime"],
      ["A", true, "Supercollider"]
    ]

    usuarios = [
      ["Pepe", "pepe@pepe.com", "12345678", "12345678", "04145551234", "05-05054"],
      ["Jose", "jose@jose.com", "12345678", "12345678", "04167771234", "01-12123"]
    ]

    anuncios = [
      "Hola este es el primer anuncio de Reserva.",
      "Que nulo fue el primer anuncio. Chao."
    ]

    puts "Creating Materias..."
    materias.each do |codigo, nombre, dpto|
      @m = Materia.create!(codigo: codigo, nombre: nombre, departamento: @d)
      puts "Created Materia: " + @m.inspect
    end
    puts "Done\n"

    puts "Creating Softwares..."
    softwares.each do |nombre, version, link|
      @s = Software.create!(nombre: nombre, version: version, link: link,
        sala_nombre: @a.nombre)
      puts @s.inspect
    end
    puts "Done\n"

    puts "Creating Usuarios..."
    usuarios.each do | nombre, email, password, password_confirmation, telefono, carnet |
      @u = Usuario.create!(nombre: nombre, email: email, password: password,
          password_confirmation: password_confirmation, telefono: telefono,
          carnet: carnet)
      @u.confirm!
      puts @u.inspect
    end
    puts "Done\n"

    #Para crear, comparar y modificar horarios ver: https://github.com/JackC/tod
    r1_horarios = [
        #Lunes, 7-8
        Horario.create!(dia: 1,
        hora_inicio: Tod::TimeOfDay.new(13,30),
        hora_fin: Tod::TimeOfDay.new(15,30)),
        #Miercoles, 1-2
        Horario.create!(dia: 3,
        hora_inicio: Tod::TimeOfDay.new(7,30),
        hora_fin: Tod::TimeOfDay.new(9,30)),
        #Viernes, 9-10
        Horario.create!(dia: 5,
        hora_inicio: Tod::TimeOfDay.new(15,30),
        hora_fin: Tod::TimeOfDay.new(17,30))
    ]

    puts "Creating Reservas..."
    usuario = Usuario.first

    r1 = Reserva.create!(sala_nombre: @a.nombre, materia: Materia.first,
          video_beam: true, requerimientos: "",
          horarios: r1_horarios, semanas_activas: [1,2,3],
          reservador: usuario)

    reservas.each do |sala_nombre, video_beam, requerimientos|
      Materia.all.each do |materia|
        inicio = rand(10) + 7
        @h = Horario.create!(dia: 1 + rand(4),
        hora_inicio: Tod::TimeOfDay.new(inicio,30),
        hora_fin: Tod::TimeOfDay.new(inicio + 2,30))
        @r = Reserva.create!(sala_nombre: sala_nombre, materia: materia,
          video_beam: video_beam, requerimientos: requerimientos,
          horarios: [@h], semanas_activas: [rand(12)+1],
          reservador: usuario)
        puts @r.inspect
      end
    end
    puts "Done\n"


    puts "Creating Anuncios..."
    usuario = Usuario.first
    anuncios.each do |contenido|
      @a = Anuncio.create!(contenido: contenido, usuario: usuario)
      puts @a.inspect
    end
    puts "Done\n"

  end
end
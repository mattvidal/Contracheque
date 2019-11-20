require './classes.rb'

contracheque1 = Contracheque.new("Fundação Centro Universitário Estadual da Zona Oeste (UEZO)", "10.889.295/0001-52")

puts "Qual o nome do funcionário?"
nome = gets.chomp

contracheque1.setNomeFunc(nome)

puts "Qual o cargo do #{nome}?" 

cargo = gets.chomp

contracheque1.setNomeFunc(cargo)

puts "Qual o salário do #{nome}?"

salario_fixo = gets.chomp
    
contracheque1.setSalarioFixo(salario_fixo)

puts "Digite a quantidade de horas trabalhadas:"

qtd_horas = gets.chomp

contracheque1.setCargaHoraria(qtd_horas)

puts "Digite a quantidade de dias trabalhados:"

qtd_dias_trabalhados = gets.chomp

contracheque1.setQtdDiasTrabalhados(qtd_dias_trabalhados)

puts "Digite a quantidade de horas extras:"

qtd_horas_extras = gets.chomp

contracheque1.setHorasExtras(qtd_horas_extras)
require './classes.rb'

#Gera um objeto da classe Contracheque
contracheque = Contracheque.new("Fundação Centro Universitário Estadual da Zona Oeste (UEZO)", "10.889.295/0001-52")

#Faz a leitura de informações gerais sobre o funcionário, salário e horas trabalhadas
puts "Qual o nome do funcionário?"
nome = gets.chomp
puts "Qual a função de #{nome}?" 
funcao = gets.chomp
puts "Qual o salário de #{nome}?"
salario_fixo = gets.chomp.to_f
puts "Digite a quantidade de horas trabalhadas no mês:"
qtd_horas = gets.chomp.to_i
puts "Digite a quantidade de dias trabalhados no mês:"
qtd_dias_trabalhados = gets.chomp.to_i
puts "Digite a quantidade de horas extras feitas:"
qtd_horas_extras = gets.chomp.to_i

#Armazena essas informações no objeto contracheque
contracheque.setNomeFunc(nome)
contracheque.setFuncao(funcao)
contracheque.setSalarioFixo(salario_fixo)
contracheque.setCargaHoraria(qtd_horas)
contracheque.setQtdDiasTrabalhados(qtd_dias_trabalhados)
contracheque.setHorasExtras(qtd_horas_extras)

#Chama as funções para calcular o valor da hora
contracheque.calculaHorasDiarias()
contracheque.calculaValorHora()

#Lê as outras informações necessárias para a execução do programa
#Calcula as faltas
puts "Quantos dias o funcionário faltou? (se nenhum, digite 0)"
faltas = gets.chomp.to_i
contracheque.calculaFaltas(faltas)
#Calcula o INSS
contracheque.calculaINSS()

#Calcula os vales a serem descontados (Transporte, Alimentação e Refeição)
puts "Para as informações a seguir, se o valor não for descontado do funcionário, apenas digite 0"
puts "Entre com o valor do desconto do vale transporte:"
vt = gets.chomp.to_f
puts "Entre com o valor do desconto do vale refeição:"
vr = gets.chomp.to_f
puts "Entre com o valor do desconto do vale alimentação:"
va = gets.chomp.to_f
contracheque.calculaValeTransporte(vt)
contracheque.calculaValeRefeicao(vr)
contracheque.calculaValeAlimentacao(va)

#Calcula outros descontos
teste = true
while teste do 
    puts "O funcionário recebeu adiantamento? (sim/nao)"
    resp = gets.chomp.to_s
    #Converte a string para letra minúscula
    resp.downcase!
    if (resp == "sim")
        puts "Qual o valor? (apenas números, use . no lugar de , por exemplo 150.23)"
        adiantamento = gets.chomp.to_f
        contracheque.calculaAdiantamento(adiantamento)
    elsif (resp != "nao")
        puts "Resposta inválida! Digite apenas sim ou não"
        next
    end
    teste = false 
end

while !teste do
    puts "O sindicato é pago? (sim/nao)"
    resp = gets.chomp.to_s
    resp.downcase!
    #Maneira mais simple de escrever uma estrutura de if com apenas uma instrução interna
    #O next é o equivalente ao continue de outras linguagens, pulando as instruções seguintes de dentro da estrutura
    next if (resp != "nao" && resp != "sim")
    teste = true
    contracheque.calculaSindicato(resp)
end

#Leitura dos adicionais e das bonificações
while teste do
    puts "O funcionário recebe adicional de insalubridade?"
    puts "Digite 0 se não receber"
    puts "Digite 1 se receber o adicional mínimo"
    puts "Digite 2 se receber o adicional médio"
    puts "Digite 3 se receber o adicional máximo"
    op = gets.chomp.to_i
    case op
    when 0
        contracheque.calculaInsalubridade(0)
    when 1
        contracheque.calculaInsalubridade(10)
    when 2
        contracheque.calculaInsalubridade(20)
    when 3
        contracheque.calculaInsalubridade(40)
    else 
        puts "Resposta inválida! Digite apenas um número entre 0 e 4"
        next
    end
    teste = false
end 

while !teste do
    puts "Recebe adicional de periculosidade? (sim/nao)"
    resp = gets.chomp.to_s
    resp.downcase!
    next if (resp != "nao" && resp != "sim")
    teste = true
    contracheque.calculaPericulosidade(resp)
end

while teste do 
    puts "O funcionário deve receber adicional noturno? (sim/nao)"
    resp = gets.chomp.to_s
    resp.downcase!
    if (resp == "sim")
        puts "Quantas horas noturnas ele fez?"
        noturno = gets.chomp.to_i
        contracheque.calculaAdicionalNoturno(noturno)
    elsif (resp != "nao")
        puts "Resposta inválida! Digite apenas sim ou nao"
        next
    end
    teste = false 
end

puts "Quanto ele deve receber de comissão? (se não tiver, digite 0)"
comissao = gets.chomp.to_f
puts "Quanto ele deve receber de bônus? (se não tiver, digite 0)"
bonus = gets.chomp.to_f
puts "Quanto ele deve receber de gratificação? (se não tiver, digite 0)"
gratificacao = gets.chomp.to_f
contracheque.calculaComissao(comissao)
contracheque.calculaBonus(bonus)
contracheque.calculaGratificacao(gratificacao)

#Chama a função que faz o cálculo final do contracheque
contracheque.calculaSalarioLiquido()
#Imprime o contracheque
contracheque.geraContracheque()
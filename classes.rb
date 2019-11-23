require 'date'

class Contracheque
    #Método construtor
    def initialize(razao_social, cnpj)
        @razao_social = razao_social
        @cnpj = cnpj
        @horaAtual = DateTime.now
        @mes_referencia = @horaAtual.month
        @ano_referencia = @horaAtual.year

        #Insalubridade: 10, 20 ou 40 por cento do salário base
        #Periculosidade: 30 por cento
        #Noturno: valor da hora + 20 por cento
        @adicionais = {
            "Insalubridade" => 0.00, 
            "Periculosidade" => 0.00, 
            "Noturno" => 0.00
        }
        #Comissão, Bônus e Gratificação: valor
        @bonificacoes = {
            "Comissão" => 0.00, 
            "Bônus" => 0.00, 
            "Gratificação" => 0.00
        }

        #Adiantamento: valor fixo
        #Faltas = salario_hora * dias faltados
        #INSS = Até R$ 1.693,72	8%
                #De R$ 1.693,73 a R$ 2.822,90	9%
                #De R$ 2.822,91 até R$ 5.645,80	    11%
        #Sindicato = 3,33% do salário
        #Vale Transporte = até 6 por cento do salário. Caso o valor digitado for maior que os 6%, só será cobrado os 6%.
        #Vale Refeição = até 20 por cento do salário. Caso o valor digitado for maior que os 20%, só será cobrado os 20%.
        #Vale Alimentação = até 20 por cento do salário. Caso o valor digitado for maior que os 20%, só será cobrado os 20%.
 
        @descontos = {
            "Adiantamento" => 0.00, 
            "Faltas" => 0.00, 
            "INSS" => 0.00, 
            "Sindicato" => 0.00, 
            "Vale Transporte" => 0.00, 
            "Vale Refeição" => 0.00, 
            "Vale Alimentação" => 0.00
        }

    end

    #Criando métodos getters e setters

    def setNomeFunc(nome_funcionario)
        @nome_funcionario = nome_funcionario
    end
    
    def getNomeFunc()
        return @nome_funcionario
    end

    def setFuncao(funcao)
        @funcao = funcao
    end
    
    def getFuncao()
        return @funcao
    end

    def setSalarioFixo(salariofixo)
        @salarioFixo = salariofixo
    end
    
    def getSalarioFixo()
        return @salariofixo
    end

    def setCargaHoraria(carga_horaria)
        @carga_horaria = carga_horaria
    end
    
    def getCargaHoraria()
        return @carga_horaria
    end

    def setQtdDiasTrabalhados(qtd_dias_trabalhados)
        @qtd_dias_trabalhados = qtd_dias_trabalhados
    end

    def getQtdDiasTrabalhados()
        return @qtd_dias_trabalhados
    end

    def setHorasExtras(horas_extras)
        @horas_extras = horas_extras
    end

    def getHorasExtras()
        return @horas_extras
    end
    
    #def setMesReferencia(mes_referencia)
     #   @mes_referencia = mes_referencia
    #end

    def getMesReferencia()
        return @mes_referencia
    end

    #def setAnoReferencia(ano_referencia)
    #    @ano_referencia = ano_referencia
    #end

    def getAnoReferencia()
        return @ano_referencia
    end
    
    #def setRazaoSocial(razao_social)
    #    @razao_social = razao_social
    #end

    def getRazaoSocial()
        return @razao_social
    end

    #def setCNPJ(cnpj)
        #@cnpj = cnpj
    #end

    def getCNPJ()
        return @cnpj
    end

    #Calcula quantas horas o funcionário trabalha por dia, em média
    def calculaHorasDiarias()
        @horasDiarias = @carga_horaria / @qtd_dias_trabalhados
    end
    #Calcula o valor da hora trabalhada do funcionário
    def calculaValorHora()
        @valorHora = @salarioFixo / @horasDiarias
    end
     
    #Descontos
    def calculaFaltas(numeroFaltas)
        @descontos[:"Faltas"]  = numeroFaltas * (@valorHora * @horasDiarias)
    end

    def calculaINSS()
        case @salarioFixo
            #O .. entre os valores do when determina um intervalo
            #ou seja, testa se o valor da variavel no case se encontra entre esses valores
        when 0..1693.72
            @descontos[:"INSS"] = @salarioFixo * 0.08
        when 1593.73..2822.90
            @descontos[:"INSS"] = @salarioFixo * 0.09
        when 2822.91..5645.80
            @descontos[:"INSS"] = @salarioFixo * 0.11 
        end
    end

    def calculaValeTransporte(valor=0)
        @descontos[:"Vale Transporte"] = valor > (@salarioFixo * 0.06) ? @salarioFixo * 0.06 : valor
    end

    def calculaValeRefeicao(valor=0)
        @descontos[:"Vale Refeição"] = valor > (@salarioFixo * 0.2) ? @salarioFixo * 0.2 : valor
    end

    def calculaValeAlimentacao(valor=0)
        @descontos[:"Vale Alimentação"] = valor > (@salarioFixo * 0.2) ? @salarioFixo * 0.2 : valor
    end

    def calculaAdiantamento(adiantamento=0)
        @descontos[:"Adiantamento"] = adiantamento
    end

    def calculaSindicato(resposta="nao")
        @descontos[:"Descontos"] = resposta.downcase == "sim" ? @salarioFixo * 0.0333 : 0.0

    #Adicionais
    def calculaInsalubridade(porcentagem=0)
        #Usando um case, ele testa qual o adicional de insalubridade, se receber
        #e retorna o valor a ser recebido
        @adicionais[:"Insalubridade"] = begin
            case porcentagem
            when 0 
                0.0
            when 10 
                @salarioFixo * 0.1
            when 20
                @salarioFixo * 0.2
            when 40
                @salarioFixo * 0.4
            else
                puts "Valor inválido"
            end
        end 
    end
    
    def calculaPericulosidade(resposta="nao")
        #A função recebe uma resposta (sim/nao)
        #converte a resposta para mínuscula e testa se ele recebe adicional de periculosidade
        #se sim, ele retorna o valor do adicional (*0,3 ou 30%) ou 0 se nao receber
        @adicionais[:"Periculosidade"] = resposta.downcase == "sim" ? @salarioFixo * 0.3 : 0.0
    end

    def calculaAdicionalNoturno(horas=0)
        #Recebe, por padrão, o valor 0 de horas
        #Se ele fez 0 horas, retorna o valor de R$ 0.00 para o adicional
        #se nao, calcula 
        @adicionais[:"Noturno"] = horas == 0 ? 0.00 : horas * (@valorHora + @valorHora * 0.2)
    end

    #Bonificações
    def calculaComissao(comissao=0.0)
        @bonificacoes[:"Comissão"] = comissao
    end

    def calculaBonus(bonus=0.0)
        @bonificacoes[:"Bônus"] = bonus
    end

    def calculaGratificacao(gratificacao=0.0)
        @bonificacoes[:"Gratificação"] = gratificacao
    end

    #Função que calcula o salário líquido com base nos valores recebidos
    def calculaSalarioLiquido()
        #Atribui o valor do salário bruto ao valor inicial do salário líquido
        @salarioLiquido = @salarioFixo
        #Faz os descontos percorrendo o hash de descontos
        @descontos.each_value {|valor| @salarioLiquido -= valor }
        #Adiciona as bonificações e os adicionais percorrendo o hash relacionado
        @bonificacoes.each_value {|valor| @salarioLiquido += valor }
        @adicionais.each_value {|valor| @salarioLiquido += valor }
    end

    #Imprime o contracheque
    def geraContracheque()
        puts "Data: #{@mes_referencia} de #{@ano_referencia}"
        puts "------------EMPRESA------------"
        puts "CNPJ: #{@cnpj}"
        puts "Razão Social: #{@razao_social}"
        puts "----------FUNCIONÁRIO----------"
        puts "Nome: #{@nome_funcionario}"
        puts "Função: #{@funcao}"
        puts "Carga Horária: #{@carga_horaria} horas"
        puts "Salário Bruto: R$ #{@salarioFixo}"
        puts "Salário Líquido: R$ #{@salarioLiquido}"
        puts "-----------DESCONTOS-----------"
        #Outra maneira de percorrer um hash
        #Quer dizer, é a mesma maneira, só mudando { } por do/end
        #e tirando tudo de uma linha só
        @descontos.each do |nome, valor|
            puts "#{nome}: R$ #{valor}"
        end
        puts "----------BONIFICAÇÕES----------"
        @bonificacoes.each do |nome, valor|
            puts "#{nome}: R$ #{valor}"
        end
        puts "-----------ADICIONAIS-----------"
        @adicionais.each do |nome, valor|
            puts "#{nome}: R$ #{valor}"
        end
    end
end
end
require 'date'

class Contracheque
    def initialize(razao_social, cnpj)
        @razao_social = razao_social
        @cnpj = cnpj
        @horaAtual = DateTime.now
        @mes_referencia = @horaAtual.month
        @ano_referencia = @horaAtual.year

        #Insalubridade: 10, 20 ou 40 por cento do salário base
        #Periculosidade: 30 por cento
        #Noturno: valor da hora + 20 por cento
        @adicionais = {"Insalubridade" => 0.00, "Periculosidade" => 0.00, "Noturno" => 0.00}
        #Comissão e Bônus: porcentagem
        #Gratificação: valor
        @bonificacoes = {"Comissão" => 0.00, "Bônus" => 0.00, "Gratificação" => 0.00}

        #Adiantamento: valor fixo
        #Faltas = salario_hora * dias faltados
        #INSS = Até R$ 1.693,72	8%
                #De R$ 1.693,73 a R$ 2.822,90	9%
                #De R$ 2.822,91 até R$ 5.645,80	    11%
        #Sindicato = 3,33% do salário
        #Vale Transporte = até 6 por cento do salário. Caso o valor digitado for maior que os 6%, só será cobrado os 6%.
        #Vale Refeição = até 20 por cento do salário. Caso o valor digitado for maior que os 20%, só será cobrado os 20%.
        #Vale Alimentação = até 20 por cento do salário. Caso o valor digitado for maior que os 20%, só será cobrado os 20%.

        @descontos = {"Adiantamento" => 0.00, "Faltas" => 0.00, "INSS" => 0.00, "Sindicato" => 0.00, "Vale Transporte" => 0.00, "Vale Refeição" => 0.00,
        "Vale Alimentação" => 0.00, "Plano de Saúde" => 0.00, "Plano Odontológico" => 0.00}

    end

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
        @salariofixo = salariofixo
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

    def criarContracheque()
    
    end


end
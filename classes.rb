class Contracheque
 
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
    
    def setMesReferencia(mes_referencia)
        @mes_referencia = mes_referencia
    end

    def getMesReferencia()
        return @mes_referencia
    end

    def setAnoReferencia(ano_referencia)
        @ano_referencia = ano_referencia
    end

    def getAnoReferencia()
        return @ano_referencia
    end

    def setRazaoSocial(razao_social)
        @razao_social = razao_social
    end

    def getRazaoSocial()
        return @razao_social
    end

    def setCNPJ(cnpj)
        @cnpj = cnpj
    end

    def getCNPJ()
        return @cnpj
    end






end

=begin

class Pessoa
    def initialize(nome, funcao)
        @nome = nome
        @funcao = funcao
    end

    def getNome()
        return @nome
    end
end

class Empresa
    def initialize(razao_social, cnpj) 
        @razao_social = razao_social
        @cnpj = cnpj
    end

    def getNome()
        return @razao_social
    end
end

=end
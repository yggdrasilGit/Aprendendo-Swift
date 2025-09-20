/// Representa uma conta corrente bancária
class Conta {
    /// Saldo disponível na conta.
    /// Só pode ser alterado dentro da classe (`private(set)`), mas pode ser lido de fora.
    private(set) var saldo: Double
    
    /// Nome do dono da conta.
    var nome: String
    
    /// Inicializa uma nova conta com o saldo zerado.
    /// - Parameter nome: Nome do titular da conta.
    init(nome: String) {
        self.saldo = 0.0
        self.nome = nome
    }
    
    /// Realiza um saque no saldo da conta.
    ///
    /// - Parameter valor: Valor a ser sacado.
    /// - Returns: `true` se o saque foi realizado com sucesso,
    ///            `false` se o saldo for insuficiente.
    func sacar(valor: Double) -> Bool {
        if valor > 0 && valor <= saldo {
            saldo -= valor
            return true
        } else {
            print("Saldo insuficiente ou valor inválido!")
            return false
        }
    }
    
    /// Realiza um depósito na conta.
    ///
    /// - Parameter valor: Valor a ser depositado.
    func depositar(valor: Double) {
        guard valor > 0 else {
            print("Valor de depósito inválido!")
            return
        }
        saldo += valor
    }
    
    /// Realiza uma transferência para outra conta.
    ///
    /// - Parameters:
    ///   - valor: Valor a ser transferido.
    ///   - destino: Conta de destino.
    /// - Returns: `true` se a transferência foi realizada, `false` caso contrário.
    func transferir(valor: Double, para destino: Conta) -> Bool {
        if sacar(valor: valor) {
            destino.depositar(valor: valor)
            return true
        }
        return false
    }
}

/// Conta Poupança
class ContaPoupanca: Conta {
    var possuiCartaoDebito: Bool = false
    
    /// Solicita um cartão de débito para a conta poupança.
    func solicitarCartaoDeDebito() {
        possuiCartaoDebito = true
        print("O cliente está solicitando cartão de débito")
    }
}

/// Conta Corrente
class ContaCorrente: Conta {
    // Pode futuramente ter regras específicas (ex: limite de cheque especial)
}

// MARK: - Exemplo de uso

/// Cria uma conta para Francismar
var contaFrancismar = ContaPoupanca(nome: "Francismar")

/// Faz um depósito de 200
contaFrancismar.depositar(valor: 200)

/// Solicita cartão de débito
print(contaFrancismar.solicitarCartaoDeDebito())

/// Imprime o saldo atual (200.0)
print("Saldo atual:", contaFrancismar.saldo)

/// Imprime o nome do dono da conta (Francismar)
print("Titular:", contaFrancismar.nome)

/// Cria uma conta corrente para Maria
var contaMaria = ContaCorrente(nome: "Maria")

/// Transfere 50 de Francismar para Maria
if contaFrancismar.transferir(valor: 50, para: contaMaria) {
    print("Transferência realizada com sucesso!")
} else {
    print("Falha na transferência.")
}

/// Saldos após a transferência
print("Saldo Francismar:", contaFrancismar.saldo)
print("Saldo Maria:", contaMaria.saldo)
contaFrancismar.solicitarCartaoDeDebito()

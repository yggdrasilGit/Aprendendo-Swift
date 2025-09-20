/// Representa uma conta corrente bancária
class ContaCorrente {
    /// Saldo disponível na conta.
    /// Só pode ser alterado dentro da classe (`private(set)`), mas pode ser lido de fora.
    private(set) var saldo: Double
    
    /// Nome do dono da conta.
    var nome: String
    
    /// Inicializa uma nova conta corrente com o saldo zerado.
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
        if valor <= saldo {
            saldo -= valor
            return true
        } else {
            print("Saldo insuficiente!")
            return false
        }
    }
    
    /// Realiza um depósito na conta.
    ///
    /// - Parameter valor: Valor a ser depositado.
    func depositar(valor: Double) {
        saldo += valor
    }
}

// MARK: - Exemplo de uso

/// Cria uma conta para Francismar
var contaCorrenteFrancismar = ContaCorrente(nome: "Francismar")

/// Faz um depósito de 200
contaCorrenteFrancismar.depositar(valor: 200)

/// Imprime o saldo atual (200.0)
print(contaCorrenteFrancismar.saldo)

/// Imprime o nome do dono da conta (Francismar)
print(contaCorrenteFrancismar.nome)

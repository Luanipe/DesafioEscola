/*:
 ## Sistema.
 
 Agora que você passou por todas as etapas do treinamento, é hora de juntar todas as peças do quebra-cabeça! 🧩
 
 Você já sabe sobre:
 
 - Array (Vetores)
 - Enum
 - Switch
 - Struct/Class
 
 Com esses conhecimentos, você tem o suficiente para montar um sistema para uma escola.
 
 Antes de começarmos, é importante você saber algumas exigências das escolas.
 
 Elas devem ser capazes de:
 
 1. Cadastrar novos colaboradores.
 2. Remover colabores através de sua matrícula.
 -
 3. Listar gastos mensais com todos os colaboradores.
 4. Listar gastos mensais por cargo (quanto é gasto com monitor, quanto é gasto com professor, etc.)
 5. Listar quantas pessoas existem por cargo (quantos monitores, quantos professores, etc.)
 6. Listar os nomes de todos os colaboradores em ordem alfabética.
 
 **[DESAFIO]** Como você faria esse sistema?
 
 Abaixo, segue um exemplo de como seria um sistema similar ao do colégio 🐶.
 */

enum Raca {
    case poodle
    case husky
    case golden
    case labrador
    case caramelo
    
    // Sim! Em Swift, Enum pode conter funções! ❤️
    func nomeFormal() -> String {
        switch self {
        case .poodle:
            return "Poodle"
        case .husky:
            return "Husky Siberiano"
        case .golden:
            return "Golden Retriever"
        case .labrador:
            return "Labrador"
        case .caramelo:
            return "Caramelo"
        }
    }
    
    func possuiMuitoPelo() -> Bool {
        switch self {
        case .poodle, .husky, .golden:
            return true
        case .labrador, .caramelo:
            return false
        }
    }
}

struct Cachorro {
    let identificador: Int
    let nome: String
    let raca: Raca
    let gastoMensal: Double
    
    func descricao() -> String {
        return "Identificador: \(identificador): \(nome) é um cachorro da raça \(raca.nomeFormal()) que possui um gasto mensal de R$\(gastoMensal)."
    }
}

// A class Abrigo é o nosso sistema!
class Abrigo {
    var cachorros: [Cachorro]
    
    init(cachorros: [Cachorro]) {
        self.cachorros = cachorros
    }
    
    // Funcionalidade 1 do sistema da escola
    // Cadastrar novos colaboradores
    func adicionaCachorro(_ cachorro: Cachorro) {
        cachorros.append(cachorro)
    }
    
    // Funcionalidade 2 do sistema da escola
    // Remover colabores através de sua matrícula
    func removeCachorro(comIdentificador identificador: Int) {
        // Solução 1
        // Dificuldade: 🔥
        // Podemos melhorar essa solução...
        for indice in 0..<cachorros.count {
            let cachorro = cachorros[indice]
            if cachorro.identificador == identificador {
                cachorros.remove(at: indice)
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // Já está bom o suficiente
        for (indice, cachorro) in cachorros.enumerated() {
            if cachorro.identificador == identificador {
                cachorros.remove(at: indice)
            }
        }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥
        // Solução um pouco mais "avançada"
        cachorros.removeAll { (cachorro) -> Bool in
            cachorro.identificador == identificador
        }
        
        // Solução 4
        // Dificuldade: 🔥🔥🔥🔥
        // Agora você decolou!!! 🚀
        cachorros.removeAll{ $0.identificador == identificador }
    }
    
    // Funcionalidade 3 do sistema da escola
    // Listar gastos mensais com todos os colaboradores
    func listaGastoMensais() -> Double {
        var gastoTotal: Double = 0
        
        for cachorro in cachorros {
            // Solução 1
            // Dificuldade: 🔥
            let gastoMensal = cachorro.gastoMensal
            gastoTotal = gastoTotal + gastoMensal
            
            // Solução 2
            // Dificuldade: 🔥🔥
            // let gastoMensal = cachorro.gastoMensal
            // gastoTotal += gastoMensal
            
            // Solução 3
            // Dificuldade: 🔥🔥🔥
            // gastoTotal += cachorro.gastoMensal
        }
        
        return gastoTotal
    }
    
    // Funcionalidade 4 do sistema da escola
    // Listar gastos mensais por cargo
    func listaGasto(daRaca raca: Raca) -> String {
        var gastoTotal: Double = 0
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            if cachorro.raca == raca {
                gastoTotal += cachorro.gastoMensal
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // for cachorro in cachorros where cachorro.raca == raca {
        //     gastoTotal += cachorro.gastoMensal
        // }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥🔥🔥🔥🔥🔥🔥
        // gastoTotal = cachorros.map{ $0.gastoMensal }.reduce(0, +)
        
        return "Os gastos com a raça \(raca.nomeFormal()) são de R$\(gastoTotal)."
    }
    
    // Funcionalidade 5 do sistema da escola
    // Listar quantas pessoas existem por cargo
    func listaQuantidadeDeCachorro(daRaca raca: Raca) -> String {
        var quantidadeDeCachorro = 0
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            if cachorro.raca == raca {
                quantidadeDeCachorro += 1
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // for cachorro in cachorros where cachorro.raca == raca {
        //     quantidadeDeCachorro += 1
        // }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥🔥🔥🔥
        // quantidadeDeCachorro = cachorros.filter{ $0.raca == raca }.count
        
        return "Existe(m) \(quantidadeDeCachorro) cachorro(s) da raça \(raca.nomeFormal())."
    }
    
    // Funcionalidade 6 do sistema da escola
    // Listar os nomes de todos os colaboradores em ordem alfabética
    func listaCachorrosEmOrdemAlfabetica() -> [String] {
        // Primeiro, precisamos pegar todos os nomes de todos os cachorros
        var nomes: [String] = []
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            let cachorroNome = cachorro.nome
            nomes.append(cachorroNome)
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // nomes = cachorros.map{ $0.nome }
        
        // Agora é só ordenar a nossa lista de nomes!
        // Obrigado Swift por já ter uma função para isso 🙏
        nomes.sort()
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥
        // Essa solução já faz tudo
        // .map -> cria um Array de String
        // .sorted() -> ordena o Array
        // nomes = cachorros.map{ $0.nome }.sorted()
        
        return nomes
    }
}

let muitosCachorros: [Cachorro] =
    [
        Cachorro(identificador: 0, nome: "Rex", raca: .caramelo, gastoMensal: 100),
        Cachorro(identificador: 1, nome: "Bob", raca: .labrador, gastoMensal: 50),
        Cachorro(identificador: 2, nome: "Fred", raca: .golden, gastoMensal: 200),
        Cachorro(identificador: 3, nome: "Zeus", raca: .caramelo, gastoMensal: 500),
        Cachorro(identificador: 4, nome: "Babi", raca: .poodle, gastoMensal: 3000),
        Cachorro(identificador: 5, nome: "Xerox", raca: .labrador, gastoMensal: 1500),
        Cachorro(identificador: 6, nome: "Slinky", raca: .poodle, gastoMensal: 2500),
        Cachorro(identificador: 7, nome: "Fancy", raca: .labrador, gastoMensal: 1000),
        Cachorro(identificador: 8, nome: "Britney", raca: .caramelo, gastoMensal: 30),
        Cachorro(identificador: 9, nome: "Panqueca", raca: .golden, gastoMensal: 450),
        Cachorro(identificador: 10, nome: "Tiziu", raca: .golden, gastoMensal: 900),
        Cachorro(identificador: 11, nome: "Simba", raca: .husky, gastoMensal: 700),
        Cachorro(identificador: 12, nome: "Thor", raca: .labrador, gastoMensal: 1300),
        Cachorro(identificador: 13, nome: "Kawaii", raca: .caramelo, gastoMensal: 1200)
    ]

let abrigo = Abrigo(cachorros: muitosCachorros)

// Funcionalidade 1
// print(abrigo.listaCachorrosEmOrdemAlfabetica())

let avin = Cachorro(identificador: 14, nome: "Avin", raca: .caramelo, gastoMensal: 300)
abrigo.adicionaCachorro(avin)

// print(abrigo.listaCachorrosEmOrdemAlfabetica())
// Você consegue ver que "Avin" agora aparece dentro do print?
// Isso acontece pois o cachorro foi adicionado com sucesso ao abrigo!

// Funcionalidade 2

// print(abrigo.listaCachorrosEmOrdemAlfabetica())

abrigo.removeCachorro(comIdentificador: 14)

// print(abrigo.listaCachorrosEmOrdemAlfabetica())
// Você consegue ver que "Avin" não aparece mais no print?
// Isso acontece pois o cachorro Rex de identificador 0 foi removido com sucesso do abrigo!

// Funcionalidade 3
// print(abrigo.listaGastoMensais())

// Funcionalidade 4
// print(abrigo.listaGasto(daRaca: .caramelo))
// print(abrigo.listaGasto(daRaca: .poodle))
// print(abrigo.listaGasto(daRaca: .husky))
// print(abrigo.listaGasto(daRaca: .labrador))
// print(abrigo.listaGasto(daRaca: .golden))

// Funcionalidade 5
// print(abrigo.listaQuantidadeDeCachorro(daRaca: .caramelo))
// print(abrigo.listaQuantidadeDeCachorro(daRaca: .poodle))
// print(abrigo.listaQuantidadeDeCachorro(daRaca: .husky))
// print(abrigo.listaQuantidadeDeCachorro(daRaca: .labrador))
// print(abrigo.listaQuantidadeDeCachorro(daRaca: .golden))

// Funcionalidade 6
// print(abrigo.listaCachorrosEmOrdemAlfabetica())

// Seu sistema aqui!

enum Cargos {
    case monitor, professor, coordenador, diretor, assistente
    
    func abreviacao() -> String {
        switch self {
        case .monitor:
            return "Mntr."
        case .professor:
            return "Prof."
        case .coordenador:
            return "Coord."
        case .diretor:
            return "Dir."
        case .assistente:
            return "Asst."
        }
    }
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Double
    let cargo: Cargos
    
    func seApresentar() -> String {
        return "Meu nome é \(nome), sou \(cargo) e minha matrícula é \(matricula)"
    }
}

class Escola {
    var colaboradores: [Colaborador]
    
    init(colaboradores: [Colaborador]) {
        self.colaboradores = colaboradores
    }
    
    // #1: Função para cadastrar novos colaboradores no sistema
    func cadastrarColaborador(colaborador: Colaborador) {
        let quantidadeDiretor: Int = colaboradores.filter{$0.cargo == .diretor}.count
        let quantidadeCoord: Int = colaboradores.filter{$0.cargo == .coordenador}.count
        let quantidadeProf: Int = colaboradores.filter{$0.cargo == .professor}.count
        
        if colaborador.cargo == .diretor && quantidadeDiretor >= 1 {
            print("Não é permitido ter mais que um diretor na escola")
        }
        else if colaborador.cargo == .coordenador && quantidadeCoord >= quantidadeProf && colaboradores.count > 0 {
            print("Não podem ter mais coordenadores do que professores na escola")
        }
        else {
            colaboradores.append(colaborador)
            print("Colaborador de nome \(colaborador.nome) e matrícula \(colaborador.matricula), adicionado!")
        }
    }
    
    // #2: Função para remover colaboradores através de sua matrícula
    func removerColaborador(porMatricula matricula: Int) {
        var posicao: Int = 0
        for colaborador in colaboradores {
            if colaborador.matricula == matricula {
                print("Removido o colaborador de matrícula: \(colaborador.matricula)")
                colaboradores.remove(at: posicao)
            }
            posicao += 1
        }
    }
    
    // #3: Função para listar os gastos mensais com todos os colaboradores
    func listaGastosMensais() -> String {
        var gastoTotal: Double = 0.0
        for colaborador in colaboradores {
            gastoTotal += colaborador.salario
        }
        return "Os gastos mensais de todos os colaboradores são de R$\(gastoTotal)"
    }
    
    // #4: Função para listar gastos mensais por cargo
    func listaGasto(doCargo cargo: Cargos) -> String {
        var gastoTotal: Double = 0.0
        for colaborador in colaboradores {
            if colaborador.cargo == cargo {
                gastoTotal += colaborador.salario
            }
        }
        return "O gasto total do cargo \(cargo) é de R$\(gastoTotal)"
    }
    
    // #5: Função para listar quantas pessoas existem por cargo
    func listaQuantidadeColaboradores(doCargo cargo: Cargos) -> String {
        let quantidade: Int = colaboradores.filter{$0.cargo == cargo}.count
        if quantidade != 1 {
            return "Há \(quantidade) colaboradores no cargo \(cargo)"
        }
        else {
            return "Há 1 colaborador no \(cargo)"
        }
    }
    
    // #6: Função para criar uma lista om o nome de todos os colaboradores em ordem alfabética
    func listaColaboradoresEmOrdemAlfabetica() -> [String] {
        let nomes = colaboradores.map{$0.nome}.sorted()
        return nomes
    }
}

// Lista para guardar todos os colaboradores
var colaboradores: [Colaborador] = []

let jonas = Colaborador(nome: "Jonas", matricula: 421, salario: 5700.00, cargo: .coordenador)
let ana = Colaborador(nome: "Ana", matricula: 219, salario: 4350.00, cargo: .professor)
let cecilia = Colaborador(nome: "Cecília", matricula: 200, salario: 2400.00, cargo: .assistente)
let cleyton = Colaborador(nome: "Cleyton", matricula: 82, salario: 4300.00, cargo: .professor)
let thomas = Colaborador(nome: "Thomas", matricula: 555, salario: 8200.00, cargo: .diretor)
let joana = Colaborador(nome: "Joana", matricula: 123, salario: 8200.00, cargo: .diretor)
let dalila = Colaborador(nome: "Dalila", matricula: 41, salario: 5700.00, cargo: .coordenador)
let james = Colaborador(nome: "James", matricula: 10, salario: 5700.00, cargo: .coordenador)

// Instância do objeto escola
let escola: Escola = Escola(colaboradores: colaboradores)

// #1 Funcionalidade: Cadastro dos colaboradores
escola.cadastrarColaborador(colaborador: jonas)
escola.cadastrarColaborador(colaborador: ana)
escola.cadastrarColaborador(colaborador: cecilia)
escola.cadastrarColaborador(colaborador: cleyton)
escola.cadastrarColaborador(colaborador: thomas)
escola.cadastrarColaborador(colaborador: joana)
escola.cadastrarColaborador(colaborador: dalila)
escola.cadastrarColaborador(colaborador: james)

// #2 Funcionalidade: Remoção dos colaboradores
escola.removerColaborador(porMatricula: 200)

// Gastos mensais de todos os colaboradores
print(escola.listaGastosMensais())

// Gastos mensais de determinado cargo
print(escola.listaGasto(doCargo: .professor))
print(escola.listaGasto(doCargo: .assistente))
print(escola.listaGasto(doCargo: .coordenador))
print(escola.listaGasto(doCargo: .monitor))
print(escola.listaGasto(doCargo: .diretor))

// Quantas pessoas existem em cada cargo
print(escola.listaQuantidadeColaboradores(doCargo: .professor))
print(escola.listaQuantidadeColaboradores(doCargo: .assistente))
print(escola.listaQuantidadeColaboradores(doCargo: .coordenador))
print(escola.listaQuantidadeColaboradores(doCargo: .monitor))
print(escola.listaQuantidadeColaboradores(doCargo: .diretor))

// Lista com o nome de todos os colaboradores em ordem alfabética
print(escola.listaColaboradoresEmOrdemAlfabetica())
/*:
 [Já acabou, Jéssica?](https://www.otempo.com.br/polopoly_fs/1.1170250.1534206665!httpImage/image.png)
 
Ufa! Esse foi um desafio um tanto quanto longo, mas sobrevivemos.
 
 Porém, o sistema da escola não é tão "simples" assim.
 
 Ele possui algumas regras que precisam ser seguidas.
 
 São elas:
 
 - O SALÁRIO pode conter qualquer valor (crise pra quem?), mas o maior salário deve ser sempre o do DIRETOR.

 - A ESCOLA não pode ter mais do que um DIRETOR.

 - A ESCOLA não pode ter mais COORDENADORES do que PROFESSORES.

**[DESAFIO]** Como você faria acrescentaria essas regras ao seu sistema?
 
 Dessa vez, eu não darei dicas de solução 😉.
 
 *Give your jumps!* (Dá teus pulos)
*/

// Pode incrementar essas regras no seu sistema desenvolvido acima.

/*:
Terminado essa atividade, você está com animação para a próxima etapa?
 
 E vamos de Xcode!

[Anterior: Colaboradores](@previous) | Página 5 de 6  |  [Na sequência: Xcode](@next)
*/

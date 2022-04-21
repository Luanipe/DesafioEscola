//
//  ViewController.swift
//  SistemaEscola
//
//  Created by Renan Trévia on 2/11/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import UIKit

// Sugiro que utilizem esse Enum pois eu já deixei preparado para os botões, mas sintam-se à vontade para alterar para uma estrutura melhor caso sintam essa necessidade.
// MARK: STRUCT COLABORADOR
enum Cargo {
    case monitor, professor, coordenador, diretor, assistente
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Float
    let cargo: Cargo
    
    func cargoAbreviado() -> String {
        switch cargo {
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

class ViewController: UIViewController {
    
    @IBOutlet weak var outputMessage: UILabel!
    
    @IBOutlet weak var matriculaTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var salarioTextField: UITextField!
    
    @IBOutlet weak var monitorButton: UIButton!
    @IBOutlet weak var professorButton: UIButton!
    @IBOutlet weak var coordenadorButton: UIButton!
    @IBOutlet weak var diretorButton: UIButton!
    @IBOutlet weak var assistenteButton: UIButton!
    
    @IBOutlet weak var removeMatriculaTextField: UITextField!
    
    var cargoSelecionado: Cargo = .monitor
    var colaboradores: [Colaborador] = []
    var nomes: [String] = []
    
    @IBAction func selecionaMonitor(_ sender: UIButton) {
        cargoSelecionado = .monitor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaProfessor(_ sender: UIButton) {
        cargoSelecionado = .professor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaCoordenador(_ sender: UIButton) {
        cargoSelecionado = .coordenador
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaDiretor(_ sender: UIButton) {
        cargoSelecionado = .diretor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaAssistente(_ sender: UIButton) {
        cargoSelecionado = .assistente
        selecionaBotao(botao: sender)
    }
    
    // MARK: CADASTRAR COLABORADOR
    @IBAction func cadastrarColaborador(_ sender: UIButton) {
        var novoNome: String = ""
        var novaMatricula: Int = 0
        var novoSalario: Float = 0.00
        var nomes: [String] = []
        var matriculas: [Int] = []
        
        // Verificações para o alerta
        if nomeTextField.text != "" {
            novoNome = nomeTextField.text ?? ""
        }
        if matriculaTextField.text != "" {
            let matricula = (matriculaTextField.text ?? "") as String
            novaMatricula = Int(matricula) ?? 0
        }
        if salarioTextField.text != "" {
            let salario = (salarioTextField.text ?? "") as String
            novoSalario = Float(salario) ?? 0.00
        }
        
        // Configuração do alerta de erro
        if novaMatricula == 0 || novoSalario == 0.00 || novoNome == "" {
            let alerta = UIAlertController(title: "Erro", message: "O cadastro do salário, matrícula ou nome está incompleto. Tente novamente!", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
        else {
            let novoColaborador: Colaborador = Colaborador(nome: novoNome, matricula: novaMatricula, salario: novoSalario, cargo: cargoSelecionado)
            colaboradores.append(novoColaborador)
        }
        
        // Print das matrículas e nomes no console
        outputMessage.text = ""
        for posicao in 0..<colaboradores.count {
            nomes.append(colaboradores[posicao].nome)
            matriculas.append((colaboradores[posicao].matricula))
        }
        for posicao in 0..<nomes.count {
            outputMessage.text! += "\(matriculas[posicao]): \(nomes[posicao])\n"
        }
        
        resetaCadastraColaborador()
    }
    
    // MARK: REMOVER CCOLABORADOR
    @IBAction func removerColaborador(_ sender: UIButton) {
        let matricula = removeMatriculaTextField.text
        var matriculaSelecionada = 0
        var nomes: [String] = []
        var matriculas: [Int] = []
        var posicaoRemovida = 0
        
        // Verificação se o campo Matrícula está vazio e Alert
        if matricula != "" {
            let matriculaConvertida = (matricula ?? "") as String
            matriculaSelecionada = Int(matriculaConvertida) ?? 0
        }
        else {
            let alerta = UIAlertController(title: "Erro", message: "O número da matrícula é inválido. Tente novamente!", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
        
        // Remoção da matrícula selecionada
        for colaborador in colaboradores {
            if colaborador.matricula == matriculaSelecionada {
                colaboradores.remove(at: posicaoRemovida)
            }
            posicaoRemovida += 1
        }
        
        // Print no console
        outputMessage.text = ""
        for posicao in 0..<colaboradores.count {
            nomes.append(colaboradores[posicao].nome)
            matriculas.append(colaboradores[posicao].matricula)
        }
        for posicao in 0..<nomes.count {
            outputMessage.text! += "\(matriculas[posicao]): \(nomes[posicao])\n"
        }
        
        resetaRemoveColaborador()
    }
    
    // MARK: GASTOS MENSAIS
    @IBAction func listarGastosMensaisComTodosColaboradores(_ sender: UIButton) {
        var gastosMensais: Float = 0.00
        
        for colaborador in colaboradores {
            gastosMensais += colaborador.salario
        }
        
        outputMessage.text = "Os gastos mensais da empresa com todos os colaboradores foi de: R$\(gastosMensais)"
    }
    
    // MARK: GASTOS POR CARGO
    @IBAction func listarGastosMensaisPorCargo(_ sender: UIButton) {
        var gastosMonitor: Float = 0.00
        var gastosProfessor: Float = 0.00
        var gastosCoordenador: Float = 0.00
        var gastosDiretor: Float = 0.00
        var gastosAssistente: Float = 0.00
        
        for colaborador in colaboradores {
            switch colaborador.cargo {
            case .monitor:
                gastosMonitor += colaborador.salario
            case .professor:
                gastosProfessor += colaborador.salario
            case .coordenador:
                gastosCoordenador += colaborador.salario
            case .diretor:
                gastosDiretor += colaborador.salario
            case .assistente:
                gastosAssistente += colaborador.salario
            }
        }
        
        let gastosTotais: [String] = ["Monitor: R$\(gastosMonitor)", "Professsor: R$\(gastosProfessor)", "Coordenador: R$\(gastosCoordenador)", "Diretor: R$\(gastosDiretor)", "Assistente: R$\(gastosAssistente)"]
        
        outputMessage.text = ""
        for gasto in gastosTotais {
            outputMessage.text! += "\(gasto)\n"
        }
    }
    
    // MARK: PESSOAS POR CARGO
    @IBAction func listarQuantasPessoasExistemPorCargo(_ sender: UIButton) {
        var monitores: Int = 0
        var professores: Int = 0
        var coordenadores: Int = 0
        var diretores: Int = 0
        var assistentes: Int = 0
        
        for colaborador in colaboradores {
            switch colaborador.cargo {
            case .monitor:
                monitores += 1
            case .professor:
                professores += 1
            case .coordenador:
                coordenadores += 1
            case .diretor:
                diretores += 1
            case .assistente:
                assistentes += 1
            }
        }
        
        let listaDePessoasPorCargo: [String] = ["Monitores: \(monitores)", "Professsores: \(professores)", "Coordenadores: \(coordenadores)", "Diretores: \(diretores)", "Assistentes: \(assistentes)"]
        
        outputMessage.text = ""
        for pessoa in listaDePessoasPorCargo {
            outputMessage.text! += "\(pessoa)\n"
        }
    }
    
    // MARK: TODOS NOMES EM ORDEM ALFABÉTICA
    @IBAction func listarNomesColaboradoresOrdemAlfabetica(_ sender: UIButton) {
        // Lista de nomes em ordem alfabética
        let nomesColaboradores: [String] = colaboradores.map{$0.nome}.sorted()
        
        // Print dos nomes com as matrículas e o cargo abreviado no console
        outputMessage.text = ""
        for nome in nomesColaboradores {
            for colaborador in colaboradores {
                if nome == colaborador.nome {
                    outputMessage.text! += "\(colaborador.matricula): \(colaborador.cargoAbreviado()) \(nome)\n"
                }
            }
        }
    }
}

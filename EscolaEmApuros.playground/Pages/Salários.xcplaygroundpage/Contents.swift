/*:
## Salários.
 
 Uma parte muito importante do sistema que irá gerenciar as escolas municipais é a parte que controla os salários.
 
 Como diria os Mamonas Assassinas:
 
 > *Money*.
 >
 > Que é *good* **nóis** *no have*.
 
 Você precisa ser capaz de realizar um somatório de salários.
 
 **[DESAFIO]** Como você realizaria o somatório abaixo?
 */

let primeiroSalario = 1000
let segundoSalario  = 2000
let terceiroSalario = 3000
let quartoSalario   = 2500

//let somatorio = ???

// A resposta esperada do somatório é 8500!

let somatorio = primeiroSalario + segundoSalario + terceiroSalario + quartoSalario
print(somatorio)
/*:

 Ótimo! Você aprendeu a realizar a soma através das variáveis!
 
 Porém, somar variáveis é um caso pouco provável de acontecer em um sistema com vários salários.
 
 É mais provável que você tenha acesso a uma lista (Array) de salários.
 
 **[DESAFIO]** Sendo assim, como você realizaria os somatórios abaixo?
 
 > Dica: Você pode usar um *for* para isso.
 */
// Somatório = 8500
let salarios1: [Double] = [1000, 2000, 3000, 2500]
// Seu somatório aqui!
var somatorio1: Double = 0.0

for salario in salarios1 {
    somatorio1 += salario
}

print("O valor do 1 somatório é: \(somatorio1)")

// Somatório = 5010
let salarios2: [Double] = [3000, 1500, 500, 10]
// Seu somatório aqui!
var somatorio2: Double = 0.0

for salario in salarios2 {
    somatorio2 += salario
}

print("O valor do 2 somatório é: \(somatorio2)")

// Somatório = 55500
let salarios3: [Double] = [8500, 10000, 13000, 24000]
// Seu somatório aqui!
var somatorio3: Double = 0.0

for salario in salarios3 {
    somatorio3 += salario
}

print("O valor do 3 somatório é: \(somatorio3)")

// Somatório = 2500
let salarios4: [Double] = [2500]
// Seu somatório aqui!
var somatorio4: Double = 0.0

for salario in salarios4 {
    somatorio4 += salario
}

print("O valor do 4 somatório é: \(somatorio4)")

// Somatório 71670
let salarios5: [Double] = [1000, 200, 6000, 70, 4000, 100, 40000, 8000, 10000, 2300]
// Seu somatório aqui!
var somatorio5: Double = 0.0

for salario in salarios5 {
    somatorio5 += salario
}

print("O valor do 5 somatório é: \(somatorio5)")

/*:
Legal, mas... ninguém quer ficar repetindo todas essas linhas de código para realizar um somatório, não é mesmo?
 
 Que tal a gente transformar isso em uma *function*?
 
 **[DESAFIO]** Transformar o somatório em uma *function*!
 
 > Dica:
 >
 > Talvez você tenha algo como *func somatorioDeSalarios(salarios: [Double]) -> Double*.

*/

// Sua função aqui!
// Você pode usar as variáveis declaradas anteriormente!

func somatorioDeSalarios(salarios: [Double]) -> Double {
    var somatorio: Double = 0.0
    for salario in salarios {
        somatorio += salario
    }
    return somatorio
}

print(somatorioDeSalarios(salarios: salarios1))
print(somatorioDeSalarios(salarios: salarios2))
print(somatorioDeSalarios(salarios: salarios3))
print(somatorioDeSalarios(salarios: salarios4))
print(somatorioDeSalarios(salarios: salarios5))
/*:
 Feito todos esses somatórios, é hora de avançarmos para a próxima lição!
 
 [Anterior: Introdução](@previous) | Página 2 de 6  |  [Na sequência: Cargos](@next)
 */

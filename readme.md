# Desafio de Ruby

EN: **This repo contains 3 easy programming challanges written by me in late 2019 to introduce computer engineering freshman to the Ruby Programming Language.**

Nesse desafio, você (com muita fé) aprenderá o "jeito Ruby" de programar, além de aprender um pouco sobre o modelo de orientação a objetos do Ruby.

O "jeito Ruby" de programar se refere ao uso de recursos e de sua sintaxe únicos, que facilitam a vida do programador, mesmo as custas de performance.
Já que "otimizando" para a felicidade do programador, a produtividade aumenta.
Levando em consideração que a hora do programador é mais cara que a hora de aluguel de servidores e outras infraestruturas,
essa é uma troca que deixa todo mundo feliz!

Nesse desafio, o "jeito Ruby" virá do uso dos recursos aprendidos nas aulas do OneBitCode, como iteradores, programação funcional e etc.
Como ter vários jeitos de fazer a mesma coisa também faz parte da filosofia do Ruby, no caso de dúvidas sobre o como nomear variáveis, quando pular linhas, quais estruturas de controle usar e etc, é importante seguir um padrão.
Quando houver dúvidas sobre legibilidade ou quais recursos da linguagem usar, o guia recomendado é https://rubystyle.guide. 

## O Desafio

Sua missão será implementar uma Calculadora, que tem implementações bem curiosas de várias operações famosas. Além disso, essa potente máquina é orientada a objetos, implementado conceitos como a divisão de responsabilidades, isto é, cada classe só tem uma função, além de ser fácilmente extensível com novas operações.

## Módulos e classes

Nosso projeto estará contido no módulo `Calculator`, que conterá as Classes `Menu` e `Operations`.
O objetivo dessa divisão é "não poluir o namespace global", ou seja, se tivermos outra parte do programa em que seja preciso usar o nome de classe `Menu`, essa classe não iria conflitar com a classe `Menu` da calculadora, que seria chamada por `Calculator::Menu`.

A outra classe do módulo `Calculator` é `Operations`, que contém a implementação das operações que a calculadora irá realizar, sendo um método para cada operação.

## Instruções

Você implementará um menu e as operações descritas a seguir, sem alterar nada no arquivo `main.rb` e somente adicionando novas linhas nos arquivos da pasta `calculator` e em `extra_operations.rb`, conservando o que já foi feito.

### Menu

Você implementará um menu baseado em texto, que conterá uma opção para cada operação e um botão de sair. Ele deverá estar no construtor da classe `Menu`. **O menu será responsável por toda a entrada e saída de dados do usuário**. A entrada deverá ser passada para uma instância de  `Operations` Exemplo de menu:

```
 -------------------------
| Bem vindo a calculadora |
 -------------------------

1. Operacao 1
2. Operacao 2
3. Sair

Sua opção: 
```

Ao digitar um número, o usuário deverá entrar com os dados. Após isso o resultado deverá ser exibido na tela e ao apertar enter, o menu deverá ser redesenhado até que o usuário selecione a opção de sair.

### Operações
  
  Seguindo a separação de responsabilidades em que a classe `Menu` cuidará de toda a entrada e saída do usuário, **as implementações das operações a seguir não deverão conter nenhuma função de saída de texto, como** `puts` **ou** `print`, pois a responsabilidade da classe `Operations` é somente de calcular o resultado das operações.

  Vamos às operações!

#### Média preconceituosa (biased_mean)

Ao calcular a média da turma, um professor decidiu não incluir alguns alunos, pois não gostava deles.
Como seu monitor, é sua missão implementar uma média que ignore as notas de certos alunos.

##### Entrada

`grades`: é uma String em JSON incluindo o nome do aluno e sua nota
Ex:

```javascript
{"Tomás":10, "Iury":10, "Vini":10, "Arnaldo": 9.2}
```

`blacklist`: string com o nome dos alunos que serão desconsiderados, separados por espaço.
Ex:

```
Tomás Iury
```

##### Saída

A média deverá ser exibida na tela.

**Dica: use o método** `JSON.parse(notas)` **para transformar a entrada em uma Hash.
Use também o método** `.split` **pertencente a classe** `String` **para transformar a string em uma array.**

#### Calculadora sem números? (no_integers)

Muita gente diz que não gosta de matemática por causa dos números, porém nós da engenharia sabemos que o terror está nas letras.
Logo o desafio é dizer se uma série de números é divisível por 25 ou não, porém **sem usar a classe `Integer` ou realizar operações de divisão, resto, etc.**.
Os números deverão ser lidos como string. Você também poderá usar strings em que os caracteres são números. Ex:

```ruby
# permitido
numero = "453"

# proibido
numero = 453
```

##### Entrada

`numbers`: string contendo vários números separados por espaço

##### Saída

Para cada número deverá ser exibida uma letra "S" (é divisível) ou "N" (não é divisível). Ex:

`S S N S N N S`

#### Filtrar filmes (filter_films)

Você pode estar se perguntando o que isso tem a ver com uma calculadora, *eu realmente não sei.*
Acabaram as ideias. Para essa operação você irá filtrar uma lista de filmes (Hash) de acordo com seu gênero e ano de lançamento.

##### Entrada

`genres`: string incluindo os gêneros que cada resultado tem que ter separados por espaço. Ex:

`Action Fantasy War`

`year`: inteiro. Os filmes terão que ser lançados a partir desse ano para entrar nos resultados.

##### Saída

Os nomes dos filmes, separados por uma quebra de linha. Ex:

```
FilmeA
FilmeB
FilmeC
```

OBS: **Os resultados deverão ter todos os gêneros filtrados**, ou seja, se o filtro for `Action War`: os filmes selecionados deverão ter o gênero *Action* **E** o gênero *War*.

### Agora é sua vez

Para ilustrar os módulos também como pacotes de funcionalidade quem podem ser incluídos em classes ou outros módulos, crie no módulo `ExtraOperations` um método, implementando uma operação a sua escolha. Seja Criativo!

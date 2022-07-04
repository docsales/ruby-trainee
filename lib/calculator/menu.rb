# frozen_string_literal: true

require_relative 'operations'

module Calculator
  class Menu
    CLEAR = -> { system('tput reset') }
    TEMPLATE = <<~MENU

      Por favor selecione uma das opções:

        1. Média preconceituosa
        2. Calculadora sem números?
        3. Filtrar filmes
        4. Sair
        >
    MENU
    WELCOME = <<~WELCOME
      -------------------------
      | Bem vindo a calculadora |
        -------------------------
    WELCOME

    def self.display
      CLEAR.call
      puts WELCOME
      new.menu
    end

    def menu
      print TEMPLATE

      choice = gets.chomp.to_i

      case choice
      when 1
        puts 'Digite uma string em JSON incluindo o nome do aluno e sua nota: '
        grades = gets.chomp
        puts 'Digite uma string com o nome dos alunos que serão desconsiderados, separados por espaço: '
        blacklist = gets.chomp
        puts Operations.new.biased_mean(grades, blacklist)
      when 2
        puts 'Digite uma string contendo vários números separados por espaço: '
        numbers = gets.chomp
        puts Operations.new.no_integers(numbers)
      when 3
        puts 'Digite uma string incluindo os gêneros que cada resultado tem que ter separados por espaço: '
        genres = gets.chomp
        puts 'Digite o ano mínimo para o filme: '
        year = gets.chomp.to_i
        puts Operations.new.filter_films(genres, year)
      when 4
        puts 'Até logo!'
        exit
      else
        CLEAR.call
        puts 'Opção inválida!'
        print("\n")
        menu
      end
    end
  end
end

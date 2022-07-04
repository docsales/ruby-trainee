# frozen_string_literal: true

require_relative '../../lib/calculator/operations'

require 'spec_helper'

describe 'Operations' do
  it '1: JSON string com alunos e notas, uma string de alunos não permitidos e retorna 9.6' do
    grades = '{"Tomás":10,"Iury":10,"Vini":10,"Arnaldo":9.2}'
    blacklist = 'Tomás Iury'

    expect(::Calculator::Operations.new.biased_mean(grades, blacklist)).to eq(9.6)
  end

  it '2: Recebe uma string contendo vários números, entre eles múltiplos de 25, ' \
  'separados por espaço e retorna "S S N S N N S"' do
    numbers = '00 25 70 50 32 80 75'

    expect(::Calculator::Operations.new.no_integers(numbers)).to eq('S S N S N N S')
  end

  it '3: Recebe uma string incluindo os gêneros que cada resultado tem que ter separados por espaço, ' \
  'e um ano, ex: 1990, e retorna Pan\'s Labyrinth' do
    genres = 'Fantasy War'
    year = 1990

    expect(::Calculator::Operations.new.filter_films(genres,
                                                     year)).to eq('Pan\'s Labyrinth')
  end
end

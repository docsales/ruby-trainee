# frozen_string_literal: true

require 'spec_helper'

describe 'Main' do
  it '1: Verifica a presença da classe Main, retorn true ou falso' do
    result = Object.const_defined?('Main') ? true : false

    expect(result).to eq(true)
  end
end

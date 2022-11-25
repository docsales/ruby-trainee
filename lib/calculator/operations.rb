# frozen_string_literal: true

require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations

    def biased_mean(grades, blacklist); end

    def no_integers(numbers); end

    def filter_films(genres, year); end

    private

    def get_films
      JSON.parse(File.read('db.json'), symbolize_names: true)
    end

    def refresh_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      result = JSON.parse(Net::HTTP.get(URI(url)), symbolize_names: true)
      File.write('db.json', JSON.dump(result))
      result
    end
  end
end

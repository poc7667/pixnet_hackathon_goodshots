class CafesController < ApplicationController
    def index
        binding.pry
        @cafes = Cafe.first(10)
        binding.pry

        
    end
end
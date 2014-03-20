class CafesController < ApplicationController
    def index
        @cafes = Cafe.first(10)
    end
end
# frozen_string_literal: true

module V1
  class QuestionsController < ApplicationController
    def index
      @questions = Question.first(100)

      render json: @questions
    end
  end
end

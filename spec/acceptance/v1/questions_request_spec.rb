# frozen_string_literal: true

require 'acceptance_helper'

resource 'Questions' do
  get '/v1/questions' do
    example 'Listing questions' do
      do_request

      expect(status).to eq 200
    end
  end
end

# frozen_string_literal: true

require 'acceptance_helper'

resource 'Questions' do
  get '/v1/questions' do
    parameter :page, 'Question page', default: '1'
    parameter :per_page, 'Questions per page', default: '10'
    parameter :disciplines, 'Hottest diciplines by access'
    parameter :week, 'Hottest questions from week by access'
    parameter :month, 'Hottest questions from month by access'
    parameter :year, 'Hottest questions from year by access'

    example 'Listing questions' do
      do_request

      expect(status).to eq 200
    end

    describe 'Question Filters' do
      context 'when return the hottest disciplines by access' do
        example '[GET] hottest disciplines - 200' do
          do_request(params: :discipline)

          expect(status).to eq 200
        end
      end

      context 'when return the hottest questions from week by access' do
        example '[GET] hottest questions from week - 200' do
          do_request(params: :week)

          expect(status).to eq 200
        end
      end

      context 'when return the hottest questions from month by access' do
        example '[GET] hottest questions from month - 200' do
          do_request(params: :month)

          expect(status).to eq 200
        end
      end

      context 'when return the hottest questions from year by access' do
        example '[GET] hottest questions from year - 200' do
          do_request(params: :year)

          expect(status).to eq 200
        end
      end
    end
  end
end

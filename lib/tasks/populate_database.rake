# frozen_string_literal: true

require 'json'
namespace :populate do
  desc 'Poputale the table questions'
  task questions: :environment do
    arr_questions = JSON.parse(File.read('public/questions.json'))
    arr_questions.sort_by! { |q| q['id'] }

    arr_questions.each do |question|
      q = Question.find_or_create_by(id: question['id'])
      question.delete('id')
      q.update!(question)
    end
  end

  desc 'Poputale the table question access'
  task question_access: :environment do
    arr_question_access = JSON.parse(File.read('public/question_access.json'))

    arr_question_access.in_groups_of(100_00) do |question_access|
      question_access.each do |ac_question|
        QuestionAccess.create(ac_question)
      end
    end
  end
end

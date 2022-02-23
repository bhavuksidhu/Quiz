class Question < ApplicationRecord
  belongs_to :quiz
  serialize :options, Array
end

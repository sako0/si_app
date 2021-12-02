# frozen_string_literal: true
class Teacher < ApplicationRecord
  has_one :subject
end

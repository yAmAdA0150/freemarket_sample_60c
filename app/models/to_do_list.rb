class ToDoList < ApplicationRecord
  belongs_to :user, dependent: :destroy 
end

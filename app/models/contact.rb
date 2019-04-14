class Contact < ApplicationRecord
  validates :name, length: { maximum: 140 }, presence: true
  validates :email,  length: { maximum: 140 }, presence: true
  validates :content,  length: { maximum: 140 }, presence: true
end

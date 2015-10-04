class Project < ActiveRecord::Base
  has_one :team
  has_one :human_language

  has_many :technical_sets, dependent: :destroy
  has_many :programming_languages, through: :technical_sets

  has_many :knowledge_sets, dependent: :destroy
  has_many :area_of_knowledge, through: :knowledge_sets

  has_many :pools
end

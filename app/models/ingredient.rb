class Ingredient
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  field :name, type: String
  field :amount, type: Float
  field :unit, type: String

  belongs_to :recipe

  validates :name, presence: true
end

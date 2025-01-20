class Recipe
  include Mongoid::Document
  include Mongoid::Timestamps

  field :spoonacular_id, type: Integer
  field :title, type: String
  field :image, type: String
  field :image_type, type: String

  has_many :ingredients, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true,
            format: { with: /\.(jpg|jpeg|png|webp)\z/i, message: "must end with jpg, jpeg, png, or webp" }
  validates :image_type, presence: true, inclusion: { in: %w[jpg jpeg png webp], message: "must be jpg, jpeg, png, or webp" }
end

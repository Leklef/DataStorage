module Types
  class AnimeType < Types::BaseObject

    field :id, ID, null: false
    field :slug, String, null: false
    field :synopsis, String, null: false
    field :title, String, null: false
    field :averageRating, String, null: false
    field :user_count, Int, null: false
    field :favorites_count, Int, null: false
    field :popularity_rank, Int, null: false
    field :rating_rank, Int, null: false
    field :age_rating_guide, String, null: false
    field :cover_image, String, null: false
    field :status, String, null: false
    field :subtype, String, null: false

  end
end

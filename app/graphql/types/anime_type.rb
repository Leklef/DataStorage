module Types
  class AnimeType < Types::BaseObject

    field :id, ID, null: false
    field :slug, String, null: true
    field :synopsis, String, null: true
    field :title, String, null: false
    field :average_rating, String, null: true
    field :user_count, Int, null: true
    field :favorites_count, Int, null: true
    field :popularity_rank, Int, null: true
    field :rating_rank, Int, null: true
    field :age_rating_guide, String, null: true
    field :cover_image, String, null: true
    field :status, String, null: true
    field :subtype, String, null: true

  end
end

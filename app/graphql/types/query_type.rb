module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :anime_by_id, AnimeType, null: true do
      description "Get Anime by id"
      argument :id, ID, required: false
    end

    field :anime_by_title, AnimeType, null: true do
      description "Get Anime by title"
      argument :title, String, required: false
    end

    field :animes, [AnimeType], null: true do
      description "Get All Animes"
    end

    def animes
      Anime.all
    end

    def anime_by_id(id:)
      Anime.find(id)
    end

    def anime_by_title(title:)
      Anime.find_by_title(title)
    end
  end
end

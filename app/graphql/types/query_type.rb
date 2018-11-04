module Types
  class QueryType < Types::BaseObject

    field :all_anime, [AnimeType], null: true do
      description "Find all animes"
    end

    field :anime, AnimeType, null: true do
      description "Find a anime by ID"
      argument :id, ID, required: true
    end

    def all_anime
      Anime.all()
    end

    def anime(id:)
      Anime.find(id)
    end

  end
end

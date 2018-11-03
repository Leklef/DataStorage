class AnimeSerializer < ActiveModel::Serializer
  attributes :slug,
             :synopsis,
             :title,
             :averageRating,
             :userCount,
             :favoritesCount,
             :startDate,
             :endDate,
             :popularityRank,
             :ratingRank,
             :ageRatingGuide,
             :coverImage,
             :status,
             :subtype
end

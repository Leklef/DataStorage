class AnimeSerializer < ActiveModel::Serializer
  attributes :slug,
             :synopsis,
             :title,
             :average_rating,
             :user_count,
             :favorites_count,
             :start_date,
             :end_date,
             :popularity_rank,
             :rating_rank,
             :age_rating_guide,
             :cover_image,
             :status,
             :subtype
end

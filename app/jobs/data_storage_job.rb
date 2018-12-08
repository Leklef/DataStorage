class DataStorageJob

  @queue = :storage_filling

  def self.perform
    Anime.delete_all
    page_index = 0
    base_url = 'https://kitsu.io/api/edge/anime'
    uri = URI(base_url)
    response = Net::HTTP.get(uri)
    json_data = JSON.parse(response)
    save_to_storage(json_data)
    while json_data['links']['next'].present?
      page_index += 1
      uri = URI(json_data['links']['next'])
      response = Net::HTTP.get(uri)
      json_data = JSON.parse(response)
      save_to_storage(json_data)
    end
    puts "Job is done"
  end

  def self.save_to_storage(json_data)
    json_data['data'].each do |item|
      Anime.create(id: item['id'],
                   slug: item['attributes']['slug'],
                   synopsis: item['attributes']['synopsis'],
                   title: item['attributes']['canonicalTitle'],
                   average_rating: item['attributes']['averageRating'],
                   user_count: item['attributes']['userCount'],
                   favorites_count: item['attributes']['favoritesCount'],
                   start_date: item['attributes']['startDate'],
                   end_date: item['attributes']['endDate'],
                   popularity_rank: item['attributes']['popularityRank'],
                   rating_rank: item['attributes']['ratingRank'],
                   age_rating_guide: item['attributes']['ageRatingGuide'],
                   cover_image: item['attributes']['posterImage']['original'],
                   status: item['attributes']['status'],
                   subtype: item['attributes']['subtype'])
    end
  end

end
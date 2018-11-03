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
    while json_data['links']['next'].present? && page_index < 10
      page_index += 1
      uri = URI(@json_data['links']['next'])
      response = Net::HTTP.get(uri)
      json_data = JSON.parse(response)
      save_to_storage(json_data)
    end
    puts "Job is done"
  end

  def save_to_storage(json_data)
    json_data['data'].each do |item|
      Anime.create(id: item['id'],
                   slug: item['attributes']['slug'],
                   synopsis: item['attributes']['synopsis'],
                   title: item['attributes']['canonicalTitle'],
                   averageRating: item['attributes']['averageRating'],
                   userCount: item['attributes']['userCount'],
                   favoritesCount: item['attributes']['favoritesCount'],
                   startDate: item['attributes']['startDate'],
                   endDate: item['attributes']['endDate'],
                   popularityRank: item['attributes']['popularityRank'],
                   ratingRank: item['attributes']['ratingRank'],
                   ageRatingGuide: item['attributes']['ageRatingGuide'],
                   coverImage: item['attributes']['posterImage']['original'],
                   status: item['attributes']['status'],
                   subtype: item['attributes']['subtype'])
    end
  end

end
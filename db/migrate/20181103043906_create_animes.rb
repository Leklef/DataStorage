class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :slug
      t.text :synopsis
      t.string :title
      t.string :averageRating
      t.integer :userCount
      t.integer :favoritesCount
      t.date :startDate
      t.date :endDate
      t.integer :popularityRank
      t.integer :ratingRank
      t.string :ageRatingGuide
      t.string :coverImage
      t.string :status
      t.string :subtype

      t.timestamps
    end
  end
end

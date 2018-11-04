class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :slug
      t.text :synopsis
      t.string :title
      t.string :average_rating
      t.integer :user_count
      t.integer :favorites_count
      t.date :start_date
      t.date :end_date
      t.integer :popularity_rank
      t.integer :rating_rank
      t.string :age_rating_guide
      t.string :cover_image
      t.string :status
      t.string :subtype

      t.timestamps
    end
  end
end

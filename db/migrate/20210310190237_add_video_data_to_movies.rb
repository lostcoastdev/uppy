class AddVideoDataToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :video_data, :text
  end
end

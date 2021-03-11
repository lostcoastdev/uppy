# frozen_string_literal: true

class UploadFilesJob
  include Sidekiq::Worker

  def perform(record_id)
    puts "Hello from upload files and here is the record_id: #{record_id}"
    movie = Movie.find(record_id)
    puts "Title: #{movie.title}"
    puts "Data: #{movie.video_data}"
  end
end

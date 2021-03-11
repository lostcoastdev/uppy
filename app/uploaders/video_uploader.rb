# app/uploaders/video_uploader.rb

class VideoUploader < Shrine
  # use Shrine::Storage::Tus for temporary storage
  storages[:cache] = storages[:tus]

  Attacher.derivatives do |original|
    transcoded = Tempfile.new %w[transcoded .mp4]
    screenshot = Tempfile.new %w[screenshot .jpg]

    movie = FFMPEG::Movie.new(original.path)
    movie.transcode(transcoded.path)
    movie.screenshot(screenshot.path)
    { transcoded: transcoded, screenshot: screenshot }
  end

end

# movie.video_derivatives! # create derivatives
# movie.video              #=> #<Shrine::UploadedFile id="5a5cd0.mov" ...>
# movie.video(:transcoded) #=> #<Shrine::UploadedFile id="7481d6.mp4" ...>
# movie.video(:screenshot) #=> #<Shrine::UploadedFile id="8f3136.jpg" ...>


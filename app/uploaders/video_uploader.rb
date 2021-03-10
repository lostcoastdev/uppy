# app/uploaders/video_uploader.rb

class VideoUploader < Shrine
  # use Shrine::Storage::Tus for temporary storage
  storages[:cache] = storages[:tus]
end

require 'video_uploader'

class Movie < ApplicationRecord
  include VideoUploader::Attachment(:video)

  validates_presence_of :video
  puts "hello from video uploader"
end

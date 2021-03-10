# config/initializers/tus.rb

require "tus/server"
require "tus/storage/s3"

s3_options = Rails.application.credentials.s3

Tus::Server.opts[:storage] = Tus::Storage::S3.new(**s3_options)
Tus::Server.opts[:redirect_download] = true # redirect download requests to S3

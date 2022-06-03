require 'flickr'

class StaticPagesController < ApplicationController
  def index

    if params[:user_id]
      flickr = Flickr.new
      @photos = get_photos(flickr.photos.search(user_id: params[:user_id]))
    end
  end

  private

  def get_photos(photos_ary)
    photo_urls = []

    photos_ary.each do |photo|
      photo_urls << "https://live.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg"
    end

    photo_urls
  end
end

class UpdateImageTagsJob < ApplicationJob
  queue_as :default

  def perform(rentfile)
    image_keys = rentfile.photos.map(&:key)
    image_keys.each do |key|
      Cloudinary::Api.update(key, tags: [rentfile.apply_id])
    end
  end
end

class RenameImagesJob < ApplicationJob
  queue_as :default
  # def perform(apply)
  #   all_image_keys = apply.rentfiles.map(&:photos).flatten.map(&:key)
  #   all_image_keys.each_with_index do |key, index|
  #     Cloudinary::Uploader.rename(key, "#{index}-#{key}", options = {overwrite: true})
  #   end
  # end

  def perform(rentfile, count)
    image_keys = rentfile.photos.map(&:key)
    image_keys.each do |key|
      Cloudinary::Uploader.rename(key, "#{count+1}-#{key}", options = {overwrite: true})
      count +=1
    end
  end

end

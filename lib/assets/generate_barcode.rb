#require 'rubygems'
require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/rmagick_outputter'

#Extension to include barcode data below the image
module Barby
  class CustomRmagickOutputter < RmagickOutputter
    register :to_image_with_data
    def to_image_with_data
      #Make canvas  bigger
      canvas = Magick::ImageList.new
      canvas.new_image(full_width , full_height + 10)
      canvas << to_image
      canvas = canvas.flatten_images
      #Make the text
      text = Magick::Draw.new
      text.font_family = 'helvetica'
      text.pointsize = 14
      text.gravity = Magick::SouthGravity
      text.annotate(canvas , 0,0,0,0, barcode.data)
      canvas
    end
  end
end

def generate_bc
  start = Card.find(params[:id]).start
  finish = Card.find(params[:id]).finish
  until start > finish
    file_name = Card.find(params[:id]).barcode
    start += 1
    barcode = Barby::Code39.new(file_name)
    barcode.to_image_with_data.write("#{file_name}.png")
  end
  
end

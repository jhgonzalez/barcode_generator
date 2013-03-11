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
      canvas.new_image(full_width , 50 + 10)
      canvas << to_image
      canvas = canvas.flatten_images
      #Make the text
      # text = Magick::Draw.new
      # text.font_family = 'helvetica'
      # text.pointsize = 14
      # text.gravity = Magick::SouthGravity
      # text.annotate(canvas , 0,0,0,0, barcode.data)
      canvas
    end
  end
end

class CardController < ApplicationController
  def new
    @card = Card.new
  end
  
  def create
    @card = Card.create(params[:card])
    if @card.save
      
      create_barcode_img
      redirect_to(:action => 'lookup')
    else
      render('new')
    end
    
  end
  
  def lookup
    @cards = Card.all
  end
  
  def print
    @card = Card.find(params[:id])
    render :layout => nil
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    delete_barcode_img
    create_barcode_img
    if @card.update_attributes(params[:card])
      redirect_to(:action => 'lookup')
    else
      render('edit')
    end
  end

  def delete
    @card = Card.find(params[:id])
  end

  def destroy
    @card = Card.find(params[:id])
    delete_barcode_img
    @card.destroy
    redirect_to(:action => 'lookup')
  end
  
  def delete_barcode_img
    #card = Card.find(params[:id])
    start = @card.start
    @card.finish.times do
      file_name = "#{@card.part_no}" + "-" + "#{start}" + "-" + "#{@card.finish}"
      File.delete("app/assets/barcodes/#{file_name}.png")
      start += 1
    end
  end
  
  def create_barcode_img
    #@card = Card.find(params[:id])
    start = @card.start
    finish = @card.finish
    finish.times do
      file_name = @card.part_no + "-" + start.to_s + "-" + finish.to_s
      barcode = Barby::Code39.new(file_name)
      barcode.to_image_with_data.write("app/assets/barcodes/#{file_name}.png")
      start += 1
    end
  end

end
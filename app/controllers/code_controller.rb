require_relative 'card_controller'
include Barby
class CodeController < ApplicationController
  def new
  end

  def create
    # @code = Code.new(params[:code])
    part_no = params[:part_no]
    start = params[:start].to_i
    finish = params[:finish].to_i
    finish.times do
      file_name = part_no + "-" + start.to_s + "-" + finish.to_s
      barcode = Barby::Code39.new(file_name)
      barcode.to_image_with_data.write("app/assets/barcodes/#{file_name}.png")
      start += 1
    end
    system('mv /home/isdept/Dropbox/rails/barcode_generator/app/assets/barcodes/*.png /home/isdept/Dropbox/barcodes/')
    redirect_to(:action => 'new')
  end
  
end

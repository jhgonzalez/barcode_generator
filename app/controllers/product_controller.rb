class ProductController < ApplicationController
  def new
    @poduct = Product.new
  end
  
  def create
    @product = Product.create(params[:product])
    
    if @product.save
      redirect_to(:action => 'lookup')
    else
      render('new')
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to(:action => "lookup")
    else
      render('edit')
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to(:action => 'lookup')
  end
  
  def delete
    @product = Product.find(params[:id])
  end

  def lookup
    @products = Product.all
  end
end

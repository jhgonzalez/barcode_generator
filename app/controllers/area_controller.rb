class AreaController < ApplicationController
  def new
    @area = Area.new
  end
  
  def create
    @area = Area.create(request.GET)
    if @area.save
      redirect_to(:action => 'lookup')
    else
      render('new')
    end
  end

  def edit
    @area = Area.find(params[:id])
  end
  
  def update
    @area = Area.find(params[:id])
    if @area.update_attributes(params[:area]) && @area.update_attributes(:color => params[:color])
      redirect_to(:action => 'lookup')
    else
      render('edit')
    end
  end

  def lookup
    @areas = Area.all
  end

  def delete
    @area = Area.find(params[:id])
  end
  
  def destroy
    Area.find(params[:id]).destroy
    redirect_to(:action => 'lookup')
  end
end

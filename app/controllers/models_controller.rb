class ModelsController < ApplicationController
  def index
    make = Make.where(webmotors_id: params[:webmotors_make_id])[0]
    @models = Model.where(make_id: make.id)
  end
end

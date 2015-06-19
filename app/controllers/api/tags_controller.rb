module Api
  class TagsController < ApplicationController

    def index
      @tags = Tag.all
      render :index
    end


    def show
      @tag = Tag.find_by(tag_params[:name])
      @tag ||= { message: "Tag Not Found" }
      render :show
    end


    private

    def tag_params
      params.require(:tag).permit(
        :name
      )
    end

  end
end

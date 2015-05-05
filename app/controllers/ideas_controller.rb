class IdeasController < ApplicationController

  before_action :set_idea, only: [ :show, :update ]

  def index
    @ideas = Idea.all
  end

  def show

  end

  def update
    # byebug
    @idea.stars = [0, @idea.stars + (params[:like] ? 1 : -1)].max
    @idea.save

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

end

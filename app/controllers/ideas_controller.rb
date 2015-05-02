class IdeasController < ApplicationController

  before_action :set_idea, only: [:show]

  def index
    @ideas = Idea.all
  end

  def show

  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

end

class Participants::IdeasController < ApplicationController

  before_action :set_participant
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = @participant.ideas.all
  end

  def new
    @idea = @participant.ideas.new
  end

  def show

  end

  def edit

  end

  def create
    @idea = @participant.ideas.create(idea_params)
    respond_to do |format|
      if @idea
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end

  end

  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.js
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def set_participant
      @participant = Participant.find(params[:participant_id])
    end

    def idea_params
      params.require(:idea).permit(:title, :description)
    end

end

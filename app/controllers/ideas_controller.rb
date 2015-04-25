class IdeasController < ApplicationController

  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_participant, only: [:new, :create]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def show

  end

  def edit

  end

  def create
    @idea = Idea.new(idea_params)
    respond_to do |format|
      if @idea.save
        # add relation
        @participant.ideas << @idea
        # respond
        format.html { redirect_to @idea, notice: 'Micropost was successfully created.' }
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
        format.html { redirect_to @idea, notice: 'Micropost was successfully updated.' }
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
      format.html { redirect_to ideas_url, notice: 'Micropost was successfully destroyed.' }
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

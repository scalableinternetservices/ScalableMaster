class Participants::IdeasController < Participants::BaseController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:edit, :new]

  def index
    @ideas = @participant.ideas.all.paginate(page: params[:page], per_page: 10)

    @idea_id = params[:idea_id]
  end

  def new
    @idea = @participant.ideas.new
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @idea = @participant.ideas.create(idea_params)
    @idea.update_tags(tags_params)
    respond_to do |format|
      if @idea
        # format.html { redirect_to participant_idea_path(@participant, @idea), notice: 'Idea was successfully created.' }
        format.html { redirect_to participant_ideas_path(@participant, idea_id: @idea.id), notice: 'Idea was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end

  end

  def update
    respond_to do |format|
      # byebug
      if @idea.update(idea_params) && @idea.update_tags(tags_params)
        # format.html { redirect_to participant_idea_path(@participant, @idea), notice: 'Idea was successfully updated.' }
        format.html { redirect_to participant_ideas_path(@participant, idea_id: @idea.id), notice: 'Idea was successfully updated.' }
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
      format.html { redirect_to participant_ideas_path(@participant), notice: 'Idea was successfully destroyed.' }
      format.js
    end
  end

  private 
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def set_tags
      @all_tags = Tag.all
    end

    def idea_params
      params.require(:idea).permit(:title, :description)
    end

    def tags_params
      params.require(:idea).permit(:tag_names)
    end

end

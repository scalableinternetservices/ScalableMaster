class OrganizersController < ApplicationController
  before_action :set_organizer, only: [
    :profile_show, :profile_update, 
    :activities_index
  ]

  def profile_show 
  end

  def profile_update
    respond_to do |format|
      if @organizer.update(organizer_params)
        format.html { redirect_to @organizer, notice: 'Organizer was successfully updated.' }
        # format.js
      else
        format.html { render :show }
        # format.js
      end
    end
  end

  def activities_index
  end


  private
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    def organizer_params
      params.require(:organizer).permit(:name, :nickname, :gender, :age, :phone, :address, :img_url)
    end
end

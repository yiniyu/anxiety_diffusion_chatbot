class EmotionsController < ApplicationController
  def index
    @q = Emotion.ransack(params[:q])
    @emotions = @q.result(:distinct => true).includes(:user, :perspective, :solutions).page(params[:page]).per(10)

    render("emotion_templates/index.html.erb")
  end

  def show
    @solution = Solution.new
    @emotion = Emotion.find(params.fetch("id_to_display"))

    render("emotion_templates/show.html.erb")
  end

  def new_form
    @emotion = Emotion.new

    render("emotion_templates/new_form.html.erb")
  end

  def create_row
    @emotion = Emotion.new

    @emotion.name = params.fetch("name")
    @emotion.user_id = params.fetch("user_id")

    if @emotion.valid?
      @emotion.save

      redirect_back(:fallback_location => "/emotions", :notice => "Emotion created successfully.")
    else
      render("emotion_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @emotion = Emotion.find(params.fetch("prefill_with_id"))

    render("emotion_templates/edit_form.html.erb")
  end

  def update_row
    @emotion = Emotion.find(params.fetch("id_to_modify"))

    @emotion.name = params.fetch("name")
    

    if @emotion.valid?
      @emotion.save

      redirect_to("/emotions/#{@emotion.id}", :notice => "Emotion updated successfully.")
    else
      render("emotion_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @emotion = Emotion.find(params.fetch("id_to_remove"))

    @emotion.destroy

    redirect_to("/users/#{@emotion.user_id}", notice: "Emotion deleted successfully.")
  end

  def destroy_row
    @emotion = Emotion.find(params.fetch("id_to_remove"))

    @emotion.destroy

    redirect_to("/emotions", :notice => "Emotion deleted successfully.")
  end
end

class EmotionsController < ApplicationController
  def index
    @emotions = Emotion.all

    render("emotion_templates/index.html.erb")
  end

  def show
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
    @emotion.user_id = params.fetch("user_id")

    if @emotion.valid?
      @emotion.save

      redirect_to("/emotions/#{@emotion.id}", :notice => "Emotion updated successfully.")
    else
      render("emotion_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @emotion = Emotion.find(params.fetch("id_to_remove"))

    @emotion.destroy

    redirect_to("/emotions", :notice => "Emotion deleted successfully.")
  end
end
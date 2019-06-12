class PerspectivesController < ApplicationController
  def index
    @perspectives = Perspective.page(params[:page]).per(10)

    render("perspective_templates/index.html.erb")
  end

  def show
    @perspective = Perspective.find(params.fetch("id_to_display"))

    render("perspective_templates/show.html.erb")
  end

  def new_form
    @perspective = Perspective.new

    render("perspective_templates/new_form.html.erb")
  end

  def create_row
    @perspective = Perspective.new

    @perspective.name = params.fetch("name")
    @perspective.quotes = params.fetch("quotes")
    @perspective.emotion_id = params.fetch("emotion_id")

    if @perspective.valid?
      @perspective.save

      redirect_back(:fallback_location => "/perspectives", :notice => "Perspective created successfully.")
    else
      render("perspective_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @perspective = Perspective.find(params.fetch("prefill_with_id"))

    render("perspective_templates/edit_form.html.erb")
  end

  def update_row
    @perspective = Perspective.find(params.fetch("id_to_modify"))

    @perspective.name = params.fetch("name")
    @perspective.quotes = params.fetch("quotes")
    @perspective.emotion_id = params.fetch("emotion_id")

    if @perspective.valid?
      @perspective.save

      redirect_to("/perspectives/#{@perspective.id}", :notice => "Perspective updated successfully.")
    else
      render("perspective_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @perspective = Perspective.find(params.fetch("id_to_remove"))

    @perspective.destroy

    redirect_to("/perspectives", :notice => "Perspective deleted successfully.")
  end
end

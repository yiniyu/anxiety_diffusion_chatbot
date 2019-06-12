class SolutionsController < ApplicationController
  def index
    @solutions = Solution.all

    render("solution_templates/index.html.erb")
  end

  def show
    @solution = Solution.find(params.fetch("id_to_display"))

    render("solution_templates/show.html.erb")
  end

  def new_form
    @solution = Solution.new

    render("solution_templates/new_form.html.erb")
  end

  def create_row
    @solution = Solution.new

    @solution.description = params.fetch("description")
    @solution.emotion_id = params.fetch("emotion_id")

    if @solution.valid?
      @solution.save

      redirect_back(:fallback_location => "/solutions", :notice => "Solution created successfully.")
    else
      render("solution_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @solution = Solution.find(params.fetch("prefill_with_id"))

    render("solution_templates/edit_form.html.erb")
  end

  def update_row
    @solution = Solution.find(params.fetch("id_to_modify"))

    @solution.description = params.fetch("description")
    @solution.emotion_id = params.fetch("emotion_id")

    if @solution.valid?
      @solution.save

      redirect_to("/solutions/#{@solution.id}", :notice => "Solution updated successfully.")
    else
      render("solution_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_emotion
    @solution = Solution.find(params.fetch("id_to_remove"))

    @solution.destroy

    redirect_to("/emotions/#{@solution.emotion_id}", notice: "Solution deleted successfully.")
  end

  def destroy_row
    @solution = Solution.find(params.fetch("id_to_remove"))

    @solution.destroy

    redirect_to("/solutions", :notice => "Solution deleted successfully.")
  end
end

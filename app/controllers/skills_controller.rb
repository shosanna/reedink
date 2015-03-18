class SkillsController < AuthenticatedController
  def index
    @skills = current_user.skills
    @skill = Skill.new(user_id: current_user.id)
  end

  def create
    @skill = current_user.skills.build(skill_params)

    if @skill.save
      flash[:success] = "Skill #{@skill.name} was added."
      redirect_to skills_path
    else
      @skills = current_user.skills
      render :index
    end
  end

  def destroy
    skill = current_user.skills.find(params[:id])
    skill.destroy
    flash[:success] = "Skill #{skill.name} was deleted."
    redirect_to skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:user_id, :name)
  end
end

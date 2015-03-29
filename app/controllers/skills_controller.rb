class SkillsController < AuthenticatedController
  def index
    @skills = current_user.skills
    @skill = Skill.new(user_id: current_user.id)

    @reports = {}

    @skills.each do |skill|
      reports = skill.reports.map { |r| r.created_at.to_date }
      @reports[skill.name] = reports
    end

    @report = Report.new
  end

  def create
    skill = current_user.skills.create!(skill_params)
    render json: current_user.skill_data_for_id(skill.id)
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

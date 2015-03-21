class ReportsController < AuthenticatedController
  def create
    @skill = Skill.find(params[:report][:skill_id])
    @report = @skill.reports.new(report_params)

    if @report.save
      flash[:success] = "Progress has been logged."
      redirect_to skills_path
    else
      flash[:error] = "Progress has not been logged."
      redirect_to skills_path
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :note, :skill_id)
  end
end

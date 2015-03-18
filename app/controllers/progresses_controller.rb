class ProgressesController < AuthenticatedController
  def create
    # TODO - show failed validations
    progress = Progress.create!(progress_params)
    flash[:success] = "Progress logged"
    redirect_to progress.book
  end

  private

  def progress_params
    params.require(:progress).permit(:reading_status_id, :page_from, :page_to)
  end
end

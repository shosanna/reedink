class ProgressesController < AuthenticatedController
  def create
    # TODO - show failed validations
    progress = Progress.create!(progress_params)

    if !params[:note].blank?
      Note.create(text: params[:note], reading_status: progress.reading_status)
    end

    flash[:success] = "Progress logged"
    redirect_to progress.book
  end

  private

  def progress_params
    params.require(:progress).permit(:reading_status_id, :page_from, :page_to)
  end
end

class BarksController < ApplicationController

  def new
  end

  def create
    bark_param = params[:bark]
    receiver_email = bark_param[:receiver_id]

    if receiver_email.to_s.empty? || @receiver = User.find_by_email(receiver_email)
      @bark = Bark.generate_empty_bark(logged_in_user)
      @bark.receiver = @receiver
      @bark.text = bark_param[:text]
      Bark.populate_preview_with_text(@bark)
      if @bark.save
        redirect_to home_dashboard_path
      else
        flash.now[:notice] = "Failed to save!"
        render :new
      end
    else
      flash.now[:notice] = "Bad User!"
      render :new
    end
  end

  private

  def bark_params
    params.require(:bark).permit(:receiver_id, :text)
  end

end

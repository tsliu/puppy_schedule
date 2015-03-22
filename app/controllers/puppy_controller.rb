class PuppyController < ApplicationController
  def add
    @puppy = Puppy.new(puppy_params)
    @puppy.user_id = session[:user_id]

    if @puppy.save!
      redirect_to home_dashboard_path
    else

    end
  end

  def index
    @puppies = @user.puppies
  end

  def edit
    @puppy = Puppy.find_by_id(params[:id])

    redirect_to home_dashboard_path unless @puppy and @puppy.user_id = session[:user_id]
  end

  def delete
    @puppy = Puppy.find_by_id(params[:id])

    redirect_to home_dashboard_path unless @puppy and @puppy.user_id = session[:user_id]

    @puppy.destroy
    redirect_to home_dashboard_path
  end

  def update
    @puppy = Puppy.find_by_id(params[:puppy][:id])
    if @puppy.update(puppy_params)
      redirect_to home_dashboard_path
    else
      render 'edit'
    end
  end

  private

  def puppy_params
    params.require(:puppy).permit(:name, :dob, :breed)
  end


end

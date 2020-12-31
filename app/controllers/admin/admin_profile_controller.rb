class Admin::AdminProfileController < AdminController
  before_action :set_profile

  def edit;end

  def update
    respond_to do |format|
      if @profile.update!(set_params)
        format.html{ redirect_to admin_root_path, notice: 'Perfil atualizado com sucesso!'}
      else
        format.html{ render :edit, notice: 'Erro ao atualizar Perfil'}
      end
    end
  end

  private

  def set_params
    if params[:admin][:password].blank? || params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
    params.require(:admin).permit(:email, :password, :password_confirmation, :avatar)
  end

  def set_profile
    @profile = current_admin
  end
end

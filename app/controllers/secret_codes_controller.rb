require 'securerandom'

class SecretCodesController < ApplicationController

  def index
    @secret_codes = SecretCode.all
  end


  def new
    @secret_code = SecretCode.new
  end

  def create
    if  params["create_secret_key_drop_down"].present?
      a = params["create_secret_key_drop_down"].to_i
      (1..a).each do
        @secret_code = SecretCode.new()
        @secret_code.secret_key = SecretCode.new.generate_secret_code
        @secret_code.save
      end
      redirect_to secret_codes_path, notice: 'Secret code was successfully created.'
    end
  end

  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_secret_code
    @secret_code = SecretCode.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def secret_code_params
    byebug
    params.require(:secret_code).permit(:secret_key)
  end

end

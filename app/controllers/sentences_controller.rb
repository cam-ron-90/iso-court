class SentencesController < ApplicationController
  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    @user_charge = UserCharge.find(params["sentence"]["user_charge"])
    @sentence.user_charge = @user_charge
    @sentence.charge = @user_charge.charge
    # @sentence.charge = Charge.find(params[:charge_id])
    @user_charge.update(verdict: 'Guilty')
    #raise
    if @sentence.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    @sentence.destroy
    redirect_to request.referer
  end

  private

  def sentence_params
    params.require(:sentence).permit(:description, :user_charge_id, :charge_id)
  end
end

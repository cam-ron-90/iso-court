class SentencesController < ApplicationController
  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    @user_charge = UserCharge.find(params["sentence"]["user_charge_id"])
    @sentence.user_charge = @user_charge
    @sentence.charge = @user_charge.charge
    @user_charge.update(verdict: 'Guilty')

    if @sentence.save
      redirect_to request.referer
    else
      # new doesn't exist, should re-render modal
      render :new
    end
  end

  def destroy
    @sentence.destroy
    redirect_to request.referer
  end

  private

  def sentence_params
    params.require(:sentence).permit(:description)
  end
end

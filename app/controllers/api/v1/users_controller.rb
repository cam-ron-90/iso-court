class Api::V1::UsersController < Api::V1::BaseController
  def index
    if params[:query]
      sql_query = "username ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
  end
end

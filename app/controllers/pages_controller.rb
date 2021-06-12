class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def monprofil
    @applies = Apply.where(user_id: User.ids)
  end
end

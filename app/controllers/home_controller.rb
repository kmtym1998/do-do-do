class HomeController < ApplicationController
  def top
    I18n.locale = :ja

    require 'date'
    @time = Time.current
    @tasks = Task.all
  end

  def login
  end
end

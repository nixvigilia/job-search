class HomeController < ApplicationController
  def index
    @jobs = Job.published.desc
  end
end

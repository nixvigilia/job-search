class HomeController < ApplicationController
  def index
    @jobs = Job.published.desc

    # url = URI.parse("https://your-url.com/abc.mp3")
    # filename = File.basename(url.path)
    # file = URI.open(url)
  end
end

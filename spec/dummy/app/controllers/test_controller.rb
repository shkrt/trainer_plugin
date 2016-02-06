class TestController < ApplicationController
  def index
    track("index action of test controller invoked", 4)
  end

  def page
  end
end

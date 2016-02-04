class TestController < ApplicationController
  def index
    track("index action of test controller invoked", 4, {}, Time.now)
  end

  def page
  end
end

class DemoController < ApplicationController
  layout 'application'
  def index
  end

  def hello
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end
  def mentors
    redirect_to('http://www.wethementors.com')
  end
  def test
    @array = [1,2,3,4,5]
    @id = params['id'].to_i
    @page = params[:page].to_i
  end

  def text_helpers
  end

  def escape_output
  end
end

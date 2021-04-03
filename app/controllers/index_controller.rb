# トップ画面
class IndexController < ApplicationController
  # トップ画面
  # /
  def index
    logger.debug('Log IndexController method start')
    render 'top'
  end
end

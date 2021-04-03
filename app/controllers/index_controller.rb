# トップ画面
class IndexController < ApplicationController
  # トップ画面
  def index
    logger.debug('IndexController start')
    render 'top'
  end
end

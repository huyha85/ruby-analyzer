class RubyAnalyzerController < ::ApplicationController
  layout 'ruby_analyzer'

  def index
    @duplications = Flay.analyze_application
  end

  def preview
    @files = params[:files]
    respond_to do |format|
      format.js
    end
  end
end
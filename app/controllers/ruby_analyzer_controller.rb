class RubyAnalyzerController < ::ApplicationController
  layout 'ruby_analyzer'

  def index
  end

  def duplications
    @duplications = Flay.analyze_application
    
    respond_to do |format|
      format.js
    end
  end

  def complexity
    respond_to do |format|
      format.js
    end
  end

  def unused
    respond_to do |format|
      format.js
    end
  end
end
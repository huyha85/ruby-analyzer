require 'ruby-analyzer/engine'
require 'ruby-analyzer/flay_report'
require "flay"

Flay.send(:include, FlayReport)
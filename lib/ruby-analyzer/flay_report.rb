module FlayReport
  module ClassMethods
    def analyze_application
      flay = Flay.new
      dirs = %w(app lib spec)
      flay.process(*Flay.expand_dirs_to_files(dirs))
      flay.generate_issues
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def generate_issues
    issues = []
    self.analyze

    self.masses.sort_by { |h,m| [-m, self.hashes[h].first.file] }.each do |hash, mass|
      issue = {}
      nodes = self.hashes[hash]

      issue[:type] = self.identical[hash] ? 'IDENTICAL' : 'SIMILAR'

      issue[:bonus] = nodes.size if self.identical[hash]
      node = nodes.first

      issue[:description] = "%s code found in %p (mass%s = %d)" % [issue[:type], node.first, issue[:bonus], mass]

      issue[:files] = []
      nodes.sort_by { |x| [x.file, x.line] }.each_with_index do |x, i|
        issue[:files] << {file: x.file, line: x.line}
      end

      issues << issue
    end
    issues
  end
end
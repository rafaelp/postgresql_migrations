require 'rake/testtask'

namespace 'test' do
  
  unit_tests = FileList['test/*_test.rb']

  desc "Run unit tests"
  Rake::TestTask.new('units') do |t|
    t.libs << 'test'
    t.test_files = unit_tests
    t.verbose = true
    t.warning = false
  end

end

task :default => 'test:units'

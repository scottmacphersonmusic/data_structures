require 'rake/testtask'

task default: 'test'

Rake::TestTask.new do |t|
  t.libs << "spec"
  t.pattern = "spec/**/*_spec.rb"
end

Rake::TestTask.new do |t|
  t.name = "bm"
  t.libs << "spec"
  t.pattern = "spec/**/*_bm.rb"
end

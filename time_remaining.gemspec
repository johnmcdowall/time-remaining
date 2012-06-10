# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "time_remaining/version"

Gem::Specification.new do |s|
  s.name        = "time_remaining"
  s.version     = TimeRemaining::VERSION
  s.authors     = ["johnmcdowall"]
  s.email       = ["john@mcdowall.info"]
  s.homepage    = "https://github.com/johnmcdowall/time-remaining"
  s.summary     = %q{Determine the time remaining to complete a list of tasks when the total number of tasks and the number of tasks completed are known.}
  s.description = %q{This gem uses a moving average of previous task execution durations and how much work is still remaining to calculate how long it will take to finish the remaining tasks.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "algorithms"
  s.add_dependency "time_diff"
end

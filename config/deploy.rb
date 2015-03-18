set :stages, %w(production staging)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

task :after_update_code, :roles => :app do  
  if ENV['build_gems'] and ENV['build_gems'] == '1'
    run "rake -f #{release_path}/Rakefile gems:refresh_specs"
    run "rake -f #{release_path}/Rakefile gems:build"
  end
end

require 'hoptoad_notifier/capistrano'

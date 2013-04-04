#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rake'
require 'open-uri'
require 'json'

dir_assets = 'vendor/assets/'
dir_js = dir_assets + 'javascripts'

desc 'Downloads the raven.js files from GitHub'
task :download do |t|

  def create_dir dir, version
    dir_name = File.join(dir, version)
    Dir.mkdir(dir_name) unless Dir.exist?(dir_name)
  end

  def download_file url, dir, filename, version
    Dir.chdir(File.join(dir, version)) do
      if File.exists?(filename)
        puts " #{dir + '/' + version + '/' + filename} already exists"
        next
      end
      puts " #{url}"
      open(filename, "w") { |file| file.write(open(url).read)}
    end
  end

  # Specify which version you want
  version = ENV['VERSION']
  version ||= 'latest'
  puts "Target version: #{version.chomp('/')}"

  # Get the different versions
  tags_url = 'https://api.github.com/repos/getsentry/raven-js/tags'
  result = JSON.parse(open(tags_url).read)
  versions = result.map { |item| item['name'] }

  puts "Available versions: #{versions.inspect}"

  # Figuring out which version to get
  if versions.include? version
    get_version = version
  else
    get_version = versions.first

    if !(versions.include? version) && version != 'latest'
      puts "Warning: The version you've specified: '#{version}' wasn't found, using the latest version instead: '#{get_version}'"
    end
  end

  # Get the right commit
  commit = result.select { |item| item['name'] == get_version }.first['commit']['sha']
  puts "We'll use the following commit to get the files: #{commit}"

  # Creating the necessary directories
  create_dir dir_js, get_version

  # Download the right files
  url_root = 'https://raw.github.com/getsentry/raven-js/' + commit + '/dist/' + get_version + '/'
  url_js = url_root + 'raven.js'
  url_js_min = url_root + 'raven.min.js'
  url_js_map = url_root + 'raven.min.map'

  puts "Downloading... \n"
  download_file url_js, dir_js, 'raven.js', get_version
  download_file url_js_min, dir_js, 'raven.min.js', get_version
  download_file url_js_map, dir_js, 'raven.min.map', get_version

end

desc 'Tag the default file versions for asset helpers'
task :tag do |t|
  Rake::Task['tag_default'].invoke
end

task :tag_default do |t|

  def copy_files dir, version
    Dir.entries(File.join(dir, version)).each do |file|
      file_source = File.join(dir, version, file)
      file_destination = File.join(dir, file)
      if File.file?(file_source)
        FileUtils.cp file_source, file_destination, { verbose: true }
      end
    end
  end

  version = ENV['VERSION']
  version ||= 'latest'

  puts "Target version: #{version.chomp('/')}"

  Dir.chdir(dir_js) do
    version_directories = Dir.glob("*").select { |fn| File.directory?(fn) }.sort.reverse

    puts "Available versions: #{version_directories.inspect}"
    if !(version_directories.include? version)
      if version != 'latest'
        puts "WARN: Specified version='#{version}' not found, setting to latest version: '#{version_directories.first}'"
      end
      version = version_directories.first
    end
  end

  copy_files dir_js, version
end

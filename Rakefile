desc 'convert copc into 3d tiles'
task :convert do
  sh <<-EOS
curl --silent https://raw.githubusercontent.com/optgeo/free-nagasaki/main/convert/dst/list.csv | 
ruby filter.rb | 
ruby convert.rb
  EOS
end

desc 'serve the site locally'
task :serve do
  sh <<-EOS
ruby -rsinatra -e 'set :public_folder, "."'
  EOS
end


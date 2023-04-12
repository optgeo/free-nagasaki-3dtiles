dirs = []

while gets
  (fn, cid) = $_.strip.split(',')
  dst_dir = 'tileset/' + File.basename(fn, '.copc.laz')
  dirs.push dst_dir

  unless File.exist?(fn)
    print "ipfs get -o #{fn} #{cid}\n"
  end
  unless File.exist?(dst_dir) 
    print <<-EOS
echo #{dst_dir}
py3dtiles convert --srs_in 3857 --srs_out 4978 --jobs 1 --overwrite --out #{dst_dir} #{fn}
    EOS
  end
end

print <<-EOS
echo merge
py3dtiles merge tileset 
EOS

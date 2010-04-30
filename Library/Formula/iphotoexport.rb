require 'formula'

class Iphotoexport <Formula
  url 'http://iphotoexport.googlecode.com/files/iphotoexport-1.6.1.zip'
  homepage 'http://code.google.com/p/iphotoexport/'
  md5 'd672f045013d7e0723d26e02c2b6e3f9'

  depends_on 'exiftool'
  
  def install
    unzip_dir = @name+'-'+@version
    # Change hardcoded exiftool path
    inreplace "#{unzip_dir}/tilutil/exiftool.py", "/usr/bin/exiftool", "exiftool"
    
    prefix.install Dir[unzip_dir+'/**']
    bin.mkpath
    ln_s(prefix + 'iphotoexport.py', (prefix + 'bin/iphotoexport') )
  end
end

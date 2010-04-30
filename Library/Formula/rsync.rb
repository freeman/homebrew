require 'formula'

class Rsync <Formula
  head 'git://git.samba.org/rsync.git'
  url 'http://rsync.samba.org/ftp/rsync/rsync-3.0.7.tar.gz'
  homepage 'http://rsync.samba.org/'
  md5 'b53525900817cf1ba7ad3a516ab5bfe9'

  depends_on 'libiconv'

  def install
  iconv = Formula.factory 'libiconv'
  ENV.append "CFLAGS",  "-I#{iconv.prefix}/include"
  ENV.append "LDFLAGS", "-L#{iconv.prefix}/lib"

    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--with-rsyncd-conf=#{prefix}/etc/rsyncd.conf",
                          "--enable-ipv6"
    system "make install"
  end
end

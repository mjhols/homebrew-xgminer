require 'formula'

class Bfgminer < Formula
  homepage 'https://github.com/luke-jr/bfgminer'
  head 'https://github.com/luke-jr/bfgminer.git', :branch => 'bfgminer'
  url 'http://luke.dashjr.org/programs/bitcoin/files/bfgminer/3.8.0/bfgminer-3.8.0.zip'
  sha1 'd3f2e8afebafc8d776354c832ae7afa678555635'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'uthash' => :build
  depends_on 'curl'
  depends_on 'jansson'
  depends_on 'libmicrohttpd'
  depends_on 'libevent'

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "PKG_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/curl/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/jansson/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libmicrohttpd/lib/pkgconfig",
                          "--enable-scrypt",
                          "--enable-opencl"
    system "make", "install"
  end

  test do
    system "bfgminer"
  end
end

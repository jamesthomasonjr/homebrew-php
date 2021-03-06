require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Timecop < AbstractPhp72Extension
  init
  desc "timecop is providing \"time travel\" capabilities."
  homepage "https://github.com/hnw/php-timecop"
  url "https://github.com/hnw/php-timecop/archive/v1.2.4.tar.gz"
  sha256 "1e0bc0b47097500152aab0cd8fbc7f4b1323816cdbcd1b65df639d95356fbf85"
  head "https://github.com/hnw/php-timecop.git"
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "e32b0860ad3fda83db47db9c4fa6817d89c831acff9d16f0b78c5c3deaf5c7d0" => :high_sierra
    sha256 "10ceb834a357dd6dec0d8405df1ac2307482c22954df7c95ca9940401d8c7aa1" => :sierra
    sha256 "26ef4944535d08cf0d23f3db16c8772c00b89a6cc1d209de76be4f6ef56f26cb" => :el_capitan
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/timecop.so"
    write_config_file if build.with? "config-file"
  end
end

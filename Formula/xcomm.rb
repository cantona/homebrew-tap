class Xcomm < Formula
  desc "Serial terminal with a control socket that scripts and AI agents can drive"
  homepage "https://github.com/cantona/xcomm"
  url "https://github.com/cantona/xcomm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3bc453c7f379db663d0350045ff54b69c7d6d1ba7fc775902a5e9fa5f3b030f0"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/cantona/xcomm.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "xcomm.1"
  end

  test do
    assert_match "xcomm #{version}", shell_output("#{bin}/xcomm --version")
    assert_match "-b <baud>", shell_output("#{bin}/xcomm --help")
  end
end

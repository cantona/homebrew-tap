class Xcomm < Formula
  desc "Serial terminal with a control socket that scripts and AI agents can drive"
  homepage "https://github.com/cantona/xcomm"
  url "https://github.com/cantona/xcomm/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "7d254d0b2f079689a4942cb4ec61d1fbf585a9282f6f28092b5145f60fa5761e"
  license "GPL-2.0-only"
  head "https://github.com/cantona/xcomm.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "xcomm.1"
  end

  test do
    assert_match "xcomm #{version}", shell_output("#{bin}/xcomm --version")
    assert_match "-b <baud>", shell_output("#{bin}/xcomm --help")
    assert_match ".TH XCOMM 1", shell_output("#{bin}/xcomm man")
  end
end

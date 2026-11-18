class Xcomm < Formula
  desc "Serial terminal with a control socket that scripts and AI agents can drive"
  homepage "https://github.com/cantona/xcomm"
  url "https://github.com/cantona/xcomm/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "b08256874d3f4865a7a918e17629dee579d446ec243b148d0aa8c8f2b72aa86d"
  license "GPL-2.0-only"
  head "https://github.com/cantona/xcomm.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/cantona/homebrew-tap/releases/download/xcomm-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "7b0c9fac1b0832a028b07642aa64aa9968af496d4ad78a926d9988c2c20772d8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f58c424f325ffab4502da0b1cdfaed6bc781d43d6d5a129259ad8085e49633a"
    sha256 cellar: :any,                 arm64_linux:   "6683d20753c5f990333607f5b2291686283a5dfab7c7f3193ac492d5b7f2affc"
    sha256 cellar: :any,                 x86_64_linux:  "a17122ff453b28f5879972fc3edb529aba1f39c8e100e1a30f50c975a3f04a7b"
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

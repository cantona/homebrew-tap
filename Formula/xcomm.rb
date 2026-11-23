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

  bottle do
    root_url "https://github.com/cantona/homebrew-tap/releases/download/xcomm-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2845e40cc143d058064487a918efc662fd7a08e0e8c61ca0f238ae155474036c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "58bd27499cde50ee687901d50655b557c39df8421491a5aa336e974f3583cc59"
    sha256 cellar: :any,                 arm64_linux:   "343d8b32f031025844621c548fcd80482485b37d35427ff8cb3c399fcbc4bf41"
    sha256 cellar: :any,                 x86_64_linux:  "9efbd7e26221609b9bc46a1497b93e8a0263c9738583b65ad8d8bbd3533753a8"
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

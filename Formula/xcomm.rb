class Xcomm < Formula
  desc "Serial terminal with a control socket that scripts and AI agents can drive"
  homepage "https://github.com/cantona/xcomm"
  url "https://github.com/cantona/xcomm/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "968dee53d7c4b4af610b7bcd4fd84c4d9594fab63ac948688d8a199b0e0cda1e"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/cantona/xcomm.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/cantona/homebrew-tap/releases/download/xcomm-0.1.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "770b81f1a5934cf713a8aa34b602b095b57103a7987688607f9cba26da4cf7a7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d71d21aa9ccdc4bd64131dd8240e74531a39edbf41c28be875efbe574eb93f2a"
    sha256 cellar: :any,                 arm64_linux:   "567cd0b5eb8715f83ac02b4f201a0d12b8c12feb5041de7a55bfe50ce9d632d1"
    sha256 cellar: :any,                 x86_64_linux:  "eb7b1d167e590f52688533b501eda87331eb2ef6965380c441d642e80cc6073b"
  end

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

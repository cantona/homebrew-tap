class Xcomm < Formula
  desc "Serial terminal with a control socket that scripts and AI agents can drive"
  homepage "https://github.com/cantona/xcomm"
  url "https://github.com/cantona/xcomm/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "a84ce15159babc96b86ad7e7dc1fb4b11a05978fd1840b513d691cda12062bee"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/cantona/xcomm.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/cantona/homebrew-tap/releases/download/xcomm-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "017a443313558a9849275fb95e48226f6a707ca9443ff8fe9b2bd2e68734938d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "22783d986753493183ba0bbac8b81a05a83c863e4657ed412219fe1864cc81e3"
    sha256 cellar: :any,                 arm64_linux:   "4e7b5e24022151cdc38285c776cbebec61650b72d0a2455359aa10ab60654bf4"
    sha256 cellar: :any,                 x86_64_linux:  "93b1ac18aa60ff648648fbaabe2be3ed54644a6640823b69cb8f8c45fd503f71"
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

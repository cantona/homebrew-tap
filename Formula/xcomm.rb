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
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "3fcc39ea6e41ff45384599d0828fc1ca02ad370a5927e52f6d329056234b16e9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "387472f8486e5bd45a596be85730f8e61f9a171f4f7e080fbfb3e2e0d0796e80"
    sha256 cellar: :any,                 x86_64_linux:  "1c9166df2c54d92e1eb762ac25a9bfd0bc8e117725775920f77ea07a48dc0c93"
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

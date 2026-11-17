class Xcomm < Formula
  desc "Serial terminal with a control socket that scripts and AI agents can drive"
  homepage "https://github.com/cantona/xcomm"
  url "https://github.com/cantona/xcomm/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "968dee53d7c4b4af610b7bcd4fd84c4d9594fab63ac948688d8a199b0e0cda1e"
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

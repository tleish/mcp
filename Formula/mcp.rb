class Mcp < Formula
  desc "CLI that turns MCP servers into terminal commands (chrondb macOS aarch64 fix, unreleased)"
  homepage "https://github.com/avelino/mcp"
  version "0.5.2-chrondb-fix"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tleish/mcp/releases/download/v0.5.2-chrondb-fix/mcp-aarch64-apple-darwin"
      sha256 "2a260e2747dfc84287d5946681e84f1767c18c5f08c1712b41255eef1c915fec"
    else
      url "https://github.com/tleish/mcp/releases/download/v0.5.2-chrondb-fix/mcp-x86_64-apple-darwin"
      sha256 "d078f9f2f2bb44c33079dec53c960b06dc2b3f2bd5fa0685783e50704c4a4fa8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tleish/mcp/releases/download/v0.5.2-chrondb-fix/mcp-aarch64-unknown-linux-gnu"
      sha256 "430b14c762f390abc8c13d105c0654ff752e307cd518705c46c99c20911ac015"
    else
      url "https://github.com/tleish/mcp/releases/download/v0.5.2-chrondb-fix/mcp-x86_64-unknown-linux-gnu"
      sha256 "768d3e3840a8db70c1ed8e437442d179118ff452df98bddbcc0d200b04c264a3"
    end
  end

  def install
    bin.install Dir.glob("mcp*").first => "mcp"
  end

  test do
    assert_match "mcp", shell_output("#{bin}/mcp --help")
  end
end

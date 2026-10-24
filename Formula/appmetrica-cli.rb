class AppmetricaCli < Formula
  desc "Read-only CLI and MCP server for AppMetrica game analytics (unofficial)"
  homepage "https://github.com/ampersante/appmetrica-cli"
  url "https://github.com/ampersante/appmetrica-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4d04554d9432222930c70beee1de220df9e07d046fc7ca7e4734c86c4b9b8e9a"
  license :cannot_represent # no license chosen yet; see the repository

  depends_on "uv"
  depends_on "python@3.13"

  def install
    # Build a self-contained venv in libexec; uv resolves dependencies from
    # PyPI using the uv.lock shipped in the source tarball.
    ENV["UV_NO_PROGRESS"] = "1"
    ENV["UV_CACHE_DIR"] = ENV.fetch("HOMEBREW_CACHE")
    system "uv", "venv", "--python", Formula["python@3.13"].opt_bin/"python3", libexec
    system "uv", "pip", "install", "--python", libexec/"bin/python", "."
    bin.install_symlink libexec/"bin/appmetrica"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/appmetrica --version")
    system bin/"appmetrica", "--help"
  end
end

class PlaneSync < Formula
  include Language::Python::Shebang

  desc "Sync Plane projects with Markdown: snapshot, fetch, write, diff"
  homepage "https://github.com/ampersante/plane-sync"
  url "https://github.com/ampersante/plane-sync/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "506d3e6e88dc07016d36105128df3260f9983769ede678e7fbf1e9de17c895b0"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install Dir["*"]
    rewrite_shebang detected_python_shebang, libexec/"bin/plane-sync"
    bin.install_symlink libexec/"bin/plane-sync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plane-sync --version")
  end
end

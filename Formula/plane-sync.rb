class PlaneSync < Formula
  include Language::Python::Shebang
  desc "Sync Plane projects with Markdown: snapshot, fetch, write, diff"
  homepage "https://github.com/ampersante/plane-sync"
  url "https://github.com/ampersante/plane-sync/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "03e9d1d03b2b139bf30200ff3710aac2a48ebf4f0286f93ced1becba40cf49f1"
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

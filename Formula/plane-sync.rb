class PlaneSync < Formula
  include Language::Python::Shebang

  desc "Sync Plane projects with Markdown: snapshot, fetch, write, diff"
  homepage "https://github.com/ampersante/plane-sync"
  url "https://github.com/ampersante/plane-sync/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "34bca7d10f20ecac5a78668c7bac25396368da857420ebf406a303909e928716"
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

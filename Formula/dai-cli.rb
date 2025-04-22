class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/darwin_arm64.tar.gz"
      sha256 "949826fef49823d00ed81435be7d7f6ad5bb30f5cc7042d4405db78e7899b15e"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/darwin_amd64.tar.gz"
      sha256 "523316a6242937b568306ec8d3901e6bb56f8f64c7c62fe74399e9be04c01860"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/linux_amd64.tar.gz"
      sha256 "618e440bd1dda5ebf57938c770b5d0950f9592f5ecc413dcb26f36860ea5e755"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/linux_arm64.tar.gz"
      sha256 "816b14639fc27843413338c24a5972b953d325b94791d0ac1b6f1504c9eef483"
    end
  end

  def install
    bin.install "dai-cli"
  end

  test do
    system "#{bin}/dai-cli", "--version"
  end

  def caveats
    <<~EOS
      To use Dai CLI, you may need to configure your API keys:
      
      For OpenAI integration:
      $ export DAI_OPENAI_API_KEY=your_api_key
      
      For GitHub integration:
      $ export DAI_GITHUB_TOKEN=your_github_token
      
      You can add these to your shell profile for permanent use.
    EOS
  end
end

class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/darwin_arm64.tar.gz"
      sha256 "fe382a966bbfd3d32033ad95976a85602f2c9f5b90606ae32cdb5cdea8b0c710"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/darwin_amd64.tar.gz"
      sha256 "755c3354d8ad1115f5dc5ccf3af5ec089eea43047ccbd93d06f6fb104864a4c4"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/linux_amd64.tar.gz"
      sha256 "9c0fc56e8e4da5cc555108eeb7153ca4d3f80e161a1a04437bd29f21b51e1901"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.0/linux_arm64.tar.gz"
      sha256 "833d070e0585a901241bd54b1f0c56bc706d4819ca9ab39467f24a709c118daa"
    end
  end

  def install
    bin.install "dai"
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

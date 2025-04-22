class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/darwin_arm64.tar.gz"
      sha256 "77d07be95c4acfa9b28a66c14510e865903c4fb5fdcba90b24d1bc1d26f55c00"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/darwin_amd64.tar.gz"
      sha256 "fb296de4f39639a7ac5206f5bceeffe853b4e2ad30ea94244476b72679ab204a"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/linux_amd64.tar.gz"
      sha256 "3ad54b2157d1b2e707482e3e0f3911a225f4cdaa8be743996362c923cb3ec444"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/linux_arm64.tar.gz"
      sha256 "660f94bf571b4ed7d67dacdf3b7ebc713d618ae09875eae9438b9f9e2b82cacf"
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

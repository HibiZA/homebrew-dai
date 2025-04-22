class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/darwin_arm64.tar.gz"
      sha256 "db3e6739dd5996734c062ffc3f73126612a74aea2eb02ab03701995f8dd7d595"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/darwin_amd64.tar.gz"
      sha256 "1e742cf657d6d6747ec53ad8f216ecb88d1ab860d5b821152e5ffe7130a204fc"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/linux_amd64.tar.gz"
      sha256 "db7960e33636ff9124c53c07fa84e6d60916c92499453e54ec37f57fda002ace"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/linux_arm64.tar.gz"
      sha256 "9f50cf4ace662c3213ef5a8dc5d493f7b0f52254079df93d1dc282bd42e97628"
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

class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/darwin_arm64.tar.gz"
      sha256 "6e6b5b1a615e79008edeb44e9698b26a496b17b470ed19f7d5c4c6f87f366a3a"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/darwin_amd64.tar.gz"
      sha256 "f7d4228c76ead5083fb6d8764c8b0b4aa876f61e1c5734505f2ae8a5b0ad788e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/linux_amd64.tar.gz"
      sha256 "4f0db739da64a727770218a7e9253c761d43809887c3f96006d69c9d530aa011"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/linux_arm64.tar.gz"
      sha256 "9e73371f2b3a7c35dc962dc048c5c09f9d64c0c3b1d66245743bab5a88e7f18b"
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

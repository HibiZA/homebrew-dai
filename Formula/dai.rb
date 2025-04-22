class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.8"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.8/darwin_arm64.tar.gz"
      sha256 "bf153285e9b7a11b16a45416a0d2fb1f5e8099f00a747019a8b5ba5ac3699182"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.8/darwin_amd64.tar.gz"
      sha256 "0fed13e80cf738fb431ddc00f4004b9524e99c320733a913628417495557ffd8"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.8/linux_amd64.tar.gz"
      sha256 "1476dd2ac8552311118c0cb62715c2ad0626db6a1fb5dd20085b8d7ac80dd277"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.8/linux_arm64.tar.gz"
      sha256 "3e5b7bf8a90fb24891aab42b580ecace23c7f5a8f9f986a353da78fdafc9a399"
    end
  end

  def install
    bin.install "dai"
  end

  test do
    system "#{bin}/dai", "--version"
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

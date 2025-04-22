class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.9"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.9/darwin_arm64.tar.gz"
      sha256 "829764f329af8dd85a55e28f94785345a53d44f6d027e658483a559b1979799c"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.9/darwin_amd64.tar.gz"
      sha256 "23c64ef1bfba0bb5ad2671ac3b19943762c3848575aaad5612fd6611872b466c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.9/linux_amd64.tar.gz"
      sha256 "c0e3ee814ca148f96824e15355f56e5c1c8be7f351afede8e04b826949f37954"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.9/linux_arm64.tar.gz"
      sha256 "ac58384e13d4aa2ff50556b4c5f60cba7fccdca9e1abe51e63b46f22662c3d97"
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

class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.5"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/darwin_arm64.tar.gz"
      sha256 "df2191b4b29d5b88c3000ae31831a74a794c3ddab4800e1cf86e37cd0eb5be17"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/darwin_amd64.tar.gz"
      sha256 "271cf8bd442c7950eaed3d6951bd5096d796e7d8584c1de5364f3f3101118dde"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/linux_amd64.tar.gz"
      sha256 "494ba45cc90ecacfc3f431583a3769dd2c88f3361183bff9af75d8cf52ac6233"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/linux_arm64.tar.gz"
      sha256 "d835a5e708508670e54892d99f4512ca01a37e49295c3a18847b95cccb08d81a"
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

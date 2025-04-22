class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/darwin_arm64.tar.gz"
      sha256 "078a89473c25e6a976aef40f6dd44546401a3d504daabf8cb797943c61183b08"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/darwin_amd64.tar.gz"
      sha256 "652288b140c204524f681c76d638c4d52bdd42a2470db2b842834232143955b8"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/linux_amd64.tar.gz"
      sha256 "76eef5c3b10be9a50e71a6e4569068015ece39a98706fa17f7bd63d7a59c089a"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/linux_arm64.tar.gz"
      sha256 "f9f102ece5fa4c9bf037f3b99b1d35f691fb104330bf89ddc7ff20134fb4360a"
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

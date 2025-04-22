class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/darwin_arm64.tar.gz"
      sha256 "575ee334ddaf26ebdfb32edbb956358ef30e664e1905dc5454cac8008893cce3"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/darwin_amd64.tar.gz"
      sha256 "2cb6730456bb59d4cba20ad7334ed4ebd1acfcf95941f15a9a4e1df3dc806859"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/linux_amd64.tar.gz"
      sha256 "1190dcb988470d3f2295c890a8a745f4a9ed424c56f24cda4402e30c41a2c03a"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/linux_arm64.tar.gz"
      sha256 "a950dd3cddc0bba561b3142cb2bc843879ae62cb3f64a53cd57e21bb9bab8c4e"
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

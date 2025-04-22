class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.7"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.7/darwin_arm64.tar.gz"
      sha256 "84cdecc99cf3c02ac546175f99075197f401b395102a394e1fd18779cee4f639"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.7/darwin_amd64.tar.gz"
      sha256 "45aa8e5b24b6df82aedb4c65e6691b01822b792c027c7bc82696ae4bfb945d3d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.7/linux_amd64.tar.gz"
      sha256 "24546c6af5d6c2bf6f5582dc92020c225a949cb3571ee77c0d5221ce3b282444"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.7/linux_arm64.tar.gz"
      sha256 "873e175a4484807174e3d251dffe9e92e9fde20728e8f21082670e91dab48aad"
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

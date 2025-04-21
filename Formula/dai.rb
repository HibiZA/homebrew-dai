class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/darwin_arm64.tar.gz"
      sha256 "41515b757b16ec56dd86b069e590ac708b96dee0a1d05712d444f0b1192b4239
99685d5c4f55f300b7cb0667d3199b1b35d1ee81746dd39a0040246894319261"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/darwin_amd64.tar.gz"
      sha256 "3ab7e8303a14bcffe608148a031954e7bb6a237d1ee90370b96c9ef8d66da53d
aca8dff120537e8d8597341dbb4b07f9c5f4ded18287199a0967821d7cb54aad"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/linux_amd64.tar.gz"
      sha256 "7a0c7289a68827a15d4ab585dd5a6f9ceaaab1b03868b06a535a2f2cc1f93e77
c34a2790f0fe9f6b33ffc6e9a5bd7cf6129bec95600b4a3bc01436ab7b37d5a8"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.1/linux_arm64.tar.gz"
      sha256 "1ede191b576133cdca53e86263498bec7e6b7d047017d9cfd402167dd073d77f
aa2f3809020433e2725194b934d4f74f76689fd1959ee332b32cc83a8c90ee69"
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

class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/darwin_arm64.tar.gz"
      sha256 "2cd19b3287caf4a484c77b0ebbe2797112d08f7453ed0eca4a30005263c33e28
6d21b27b37f5c828817a61b33f0393579c9dacc337b2ad979c6b7536c0bc261c"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/darwin_amd64.tar.gz"
      sha256 "b45038d4682bb49d8dafb686f75466a2241dbe434dc233ce50555a92bd324723
e42d300e08372b6b8d9afe59e1d5edc96972499934751f79ba0ccf2300f595e0"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/linux_amd64.tar.gz"
      sha256 "dd27dd46cf37ba2c47f35353751f371b8d187a02cae2fd35d72b688b59e4ec20
fe6a041a4414fda4731960080f0bf0e8cdb25b21d0b4c7b222ad2f0e6486ba24"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/linux_arm64.tar.gz"
      sha256 "0e3668a7951ec349c8727b91c744cca8bd58c289f1356a24a7b058665b23f0a1
3224f5010d6f51f786037d6124d6a6e3c15511b5676989b90abfc01b17d5a4e6"
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

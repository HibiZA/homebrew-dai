class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.10"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.10/darwin_arm64.tar.gz"
      sha256 "f1f0e95ff263ec1a4ccf6b8dab90865a18cd1a398e0e409c6bcbb9abc6898843"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.10/darwin_amd64.tar.gz"
      sha256 "40d2ebf83e14efc6d109324c821b921ab131f4c45d2a0263050890714c3e0d75"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.10/linux_amd64.tar.gz"
      sha256 "14ad23fdbd0e0037fe9656382bf88565aafed14ec6877a3f47f564047be89c16"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.10/linux_arm64.tar.gz"
      sha256 "96921ac2fce32ff5834edc8dbfaad55ce23be08645e67311a10bab98a73670b3"
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

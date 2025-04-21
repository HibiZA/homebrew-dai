class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/darwin_arm64.tar.gz"
      sha256 "e96b40a8feb68e53277c648a451c1445b61c30db0e5b46191d9168e18044a06b
d15bcb9d4103e814dafb59dbb569f9dc4f31ee97df6855b7b2c590306a8e44da"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/darwin_amd64.tar.gz"
      sha256 "40ef9707af98a4c6a4c370b86eecef17565e6a3b246fcae11e94e8b6dc5891a6
b1492964f7af755547ba561eb6d06fae789d26b61f7948e063ddee64b155a84c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/linux_amd64.tar.gz"
      sha256 "2a5da8eb6239c6042d2dd72dffb47f7edf7ee43a9d8ac3c6663c94ab00fc1043
e23f7c458fc78fcce3d48690d189dd4cfe228679e9fb8101cbd529414f05920e"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.2/linux_arm64.tar.gz"
      sha256 "86a43dafbbd3956c9ba5b938cf27d975d3992ca4c9f3dfc3e257c8d2c9e88f61
55fbb3f562689bd9fee62a0c75edff8b2d57648f7316940a20cdb9068849be64"
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

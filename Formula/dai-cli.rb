class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/darwin_arm64.tar.gz"
      sha256 "99b1462b7ad3bf135c8ef8e22c397a637aa0fe4b741138504695400fe05a156c"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/darwin_amd64.tar.gz"
      sha256 "ec9762057e47b394a309e2b2f78fc469d7180f177cd923a5461d2bf70c024258"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/linux_amd64.tar.gz"
      sha256 "f0246ae96e2fc8a89b706ea262dc401d76dd7a2b206a3657a7292e57adf528f3"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.3/linux_arm64.tar.gz"
      sha256 "2cc6ea141e5b0d79ca44c47f3d687667184846f417dbe88bbb418701d6c60936"
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

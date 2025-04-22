class DaiCli < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.5"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/darwin_arm64.tar.gz"
      sha256 "4f352c0cdd0cf0be13b7907cc5bc059c217e6720e5633ddc61ea989f644cbbf3"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/darwin_amd64.tar.gz"
      sha256 "cbb8103ddd5a6aee452b9b0d034d538956417d16115d9e4e9efb1dc47e95178c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/linux_amd64.tar.gz"
      sha256 "fc7e50b25a29f8dcd1d61061d4189502f9bb4fa7ad3113234ae4f291256cc23e"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.5/linux_arm64.tar.gz"
      sha256 "5f495813ede976029e314f6a4b227454f020021bc346c7fd1af72a2861abe412"
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

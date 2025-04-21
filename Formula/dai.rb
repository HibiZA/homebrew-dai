class Dai < Formula
  desc "AI-backed dependency upgrade advisor for package.json projects"
  homepage "https://github.com/HibiZA/Dai"
  license "MIT"
  version "0.1.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/darwin_arm64.tar.gz"
      sha256 "8caa3a2e26868881f57d1b6e566efb471a31dde6c1f0ce8a70c9c846b02ed622
b78b58cc157236aa21b2c8fefbcfac947d55d2dd9cb554422d6d8d1d56b39014"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/darwin_amd64.tar.gz"
      sha256 "cdc146d9bc730ff956af732bdd75aa866e1931ccb75e50dee7de87fc467a5918
4cfca599aef881f14526909d725f015b37b029b36399a8606fc7d5c82bb871ff"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/linux_amd64.tar.gz"
      sha256 "f2d6881cab28838a149bcf7c23f47a4142695b7dfb87b5d73064d790fd4fdea9
4b905e5d680c85871173b974fa274fb892ef06f268bb28e726ceca35f7398f74"
    else
      url "https://github.com/HibiZA/Dai/releases/download/v0.1.4/linux_arm64.tar.gz"
      sha256 "1d78847c6172daffd4ad53213076ff4d47ed054235e71fc399a131df253d8e42
85577facdea1eaff76f97932023201060dec558261fade3fc495530a97cf642d"
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

# Dai CLI Homebrew Tap

This repository contains Homebrew formulae for [Dai CLI](https://github.com/HibiZA/dai).

## Usage

```bash
# Tap the repository
brew tap HibiZA/dai/dai-cli

# Install Dai CLI
brew install dai
```

## Available Formulae

- `dai`: AI-backed dependency upgrade advisor for package.json projects

## Development

To update the formula after a new release:

1. Update the version in `Formula/dai.rb`
2. Update the SHA256 checksums for each platform
3. Commit and push the changes

This is typically handled automatically by the GitHub Actions release workflow.

## License

This repository is available under the same license as [Dai CLI](https://github.com/HibiZA/dai). 
# homebrew-tokenicode

Homebrew tap for [TOKENICODE](https://github.com/yiliqi78/TOKENICODE).

## Install

```bash
brew install --cask crosery/tokenicode/tokenicode
```

## Manual maintenance

```bash
node scripts/update-cask.js
brew audit --cask --strict Casks/tokenicode.rb
brew livecheck --cask Casks/tokenicode.rb
```

The GitHub Actions workflow checks the latest upstream release every day and
updates `Casks/tokenicode.rb` when a newer version is available.

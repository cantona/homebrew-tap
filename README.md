# cantona/tap

Homebrew formulae.

```sh
brew install cantona/tap/xcomm
```

A pull request that changes a formula builds its bottles (prebuilt, for
macOS 15 and later on Apple Silicon, and x86_64 Linux) with `brew test-bot`; the
`brew pr-pull` workflow, run with the pull request's number, publishes them
as a release, and pushes the formula's bottle block to main. Without a
bottle, Homebrew builds from source.

| Formula | |
|---|---|
| [xcomm](https://github.com/cantona/xcomm) | A serial terminal. Built for speed. Made for engineers. Ready for AI agents. |

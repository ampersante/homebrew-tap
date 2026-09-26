# homebrew-tap

Homebrew tap for [plane-sync](https://github.com/ampersante/plane-sync), a
stdlib-only Python CLI to sync [Plane](https://plane.so) projects with
Markdown (snapshot, fetch, write, diff).

## Install

```
brew install ampersante/tap/plane-sync
```

This taps `ampersante/homebrew-tap` automatically and installs the
`plane-sync` formula. Requires Python 3.10+ (the formula pulls in
`python@3.13` as a dependency).

Verify:

```
plane-sync --version
```

## Upgrade

```
brew update
brew upgrade ampersante/tap/plane-sync
```

## Uninstall

```
brew uninstall plane-sync
```

To also remove the tap:

```
brew untap ampersante/tap
```

## Main repo

Source, issues, and documentation: https://github.com/ampersante/plane-sync

## Maintainers: bumping the formula

When a new `plane-sync` release tag is pushed:

1. Compute the sha256 of the new release tarball:
   ```
   curl -fsSL https://github.com/ampersante/plane-sync/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```
2. In `Formula/plane-sync.rb`, update:
   - `url` to point at the new tag (`vX.Y.Z.tar.gz`)
   - `sha256` to the value from step 1
3. Confirm the formula still installs and passes its `test do` block
   (`brew install --build-from-source ./Formula/plane-sync.rb` locally, or
   `brew audit --strict --online plane-sync` before publishing).
4. Commit and push the change to this tap repo.

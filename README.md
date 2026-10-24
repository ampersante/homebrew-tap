# homebrew-tap

Personal Homebrew tap with formulas for ampersante tools:

- [appmetrica-cli](https://github.com/ampersante/appmetrica-cli) — read-only
  CLI and MCP server for AppMetrica game analytics (unofficial).
- [plane-sync](https://github.com/ampersante/plane-sync) — a stdlib-only
  Python CLI to sync [Plane](https://plane.so) projects with Markdown
  (snapshot, fetch, write, diff).

## Install

```
brew install ampersante/tap/appmetrica-cli
brew install ampersante/tap/plane-sync
```

Installing either formula taps `ampersante/homebrew-tap` automatically.

`appmetrica-cli` is built into a self-contained virtualenv (the formula pulls
in `python@3.13` and `uv`); verify with `appmetrica --version`.
`plane-sync` requires Python 3.10+ (`python@3.13` as a dependency); verify
with `plane-sync --version`.

## Upgrade

```
brew update
brew upgrade ampersante/tap/appmetrica-cli ampersante/tap/plane-sync
```

## Uninstall

```
brew uninstall appmetrica-cli   # and/or: brew uninstall plane-sync
```

To also remove the tap:

```
brew untap ampersante/tap
```

## Main repos

- appmetrica-cli: https://github.com/ampersante/appmetrica-cli
- plane-sync: https://github.com/ampersante/plane-sync

## Maintainers: bumping a formula

When a new release tag is pushed to a tool's repo:

1. Compute the sha256 of the new release tarball:
   ```
   curl -fsSL https://github.com/ampersante/<tool>/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```
2. In `Formula/<tool>.rb`, update:
   - `url` to point at the new tag (`vX.Y.Z.tar.gz`)
   - `sha256` to the value from step 1
3. Confirm the formula still installs and passes its `test do` block
   (`brew install --build-from-source ampersante/tap/<tool>` after
   `brew update-tap ampersante/tap`, or `brew audit --strict --online <tool>`
   before publishing).
4. Commit and push the change to this tap repo.

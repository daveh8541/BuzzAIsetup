# Read-only machine findings — 2026-08-01

- Buzz Desktop v0.5.3 is already installed at `C:\Users\dave\AppData\Local\Buzz\buzz-desktop.exe` and was running during discovery.
- Buzz had one desktop process, three `buzz-acp` processes, and an ACP pool that initialized ten local `hermes-agent` v0.17.0 workers.
- Buzz already launches Hermes using the local OpenAI Codex runtime credentials. Direct Buzz installation of Codex failed with Access Denied, but Hermes ACP currently works.
- Local Hermes v0.17.0 is configured with `gpt-5.6-sol` and OpenAI Codex auth. Its standalone messaging gateway was stopped, with zero cron jobs and zero active Hermes sessions at inspection time.
- Hermes delegation already uses a three-child limit, one-level spawn depth, and no auto-approval. This is a good baseline.
- Buzz's managed built-in pool uses parallelism 10 and a 320-second timeout. This is the main cost/loop risk to constrain before wider activation.
- Git and a bash-compatible shell are present. Docker, Rust, and `just` were not available on the ordinary command path, so building or self-hosting Buzz from source is not ready on this machine without additional installation.
- Buzz configuration under AppData contains sensitive identity and auth metadata. Do not copy it into this repository or edit managed state directly.
- The existing Obsidian command-center vault has pending changes and is one commit ahead. Do not bulk-stage or auto-push it.
- Grogu's current live state was not verified. Prior status is stale; recheck before planning around its jobs or gateway, and do not touch its Aevo/finance runner.
- HyperAgent and Perplexity history remain incomplete locally. Use authenticated access or exports rather than guessing from extension files.

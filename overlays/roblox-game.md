# Roblox Game Overlay

Append this to a project repo's instruction file when the agent is working on Roblox game development.

## Project Intent

Roblox work often mixes gameplay design, Luau scripting, UI, assets, economy/balance, analytics, and live-ops. The shared token-saving baseline should not prevent creative iteration or broad design exploration when useful.

## Agent Behavior

Prefer:

- clear player-facing outcomes
- small playable increments
- fast local/static checks when available
- explicit assumptions when Roblox Studio/manual verification is needed
- separation between game design ideas and implementation tasks

Do not over-compress:

- gameplay design rationale
- economy/balance tradeoffs
- onboarding/tutorial copy
- player-facing text
- art/audio direction

## Code/Asset Discipline

- Keep Luau/Roblox API names exact.
- Do not invent unavailable services/APIs; verify against project conventions or Roblox docs when needed.
- Avoid broad asset rewrites without scope confirmation.
- Preserve existing place/file structure unless asked to refactor.
- Treat monetization/economy changes as design-sensitive; call out balance risks.

## QA Gates

Before claiming done:

- [ ] Player-facing change is described in normal human language.
- [ ] Code paths/files changed are listed.
- [ ] Available lint/test/static checks ran, or manual Roblox Studio verification need is stated.
- [ ] Gameplay/economy assumptions are explicit.
- [ ] No large asset or system rewrite happened without user scope.

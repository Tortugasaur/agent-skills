# Call Hermes Overlay

Append this to a project repo's instruction file when the agent is working on Call Hermes / HVAC phone-agent work.

## Project Intent

Call Hermes is focused on helping small service businesses capture and handle calls/texts with minimal operational complexity.

For HVAC work:

- Visible labels and copy should say **HVAC**.
- Spoken prompts may pronounce it as “H VACK” only where speech synthesis needs phonetic help.
- Do not rename UI/customer-facing labels to the phonetic spelling.

## Current Product Bias

Prefer:

- booking video as primary outcome
- emergency/follow-up as secondary outcomes
- short openers
- small pilots that collect real call/text data
- API-cost-only/free-data pilot for early tester when appropriate

Avoid overbuilding:

- dispatch systems
- revenue dashboards
- complex CRM replacement
- large onboarding docs before first-client proof

## Agent Behavior

When asked to plan or build:

1. Identify the biggest blocker to first paid/pilot usage.
2. Propose the smallest next change.
3. Name what not to build yet.
4. Add a proof gate: what would show this worked?
5. Keep copy clear and customer-safe; use normal prose for public materials.

## QA Gates

Before claiming done:

- [ ] Customer-facing copy is not overclaiming.
- [ ] HVAC terminology is visible/spoken correctly.
- [ ] Changes support booking/call capture, not unnecessary ops complexity.
- [ ] If code changed, relevant local tests/build checks ran or blocker is stated.

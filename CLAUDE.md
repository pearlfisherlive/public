# public

<!-- ryujin:security start -->
## Security (Pearlfisher playbook)

This repo is watched by **Ryujin**, Pearlfisher's security agent. These rules apply to every change, by a person or an AI. Full playbook with the reasons: `pearlfisherlive/ryujin` → `docs/security-playbook.md`. This section is kept in sync by Ryujin, so don't edit it here; ask Jon (IT) to change the playbook instead.

**Before building anything, ask:** if the wrong person used this, could they see someone else's data, give themselves more access, or move money? If yes, it needs a server-side check you can point to.

1. **Every page and API route checks the user on the server.** Hiding a button isn't security. Anything on a public-path or bypass list (proxy matcher, `/api/v1`, cron, webhooks) must do its own check: API key, shared secret or signature.
2. **Check the record, not just the login.** Changing an ID in a URL must never show someone else's data. Roles come from the verified session, never from the request body.
3. **Supabase:** the anon key is public. RLS on for every table; no policy with `using (true)` or without a `TO` role. Service-role key on the server only, never `NEXT_PUBLIC_`. No writes from the browser.
4. **Secrets:** never in code, tests or examples. `NEXT_PUBLIC_` means public. A secret that was ever committed is leaked: change it at the provider first.
5. **Treat outside input as hostile** (forms, URLs, uploads, webhooks, Jira/Slack text, AI output). Validate on the server with a schema. Parameterised queries only. No `dangerouslySetInnerHTML` with editable content; use a sandboxed iframe. Don't fetch user-supplied URLs from the server.
6. **Return only the fields needed.** No `select('*')` straight into a response. No secrets, tokens or personal data in logs or error messages.
7. **AI:** provider calls go through the server. Tools that act on outside text stay read-only or need a person to confirm.
8. **Infrastructure:** containers run as non-root and write only to `/tmp`. Cloud Run requires auth. Firewall rules name a source, never `0.0.0.0/0`. Production data stays in production.
9. **Packages:** Dependabot sends one grouped PR each Monday. New packages get a line in `decisions.md` (or the PR) saying why.

**How Ryujin works here:** nightly scans raise tickets in Linear (team PF, this app's project). Fix PRs come from `ryujin/<ticket>` branches and explain what changed and why; Codex adds a second opinion; a person always merges. The smoke check runs on every Vercel deploy. A wrong ticket: cancel it in Linear. A deliberate exception: label it `accepted-risk`. Unsure about a security change: ask Jon before merging.

**When you fix a security problem,** leave a short "why" next to the change (a code comment, and here or in `decisions.md` if the reason should outlive the PR), so the next person or AI doesn't undo it.
<!-- ryujin:security end -->

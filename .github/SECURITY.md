# Security policy

## Supported versions

| Version | Supported |
| --- | --- |
| 0.1.x | Yes |

## What antiagree is

antiagree is a single Claude skill: Markdown instructions, with no hooks, no MCP servers, no scripts that run on install, and no network code of its own. Its attack surface is what the instructions ask Claude to do: read files in your project, write `ANTIAGREE.md` when you agree, and ask to run web searches.

## Reporting a vulnerability

Report privately through GitHub: open the repository's **Security** tab and select **Report a vulnerability**. Please don't open a public issue for a security problem.

Useful reports include:

- instructions in `SKILL.md` that lead Claude to read, write or send something the README and the privacy policy don't disclose;
- a way for content in a reviewed file or web result to make the skill act against the user;
- anything in the repository that runs code on install or at load time.

Include the version, the agent and model you used, the prompt, and what happened.

## What to expect

You'll get a reply once the report has been read. Confirmed problems are fixed in a new release, and the report is credited unless you'd rather stay anonymous.

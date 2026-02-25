# StatusSwitcher
A simple Discord bot for plural systems, that allows one to register a front switch within the PluralKit API by simply changing an emote in their custom status.

## Setup (in PluralKit)
Add the tag `[status-switch-emote=<EMOTE HERE>]` to the descriptions of the members you want the bot to track.
  - For example: `[status-switch-emote=🥀]`
  - You can hot-reload your member list at any time, by typing `.ssreload` in any channel the bot can read/write to.
  - It has no other commands.

Afterwards, you can set the emote in your custom status, in Discord, to one of the emotes you've set up, and the bot will automatically register a front switch.

The bot will refresh your member list either when it starts up, or when you invoke `.ssreload`. It won't do so automatically.

## Setup (of the program)
Please see `SETUP.md`.

## Limitations/known issues
- "Flicker"
  - When switching from one client to another, sometimes the bot will rapidly register multiple switches.
  - **This is caused by Discord attempting to sync presence updates across clients, and is not something I can do anything about.** The bot simply receives multiple presence update events, and it has no way of knowing which is "real", so it registers multiple switches.
  - Yeah, I have no idea why it works this way either.
  - In the future, I'll attempt to implement an "anti-flicker" mechanism, via waiting for state to settle before performing the update. I don't know how long away that will be.
- Needing to provide your PluralKit token
  - This is so the bot can fetch information from private members. In future, if I find the motivation, I'll add an option to just run with a public system ID (but with the limitation that it will, obviously, not be able to see data from members marked private).

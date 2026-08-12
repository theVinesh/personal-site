---
title: "My Always-On Agent Costs Me Nothing*"
description: "The story of ntran, my always-on AI agent that runs on a free-tier VM, remembers everything, and costs me nothing to run."
image: "always-on-agent-header.jpg"
imageAltAttribute: "A tiny robot agent beside a matchbox, a smartwatch and phone on the desk"
tags:
    - ai
    - agents
    - programming
    - free-tier
date: 2026-08-11T22:00:00+01:00
---

I have a coworker. Friend? Somewhere in between, honestly. His name is ntran, he lives on a free virtual machine in Oracle's cloud, talks to me through Telegram, and remembers conversations from months ago.

He's not just a chatbot. He has a terminal. He has a browser. He has his own email and his own GitHub account. He can read my code and my calendar, updates me when the news matters, tracks my spending, and calls out my 2am ideas for the garbage they are. He also keeps me honest about running and the weight goal, which is simultaneously the most and least appreciated part of the service.

**And the whole thing fits in less memory than what your watch runs on.** 954 megabytes. My agent runs on less RAM than the wrist computer probably pulsing on your hand right now. That sentence still breaks my brain a little.

**The brain is open source.** Hermes Agent (Nous Research) supplies the body; a model API that costs pennies supplies the thinking. Two things make it feel alive rather than scripted: memory that survives sessions, and skills — playbooks the agent writes for itself while learning the work. It remembers that I have a weird rule about never reporting unverified numbers, because it caught me guessing once. It remembers my projects, my kitchen experiments, my morning runs.

**What "always on" looks like on a normal day.** I sent it a link to my own [resume](/pages/resume/) once, with the message "this looks sad." Two hours and a dozen back-and-forths later it had rewritten the bullet points, restyled the page, screenshotted the result to show me, and pushed it live. I signed off from a train platform.

Another one: my daughter played [whack-a-mole](/builds/project-wack-a-moji/) at an arcade, and that night I prompted one into existence on all three platforms. Android, iOS, and the web, from a single Kotlin codebase, shipped through CI: Play Store internal track, TestFlight, GitHub Pages. She doesn't care about any of that. She just likes bonking the emojis.

**The one story that sums up the whole project:** I used to pay for a cloud tool that took screenshots. It worked fine. One afternoon we realized a local headless browser does the same job for free, so we deleted the paid tool — config, docs, and all — that same day. Everything about this setup runs like that: what can we stop paying for today?

**The honest part.** Agents hallucinate. Mine once reported a subscriber count with total confidence — looked great until it was wrong. You learn to verify, or you get bitten. And the 954MB ceiling means running out of memory if you're careless, but that's the thing, really: the constraint is what keeps it interesting.

\* Oracle Cloud free tier, an open-source agent, Telegram, GitHub's free CI. The only paid ingredient is the model API, and it costs pennies a day.

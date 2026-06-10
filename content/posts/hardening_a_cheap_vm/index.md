---
title: "Hardening a Cheap VM: How Not to Get Hacked"
description: "How to secure your budget VPS before putting anything live."
image: "header.jpg"
date: 2026-06-09T21:30:00+01:00
lastmod: 2026-06-09T21:30:00+01:00
categories: ["tech", "security", "linux", "vps"]
imgs: []
cover: ""  # image show on top
readingTime: true  # show reading time after article date
toc: true
comments: false
justify: false  # text-align: justify;
single: false  # display as a single page, hide navigation on bottom, like as about page.
license: ""  # CC License
draft: false
coverRelURL: ""  # abs url of cover
hidedate: false # to hide date
---

Spinning up a cheap VPS to deploy a tiny app or bot is easy. But leaving it on defaults is basically inviting some random botnet to hijack your CPU for crypto mining.

Here is the quick checklist I use to lock down my servers before putting anything live.

## 1. Ditch the Passwords (SSH Keys Only)

First things first, passwords have to go. Automated bots are constantly brute-forcing default ports with millions of common passwords. SSH keys are the only way to go.

Generate a key pair on your local machine if you haven't:
```bash
ssh-keygen -t ed25519 -C "your_email@domain.com"
```

Once you've copied your public key to the server (`~/.ssh/authorized_keys`), open up the ssh config:
```bash
sudo nano /etc/ssh/sshd_config
```

Find these lines and set them:
```text
PasswordAuthentication no
PubkeyAuthentication yes
```

> **Tip:** Before restarting ssh, keep your current terminal session open and test logging in from a new terminal window. If you messed up the config, you won't lock yourself out.

Once you've verified it works, restart the service:
```bash
sudo systemctl restart ssh
```

## 2. Kill Root Login

Logging in directly as root is lazy and dangerous. You want to log in as a normal user with sudo privileges, and completely disable direct root login.

In that same `/etc/ssh/sshd_config` file, find `PermitRootLogin` and turn it off:
```text
PermitRootLogin no
```

Save, test, and restart SSH. Now anyone trying to force their way in has to guess your username and your ssh key.

## 3. Install Fail2ban

Fail2ban is like a digital bouncer. It watches your system logs for repeated failed login attempts from the same IP, and dynamically blocks them using your firewall.

On Ubuntu/Debian, it's a quick install:
```bash
sudo apt update
sudo apt install fail2ban
```

The default jail settings are usually fine, but you can copy the jail config and tweak it:
```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo systemctl restart fail2ban
```

Now, when a bot spams your server with SSH attempts, it gets blocked after a few tries. Your log files will thank you.

## 4. Firewalls & Killing Unused Services

Don't leave doors open if you aren't using them. `ufw` (Uncomplicated Firewall) makes this stupidly simple on Ubuntu.

Default to blocking all incoming traffic except SSH:
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
```

Also, audit what's actually running and listening on your ports:
```bash
sudo ss -tulnp
```
If you see some default service running that you don't need, purge it. Less surface area means fewer headaches.

## 5. Automatic, Unattended Updates

Security updates come out constantly, and you are going to forget to log in and run `apt upgrade` every week. Let the system do it for you.

Install the `unattended-upgrades` package:
```bash
sudo apt install unattended-upgrades
```

And configure it to auto-reboot if an update needs it (usually in the middle of the night):
```bash
sudo dpkg-reconfigure -plow unattended-upgrades
```

## 6. The Pro Move: Put It Behind Tailscale

If you want to go full pro, don't even expose SSH to the public internet at all. Put the whole machine behind a Tailscale network or a Cloudflare tunnel.

With Tailscale, you can set your firewall to block all incoming SSH traffic from the public IP, and only allow access over your private WireGuard mesh. It's incredibly easy to set up and means your server is practically invisible to the rest of the web.

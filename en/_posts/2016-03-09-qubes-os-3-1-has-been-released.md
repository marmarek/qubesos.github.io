---
layout: post
title: Qubes OS 3.1 has been released!
author: Joanna Rutkowska
date: 2016-03-09
categories:
  - releases
download_url: /downloads/
redirect_from:
  - /news/2016/03/09/qubes-31/
---

I'm happy to announce that today we're releasing Qubes OS 3.1!

The major new architectural feature of this release has been the introduction of
the [Qubes Management
infrastructure](/news/2015/12/14/mgmt-stack/), which is
based on the popular Salt management software.

In Qubes 3.1, this management stack makes it possible to conveniently control
system-wide Qubes configuration using centralized, declarative statements.
_Declarative_ is the key word here: it makes creating advanced configurations
significantly simpler. (The user or administrator needs only to specify _what_
they want to get, rather than _how_ they want to get it).

This has already allowed us to improve our installation wizard (firstboot) so
that it now offers the user the ability to easily select from various options to
pre-create some useful configurations, such as Whonix or USB-hosting VMs.

![Qubes OS 3.1 Firstboot Screenshot](/attachment/site/qubes-31-firstboot-mgmt.png)

Currently, the management stack is limited to dom0 and system-wide Qubes
configuration (i.e. what VMs should be present, with what properties, how
connected), and notably missing is the ability to configure/manage states
_inside_ the VMs or templates (e.g. what packages are to be installed, or what
additional services are to be enabled in the VMs).

I think most readers will understand very well that marrying powerful and
flexible, yet very complex, management software such as Salt, with a
security-focused system like Qubes OS is an extremely sensitive task. This is
because we really would not like to negate all the isolation we have previously
worked hard to build, obviously.

Yet, we have recently come up with -- what we believe is -- an elegant way to
also extend our management stack to cover VMs' internal states. In fact, we
already have working code for this and plan on introducing this feature
officially in the upcoming Qubes 4.0 release candidate. We might also decide to
bring it to the 3.1 release (as an optional update), in case we can't release
4.0-rc1 soon enough.

Once we introduce this missing piece of the Qubes management infrastructure, we
will gain almost limitless possibilities for shaping Qubes configurations to fit
particular user groups' needs and for delivering them easily.

Besides the management stack, there have been a number of other improvements and
bugfixes introduced in 3.1 compared to Qubes 3.0, and most of these have already
been mentioned in the [original 3.1-rc1 announcement
post](/news/2015/12/08/qubes-OS-3-1-rc1-has-been-released/).
To name here just two which might be of critical importance to some users
(as they significantly improve hardware compatibility): Qubes 3.1 now supports
UEFI-based boot, as well as many new GPUs, thanks to the updated drivers and
kernel in Dom0.

The ISO can be downloaded [here](/downloads/). As usual, we encourage people to
verify the integrity of the downloaded images as explained
[here](/doc/verifying-signatures/).

Existing users of the 3.0 and 3.1-rcX can upgrade using [these instructions](https://www.qubes-os.org/doc/upgrade-to-r3.1/). Enjoy!

---
layout: doc
title: Certified Hardware
permalink: /doc/certified-hardware/
redirect_from:
 - /doc/hardware/
 - /doc/certified-laptops/
 - /hardware-certification/
---

# Certified Hardware #

## Important Information ##
There is currently **no** specific hardware (e.g., specific laptop model) that the Qubes team recommends for individual users.
However, we're working hard to make a "reasonably secure laptop" a reality, and we look forward to sharing more information about this when the time is right.
(Note that this will be distinct from a [stateless laptop], which no one has implemented yet.)
In the meantime, users are encouraged to make use of the [Hardware Compatibility List] and [System Requirements] as sources of information in making hardware selection decisions.
Serious prospective business customers should [contact us] for more information.

## Hardware Certification ##

### Become Hardware Certified ###
If you are a hardware vendor, you can have your hardware certified as compatible with Qubes OS.
The benefits of hardware certification include:

* Your customers can purchase with confidence, knowing that they can take full advantage of Qubes OS on your hardware.
* Your hardware will continue to be compatible with Qubes OS as it further develops.
* You can support the development of Qubes OS.

### Hardware Certification Requirements ###
(Please note that these are the requirements for hardware *certification*, *not* the requirements for *running* Qubes 4.x.
For the latter, please see the [system requirements for Qubes 4.x].)

One of the most important security improvements introduced with the release of Qubes 4.0 was to replace paravirtualization (PV) technology with **hardware-enforced memory virtualization**, which recent processors have made possible thanks to so-called Second Level Address Translation ([SLAT]), also known as [EPT][EPT-enabled CPUs] in Intel parlance.
SLAT (EPT) is an extension to Intel VT-x virtualization, which originally was capable of only CPU virtualization but not memory virtualization and hence required a complex Shadow Page Tables approach.
We hope that embracing SLAT-based memory virtualization will allow us to prevent disastrous security bugs, such as the infamous [XSA-148], which --- unlike many other major Xen bugs --- regrettably did [affect][QSB 22] Qubes OS.
Consequently, we require SLAT support of all certified hardware beginning with Qubes OS 4.0.

Another important requirement is that Qubes-certified hardware should run only **open-source boot firmware** (aka "the BIOS"), such as [coreboot].
The only exception is the use of (properly authenticated) CPU-vendor-provided blobs for silicon and memory initialization (see [Intel FSP]) as well as other internal operations (see [Intel ME]).
However, we specifically require all code used for and dealing with the System Management Mode (SMM) to be open-source.

While we [recognize][x86_harmful] the potential problems that proprietary CPU-vendor code can cause, we are also pragmatic enough to realize that we need to take smaller steps first, before we can implement even stronger countermeasures such as a [stateless laptop].
A switch to open source boot firmware is one such important step.
To be compatible with Qubes OS, the BIOS must properly expose all the VT-x, VT-d, and SLAT functionality that the underlying hardware offers (and which we require).
Among other things, this implies **proper DMAR ACPI table** construction.

Finally, we require that Qubes-certified hardware does not have any built-in _USB-connected_ microphones (e.g. as part of a USB-connected built-in camera) that cannot be easily physically disabled by the user, e.g. via a convenient mechanical switch.
Thankfully, the majority of laptops on the market that we have seen already satisfy this condition out-of-the-box, because their built-in microphones are typically connected to the internal audio device, which itself is a type of PCIe device.
This is important, because such PCIe audio devices are --- by default --- assigned to Qubes' (trusted) dom0 and exposed through our carefully designed protocol only to select AppVMs when the user explicitly chooses to do so.
The rest of the time, they should be outside the reach of malware.

While we also recommend a physical kill switch on the built-in camera (or, if possible, not to have a built-in camera), we also recognize this isn't a critical requirement, because users who are concerned about it can easily cover it a piece of tape (something that, regrettably, is far less effective on a microphone).

Similarly, we don't consider physical kill switches on Wi-Fi and Bluetooth devices to be mandatory.
Users who plan on using Qubes in an air-gap scenario would do best if they manually remove all such devices persistently (as well as the builtin [speakers][audio_modem]!), rather than rely on easy-to-flip-by-mistake switches, while others should benefit from the Qubes default sandboxing of all networking devices in dedicated VMs.

We hope these hardware requirements will encourage the development of more secure and trustworthy devices.

### Hardware Certification Process ###
To have hardware certified, the vendor must:

1. Send the Qubes team two (2) units for testing (non-returnable) for each configuration the vendor wishes to be offering.
2. Offer to customers the very same configuration (same motherboard, same screen, same BIOS version, same Wi-Fi module, etc.) for at least one year.
3. Pay the Qubes team a flat monthly rate, to be agreed upon between the hardware vendor and the Qubes team.

It is the vendor's responsibility to ensure the hardware they wish to have certified can run Qubes OS, at the very least the latest stable version.
This could be done by consulting the [Hardware Compatibility List] or trying to install it themselves before shipping any units to us.
While we are willing to troubleshoot simple issues, we will need to charge a consulting fee for more in-depth work.

If you are interested in having your hardware certified, please [contact us].

## Qubes-certified Laptops ##
Qubes-certified laptops are regularly tested by the Qubes developers to ensure compatibility with all of Qubes' features.
The developers test all new major versions and updates to ensure that no regressions are introduced.
Unfortunately, there are currently no certified laptops for Qubes R3.x or R4.x.
This page will be updated once certified laptops are available.
For more general information about choosing hardware for Qubes, please see the [System Requirements] and the [Hardware Compatibility List].

We aim to partner with a select few computer vendors to ensure that Qubes users have reliable hardware purchasing options.
We aim for these vendors to be as diverse as possible in terms of geography, cost, and availability.
Note, however, that we certify only that a particular hardware *configuration* is *supported* by Qubes.
We take no responsibility for our partners' manufacturing or shipping processes, nor can we control whether physical hardware is modified (whether maliciously or otherwise) *en route* to the user.

To learn more about the certification process, or if you're interested in having your company's hardware certified, please see the [Hardware Certification] section.


[stateless laptop]: https://blog.invisiblethings.org/2015/12/23/state_harmful.html
[System Requirements]: /doc/system-requirements/
[Hardware Compatibility List]: /hcl/
[Hardware Certification]: #hardware-certification
[system requirements for Qubes 4.x]: /doc/system-requirements/#qubes-release-4x
[contact us]: mailto:business@qubes-os.org
[SLAT]: https://en.wikipedia.org/wiki/Second_Level_Address_Translation
[EPT-enabled CPUs]: https://ark.intel.com/Search/FeatureFilter?productType=processors&ExtendedPageTables=true&MarketSegment=Mobile
[XSA-148]: https://xenbits.xen.org/xsa/advisory-148.html
[QSB 22]: https://github.com/QubesOS/qubes-secpack/blob/master/QSBs/qsb-022-2015.txt
[pvh_ticket]: https://github.com/QubesOS/qubes-issues/issues/2185
[coreboot]: https://www.coreboot.org/
[Intel FSP]: https://firmware.intel.com/learn/fsp/about-intel-fsp
[Intel ME]: https://www.apress.com/9781430265719
[x86_harmful]: https://blog.invisiblethings.org/papers/2015/x86_harmful.pdf
[stateless laptop]: https://blog.invisiblethings.org/papers/2015/state_harmful.pdf
[audio_modem]: https://github.com/romanz/amodem/


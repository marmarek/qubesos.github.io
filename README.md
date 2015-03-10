# https://www.qubes-os.org

# Website repositoriy

This repository consists of a jekyll site and several git submodules 
for content:

- qubes-attachment (~32 MB)
- qubes-author (information about our developers)
- qubes-hcl (hcl reports generated by a YAML version of qubes-hcl-report)
- qubes-posts (News from different submodules)
- qubes-wiki (trac2gitsync)

Use `git clone --recursive` to check out submodules, too.

# Running jekyll on your localhost

Run `jekyll s -V --trace (--skip-initial)`.


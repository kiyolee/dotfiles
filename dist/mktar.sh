#!/bin/sh
#
# mktar.sh
#

script_root=`dirname "$0"`
dotfiles_root="${script_root}/.."

( cd "${dotfiles_root}"; git ls-files ) |
grep -v 'dotfiles\.txz' - |
tar cvJf "${script_root}/dotfiles.txz" -C "${dotfiles_root}" --numeric-owner -T -

# vim:sts=2:sw=2:ts=8:et:syntax=sh

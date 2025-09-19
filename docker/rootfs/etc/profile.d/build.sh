# https://lilac.readthedocs.io/en/latest/setup.html#configure-other-parts
NPROC="$(nproc)"
export MAKEFLAGS="-j$NPROC"
unset NPROC

# if groups | grep -q "\<pkg\>"; then
#   export PACKAGER="$USER <$USER@example.org>"
# fi

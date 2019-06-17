PROFILE=~/.profile
if [ -f "$PROFILE" ]; then
	emulate sh
	. $PROFILE
	emulate zsh
fi

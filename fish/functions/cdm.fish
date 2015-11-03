function cdm
	set location (mpc -f "%file%" | head -n 1 | cut -d / -f -2)
	cd "$HOME/media/music/$location"
end

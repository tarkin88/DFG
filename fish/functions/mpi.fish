function mpi
	mpv --vo=opengl:dither-depth=no:scale=ewa_lanczossharp:cscale=ewa_lanczossoft:dscale=ewa_lanczos:scaler-resizes-only --no-audio --no-resume-playback --load-scripts=no --no-sub --pause --loop=inf --panscan=1.0 --autofit-larger=100%x100% --force-window-position --reset-on-next-file=all --input-conf=/home/onodera/.mpv/bindings_mpi $argv
end

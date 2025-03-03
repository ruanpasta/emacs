#!/bin/sh

# NOTE: This is only for the live demo, not needed for your configuration!
# spice-vdagent

# Set the screen DPI (uncomment this if needed!)
# xrdb ~/.emacs.d/exwm/Xresources

# Run the screen compositor
compton &

# Enable screen locking on suspend
xss-lock -- slock &

# Fire it up
exec dbus-launch --exit-with-session emacs -mm --debug-init -l ~/.emacs.d/desktop.el

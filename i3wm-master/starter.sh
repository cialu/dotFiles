#! /bin/sh
#
# A starter launcher - cialu©2017
#
#

echo "..."
echo "...starter launcher is working"
echo "..."

nohup nm-applet &
nohup thunderbird & disown &
nohup /opt/Telegram/Telegram & disown &
nohup firefox & disown & exit 0

# to replace xfce wm with herbstluftwm
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xfsettingsd
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -sa herbstluftwm

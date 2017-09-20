#!/usr/bin/python3

#Trying the GTK3 binding 
#hw.py
 
from gi.repository import Gtk
 
class MyWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title = "Hello World!")
        self.button = Gtk.Button(label = "Click Here")
        self.button.connect("clicked", self.on_button_clicked)
        self.add(self.button)
    def on_button_clicked(self, widget):
        print('Hello World!')
 
win = MyWindow()
win.connect('delete_event', Gtk.main_quit)
win.show_all()
Gtk.main()

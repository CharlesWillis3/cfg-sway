# backlight fix

* /etc/default/grub (GRUB_CMDLINE_LINUX_DEFAULT): acpi_osi=Linux acpi_backlight=vendor

# bootsplash-theme

* Append bootsplash-theme-manjaro-glitch hook in the end of HOOKS string of /etc/mkinitcpio.conf

* Add bootsplash.bootfile=bootsplash-themes/manjaro-glitch/bootsplash into GRUB_CMDLINE_LINUX string of /etc/default/grub

* Run sudo mkinitcpio -P && sudo update-grub to update initial ram disk and grub configuration



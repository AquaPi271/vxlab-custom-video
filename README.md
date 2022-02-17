# vxlab-custom-video

## Steps to Build the FPGA

1. Find a base directory and clone this repository:  `git clone https://github.com/AquaPi271/vxlab-custom-video.git`
2. Start Vivado 2018.2.
3. From the main window select _Tools -> Run Tcl Script_.
4. Navigate to the cloned directory created in step 1 and select _vxlab-custom-video.tcl_.
5. Vivado should generate the block diagram, load IP, and ready the hierarchy.
6. From the _Project Manager_ pane on the left side, select _Run Synthesis_.  Hit _OK_ on the popup.  This step may take several minutes.
7. When the Synthesis completes, a new window should pop-up.  Select _Run Implementation_.  If you closed the windows simply go to the _Project Manager_ pane on the left and selection _Run Implementation_.  This step will take several minutes.
8. Similar to the last step, a new window should pop-up.  Select _Generate Bitstream_.  And as before, if you closed the window then select _Generate Bitstream_ from the _Project Manager_ pane.
9. Close the remaining window when done.  The design should now have a bitstream which can be used to program the device.

## Steps to Compile the Microblaze Program from a New C-based Workspace.

1. Select _File -> Export -> Export Hardware_.
2. In the window that pops up

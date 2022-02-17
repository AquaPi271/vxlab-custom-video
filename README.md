# vxlab-custom-video

This is the original Nexys-HDMI-Video program from Digilent.  It's being modified to explore custom graphics / video hardware over HDMI.

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

This steps assumes the above steps to build the FPGA have been completed.

1. Select _File -> Export -> Export Hardware_.
2. In the window that pops up, check the _Include Bitstream_ box and _Export to:_ \<Local to Project\>.
3. Then select _File -> Launch SDK_.  Keep the export and workspace locations local to the project (for now).
4. As an aside, note that the Microblaze Address Map has abc_display_ip_0 mapped to 0x44a40000 to 0x44a4ffff on an AXI.  This peripheral was generated, by hand, in the hardware.  More on this later.
5. From the SDK window select, _File -> New -> Application Project_.
6. Fill in the fields, _Project Name_: vxlabs-custom-video-software (or whatever name you want), _Use default location_ is checked, _OS Platform_: standalone, _Hardware Platform_: hdmi_wrapper_hw_platform_0, _Processor_: microblaze_0, _Target Software Language_: C, _Board Support Package_:  Create New selected wtih vxlabs-custom-video-software_bsp.
7. Click _Next_ at the bottom and select _Empty Application_ from the available templates list and click _Finish_.
8. From the _Project Explorer_ pane in the SDK expand _vxlab-custom-video-software_, right click _src_, and select _Import_.
9. In the new window select _General -> File System_ and hit _Next_.
10. The directory should be the _appsrc_ location of this repository.  In other words, wherever you cloned this repo, go to the root directory and select _appsrc_.
11. Check the box next to _appsrc_ and hit _Finish_.
12. Connect the board to the computer and then connect to the board via the terminal application.
13. In the SDK window select _Xilinx -> Program FPGA_.
14. Finally, in the _Project Explorer_ pane, right click on _vxlab-custom-video-software_, and select _Run As -> Launch on Hardware (System Debugger)_.

I changed Nexys original menu items 7 and 8.  Selecting 7 will apply a mask of 0x00FF0000 to the RGB channels (there upper 8 bits are unused).  This setting will block the entire R channel and only allow GB through.  Selectiong 8 will restore.  Unlike the original demo, this mask is applied 'on-the-fly' instead of DMAing video to memory.  Hence, it is real-time capable.

TODO:  Show steps of how to add IP as a peripheral.
TODO:  Show how to add and AXI slave for a particular memory.
TODO:  Show how to connect AXI slave to the peripheral.
TODO:  Show how to program the new memory mapped setting in the C program.
TODO:  Write up 'write_project_tcl' program.

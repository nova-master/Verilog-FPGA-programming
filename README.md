# Verilog-FPGA-programming

Tool setup(VIVADO)
I am using Vivado 2019.1 version .
You can download this software(free) from the Xilinx Download page.  [       http://www.xilinx.com/support/download.html      ]
 On the left-hand side, click on the "Vivado Archive" option and then select version 2019.1.
 Next, locate the "Vivado Design Suite - HLx Editions - 2019.1 Full Product Installation" 
 scroll down until you find the "Vivado HLx 2019.1: WebPACK and Editions - Windows Self Extracting Web Installer (EXE - 64.62 MB)" option.
 Finally, click on this option to initiate the download.
 Create an account with AMD. 
 After obtaining your password, log in to your AMD account and navigate back to the Xilinx Download page to access the item you wish to download.
 run Xilinx_Vivado_SDK_Web_2019.1_0524_1430_Win64.exe
 Enter AMD credentials and select install type (don't install the Full Image ) click download and install for speed up 
 chhose Vivado HL WebPACK.
 select a name for the installation directory and ensure that it is located at the top level of your C: drive and  Avoid using spaces. 
Follow the prompts and instructions provided by the installer to complete the installation process. 
This is goining to take loooooong time.
There are some More step to do.
Install the Digilent Board files (in my case it is BASYS3 board) from https://reference.digilentinc.com/vivado/installing-vivado/start
Obtaining a free WebPACK License is also necessary. To do so, launch Vivado and navigate to the "Help" menu. From there, select "Obtain a License Key...".
choose the "Get Free ISE WebPACK, ISE/Vivado or PetaLinux Licenses" option. Then, click on "Connect Now" to proceed.
Enter Xilinx credentials if asked.
Next, navigate to the "Create New Licenses" tab and choose "Vivado Design Suite: HL WebPACK 2015 and..." from the list of Certificate Based Licenses. Finally, click on "Generate Node-Locked License" to create the license
In the license generation process, when prompted for the Host ID, choose "ANY" and click "Next".
After completing the license generation process, you will receive an email containing the license file. Please follow the instructions in that email to load the license into Vivado.



finally.......we are done

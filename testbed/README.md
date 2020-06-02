Requirments:

1: VM

2: MININET

3: P4

4: Bmv2 Switch

Installation:

First of all we need to download a virtualbox setup for windows for this follow steps given below:
1: Open the VirtualBox website. Go to https://www.virtualbox.org/ in your computer's Internet browser. 
   This is the website from which you'll download the VirtualBox setup file. 
2: Click Download VirtualBox. It's a blue button in the middle of the page. Doing so will open the downloads page.
3: Click Windows hosts. You'll see this link below the "VirtualBox 5.2.8 platform packages" heading. 
   The VirtualBox EXE file will begin downloading onto your computer. 
4: Open the VirtualBox EXE file. Go to the location to which the EXE file downloaded and double-click the file. 
   Doing so will open the VirtualBox installation window.
5:  Navigate through the installation prompts. Do the following:
    Click Next on the first three pages.
    Click Yes when prompted.
    Click Install
    Click Yes when prompted.
6: Click Install when prompted. Doing so will allow VirtualBox to begin installing on your computer

After completing the installation process of virtualbox now we have to install mininet. Follow thsese step to install mininet:
This option works well for local VM, remote EC2, and native installation. It assumes the starting point of a fresh Ubuntu (or, experimentally, Fedora) installation. 
(If you are upgrading from an older Mininet and/or OVS, see notes on removing old versions, below.)

We strongly recommend more recent Ubuntu releases, because they support newer versions of Open vSwitch. 

To install natively from source, first you need to get the source code:

git clone git://github.com/mininet/mininet

Note that the above git command will check out the latest and greatest Mininet (which we recommend!) If you want to run the last tagged/released version of Mininet - or any other version - you may check that version out explicitly:

cd mininet
git tag  # list available versions
git checkout -b 2.2.1 2.2.1  # or whatever version you wish to install
cd ..

Once you have the source tree, the command to install Mininet is:

mininet/util/install.sh [options]

Typical install.sh options include:

    -a: install everything that is included in the Mininet VM, including dependencies like Open vSwitch as well the additions like the OpenFlow wireshark dissector and POX. By default these tools will be built in directories created in your home directory.
    -nfv: install Mininet, the OpenFlow reference switch, and Open vSwitch
    -s mydir: use this option before other options to place source/build trees in a specified directory rather than in your home directory.

So, you will probably wish to use one (and only one) of the following commands:

To install everything (using your home directory): install.sh -a
To install everything (using another directory for build): install.sh -s mydir -a
To install Mininet + user switch + OVS (using your home dir): install.sh -nfv
To install Mininet + user switch + OVS (using another dir:) install.sh -s mydir -nfv

You can find out about other useful options (e.g. installing the OpenFlow wireshark dissector, if it’s not already included in your version of wireshark) using

install.sh -h

After the installation has completed, test the basic Mininet functionality:

sudo mn --test pingall

When you have done with Mininet-installation now you have install p4 on that mininet setup by follwing these steps:



1: Download P4 Tutorial 2018-03-05.ova (https://drive.google.com/file/d/1ACkpD66zoBJHCX2K50OO8-pssJGZhzMr/view)

2: Import the virtual machine into VirtualBox. Open VirtualBox, select “File > Import Appliance”, and navigate to the downloaded file.

3: Boot virtual machine. Select “P4 Tutorial 2018-03-05”, and click “Start”.

4: Create a fork of the p4-mininet-tutorials repository.

5: Clone your forked repository into p4 user’s home directory on the VM and work from within your clone, not the tutorials folder preinstalled on the VM.


Exection of Code for reproducibility:

Before that, let's compile the basic.p4 and bring up a switch in Mininet to test its behavior.

1: In your shell, run:

    make run

2: This will:
        compile basic.p4, and
        start a Mininet instance with one switches (s1) which is connected to one host (h1) and one one Server(server1).
        The assigned IPs are 10.0.11.1/24, 10.0.12.1/2, 10.0.12.2/24 and 10.0.11.3/24.

3: You should now see a Mininet command prompt. Open two terminals for h1 and Server1, respectively:

    mininet> xterm h1 Server1

4:  Each host includes a small Python-based messaging client and server. In h1 xterm:

    ./send.py

5:  In h1's xterm, send a message to Server1:

    ./send.py 10.0.12.2/24 "P4 is cool"
6: In Server1 xterm:
       ./receive.py

7:    In Server1 xterm, receive a message from h1:

    ./receive.py 10.0.12.2/24 "P4 is cool"

8:    Type exit to leave each xterm and the Mininet command line. Then, to stop mininet:

    make stop

9:    And to delete all pcaps, build files, and logs:

    make clean

10: [Add following code with above code:](https://github.com/Meerkhan12/Reproducible-research/tree/master/src) 


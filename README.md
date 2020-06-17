# A Novel Active Queue Management Scheme for Programmable Data Planes using P4

## Abstract:
For supporting different applications requirements the network programmability brings flexibility, agility and rapid
introduction of new capabilities. Significant benefits like Quality of Service QoS can be achieved by using programmable traffic management at data plane. To achieve the QoS in Term of minimum queuing delay we used the P4 which is a domain
specific language for programming network switches. we implement our novel active queue management (NAQM) scheme by
manipulating the bits at data plane and we can see in results that our proposed scheme is better in term of less less queuing
delay.


## Requirments:

-Virtual Box

-Mininet
 
-P4
 
-Scapy
 
-Bmv2 Switch

## Folder Description:

Data: In this folder data available used for Graphs.

Deliver: Executeable file of Jupyter notebook

Figures: The figures used in paper like system setup, Graph etc.

Src: Source code is available in this folder.


## For Reproducing the paper:

**Note: For making the reproducibility of this work easy and less time taking follow the steps which includes prepared image of of VM. You only follow the given instruction and you can easily perform experiments and get the results.**

1: Install the Virtual box

2: Install our VM   (password: rocks)

3: After the installation of VM now you should follow these steps:

A: Open terminal go to directory p4@p4:~/tutorials/exercises/NAQM

B: Then give the command:

        make run
        
C: A topology will be made and you can check different things like topology, connectivity just use these commands:
        Topology: net
        
        Connectivity: h1 ping h2    (use control + c to stop the ping)
        
D: Now for reproducing our work you use these commands:
         
         xterm h1 h2 (you will see two command line windows for h1 and h2 host)
         
E: In h2 commandline window use the command

          iperf -s

F: In h1 commandline window use the command
          
          iperf -c 10.0.2.2 -t 250
          
G: On the same time open another two terminals and in one terminal run this command for caputuring packets from interface 2 of switch:
         
         sudo tcpdump -i s1-eth2 -w -c 250 -w interface2.pcap
         
H: In second terminal run this command for caputring packets from interface 1 of switch.
          
          sudo tcpdump -i s1-eth1 -w -c 250 -w interface1.pcap
          
**Note: Now you will see two pcaps file in your Directory NAQM and open these file goto Ip header and you can see the queuing delay.**

**Now use the exit and you will go back to p4@p4:~/tutorials/exercises/NAQM. Use this command sudo mn -c to stop the operation.**


Now you should go directory Open terminal go to directory p4@p4:~/tutorials/exercises/Taildrop and follow the same steps which are mentioned above for existing  taildrop scheme for comparing the performance.


## Distribution:
VM 

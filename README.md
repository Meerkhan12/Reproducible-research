# A Novel Active Queue Management Scheme for Programmable Data Planes using P4

## Abstract:
For supporting different applications requirements the network programmability brings flexibility, agility and rapid
introduction of new capabilities. Significant benefits like Quality of Service QoS can be achieved by using programmable traffic management at data plane. To achieve the QoS in Term of minimum queuing delay we used the P4 which is a domain
specific language for programming network switches. we implement our novel active queue management (NAQM) scheme by
manipulating the bits at data plane and we can see in results that our proposed scheme is better in term of less less queuing
delay.

[Paper Pdf](https://github.com/Meerkhan12/Reproducible-research/blob/master/deliver/A%20novel%20queue%20management%20scheme%20for%20programmable%20data%20plane%20using%20p4.pdf)

[Executable paper](https://github.com/Meerkhan12/Reproducible-research/blob/master/deliver/draft3.ipynb)



## Requirments:

Virtual Box

Mininet
 
P4
 
Scapy
 
Bmv2 Switch


## Workflow

![alt text](https://github.com/Meerkhan12/Reproducible-research/blob/master/figures/flowchart.jpg)


## Folder Description:

* /Data: In this folder dataset available used for Graphs.

* /Deliver: Executeable file of Jupyter notebook and graph file used to build graph

* /Figures: The figures used in paper like system setup, Graph etc.

* /Src: Source code used to build testbed in mininet is available in this folder.

## Reproducibility of Work:

There are two methods to reproduce this paper:

* In first method this work can be reproduced by installing VM and running the experiments. After running the experiments you have collect the dataset and then you  have to refine dataset for making graph.
  
* Second method for reproducibility is to reproduce in Jupyter notebook and already dataset available for graphs.

## Reproducing the paper by using First method:

**Note: This method is time taking and it can take more than 8 hours. You have to run experiments and then you have to collect the output file from the experiments.  From output file you can collect dataset manually by analyzing one by one packet. you also need 8 GB RAM and 50 GB space for VM**

1: Install the Virtual box

2: [Install our VM   (password: rocks)](https://drive.google.com/file/d/1HqoyLWxjMNyU8fcoCtU9R2oT3fzOZMUd/view)

3: Make sure you used 8GB RAM because for getting 30Mb bandwidth our RAM should be of 8Gb.

4: After the installation of VM now you should follow these steps:

A: Open terminal go to directory p4@p4:~/tutorials/exercises/NAQM

B: Then give the command:

        make run
        
C: A topology will be made and you can check different things like topology, connectivity just use these commands:
                      
        
        h1 ping h2    (use control + c to stop the ping)
        
D: Now for reproducing our work you use these commands:
         
         xterm h1 h2 (you will see two command line windows for h1 and h2 host)
         
E: In h2 commandline window use the command

          iperf -s

F: In h1 commandline window use the command
          
          iperf -c 10.0.2.2 -t 250
          
G: On the same time open another two terminals and in one terminal run this command for caputuring packets from interface 2 of switch:
         
         sudo tcpdump -i s1-eth2 -c 1000 -w interface2.pcap
         
H: In second terminal run this command for caputring packets from interface 1 of switch.
          
          sudo tcpdump -i s1-eth1 -c 1000 -w interface1.pcap
          

Now use the **exit** command and you will go back to p4@p4:~/tutorials/exercises/NAQM. Use this command **sudo mn -c** to stop the operation.

**Note:** Now you will see two pcaps (Interface2.PCAP and Interface1.PCAP) file in your Directory NAQM and open these file goto Ip header and you can see the queuing  delay in identification portion of each packet. All above experiment is run with 8Gb ram for getting 30 Mbs bandwidth. As you can see in paper we used two bandwidth for our experiments one 30 Mbs and one 10 Mbs. For getting the 10 Mbs bandwidth you have to change RAM limit to 4Gb in your VM and repeat all above mentioned process with 4 Gb RAM.


**Now you should go Taildrop directory. Open terminal go to directory p4@p4:~/tutorials/exercises/Taildrop and follow the same steps which are mentioned above for existing  taildrop scheme for comparing the performance with our scheme.**

## Reproducing the paper by using Second method:
 **Note: If you are unable to run the whole experiments and collect the data mentioned in first method then use this method.**
#### Before attempting to reproduce the work by this method, note the specifications used:
* Programming Language: [Python 3.6.5](https://www.python.org/downloads/release/python-365/)
* Graphic library: [Matplotlib](https://matplotlib.org/)
* Documentation: [Jupyter Notebook](https://jupyter.org/)

The installation of the Python version is easily found on the website mentioned. If you have chosen to reproduce the work "manually", you must first check if your "pip install" is up to date, with the command:
  

 ```
  python -m pip install --upgrade pip
``` 
After updating the "pip install", you must restart the terminal, closing and opening it again. To start installing the libraries, go to the terminal and use the installation commands below:

 ```
  
  pip install matplotlib
``` 


The installation of the jupyter notebook it is possible to find the instructions on the website or follow the steps below. It will be important for viewing and executing the reproducibility document.

```
pip install jupyterlab
pip install notebook

``` 

#### The executable paper is located in the "devliver" folder. To run the experiment, follow the steps:

  * Have correctly performed all the installations previously requested.
  * Clone this repository to your system.
  * Start the Jupyter Notebook from the terminal.
  * Go to the deliver folder and locate the preprocessing file called "draft3.ipynb", and run it.
  * After performing pre-processing, locate the file "graph.ipynb" and run it.
  * The dataset is available in data folder. If you want to manipulate the dataset just open the "1.csv" or "2.csv file" (these files containing dataset collected 
    from our experiments). These files are also linked with "graph.ipynb" file for making graph.
  * Run all the codes inside and find the results in the articles.

**Note:To best performance, clone the entire repository and follow the instructions previously mentioned.**

## Distribution:
[VM Link](https://drive.google.com/file/d/1HqoyLWxjMNyU8fcoCtU9R2oT3fzOZMUd/view)

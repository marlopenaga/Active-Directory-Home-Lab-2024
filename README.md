# Active-Directory-Home-Lab-2024

## Description

Complete step-by-step creation of an Active Directory (AD) Home Lab Environment simulating a simple corporate business network of 100 users. Utilizing PowerShell, Oracle VM Virtualbox, Windows Server 2022, and Windows 10 Enterprise to create a Domain Controller (DC) and a client user (USER) that will emulate an employee's workstation.

## Environments Used
>#### The downloads may take some time

- **Oracle VM VirtualBox**
  - Link: https://www.virtualbox.org/wiki/Downloads
- **Windows Server 2022**
  - Link: https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022
- **Windows 10 Enterprise**
  - Link: https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise

## Hardware Requirement
>#### The lab will utilize 1 CPU core for each virtual machine. I am using 16gbs of RAM. Recommend to have at least 8gbs of RAM for the lab

- *Minimum* : 2 GB on Domain Controller & 2 GB on VMs
- *Recommend* : 4 GB on Domain Controller & 4 GB on VMs

## Network Diagram

![network diagram](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/7eca28ae-6717-4b3f-aafc-c5f59c75eda2)

## Creating a Designated Save Location for the VMS and Files

1. Create a new folder called "**AD LAB**" in a location with the most space. Here I created it in my D: drive

![create a new folder in ur harddrive and name it AD LAB](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/435c25ac-f98a-4b37-b81b-5841b37e41aa)

3. Inside of **AD LAB** create two folders: **AD Lab Files**, **Virtual Machines**

  - **AD Lab Files** is the location where the VirtualBox, Windows Server 2022 ISO, and Windows 10 Enterprise installation files will be located
  - **Virtual Machines** is the location where we will install our VMs later using VirtualBox, which will be discussed later on

![create a new folder](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/2831f8d9-fcdc-47e5-ab5b-c50836b30af7)

## Download Windows 10 Enterprise

1. Go to https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
2. Select "**Download the ISO - Enterprise**"

![select windows 10 iso](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/08f3d2ab-b71f-4141-90ee-7f3a829578ef)

3. Fill in the relevant info or put "n/a" on certain fields

![fill in the necessary info and put na on the business](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/66a87b82-6c92-4e5c-b20e-d1c00018fdbe)

4. Select "**64-bit edition**" link under "**ISO - Enterprise downloads**"

![select 64 bit windows iso](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/9c8df69b-393d-4fb7-9140-37260f2ef246)

5. The download will start and make sure to select "**AD Lab Files**" as your save location. It may take some time.

## Download Windows Server 2022

1. Go to https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022
2. Select "**Download the ISO**"

![download the windows server iso](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/6cc9ad84-2881-4d57-a27a-62272edff41a)

4. Like previously, fill in the relevant info or put "n/a" on certain  fields.

5. Select "**64-bit edition**" link under "**ISO downloads**"

![download the windows server 64 iso](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/8269cd83-cf5c-4e8d-9916-6ff9a3559130)

6. The download will start and make sure to select "**AD Lab Files**" as your save location

## Download Oracle VM VirtualBox & Extension Pack

1. Go to https://www.virtualbox.org/wiki/Downloads
2. Select "**Windows hosts** under the current VirtualBox platform packages and "**All supported platforms**" to also download the extension pack

![download virtual box windows and the extension pack](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c73040b5-ecb8-409f-ad75-f92860ded3f8)

3. Install Oracle VM VirtualBox
  - Open the Installation Setup file from where you downloaded the file (AD Lab)

![open oracle file and setup](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/0ec47daa-70fc-4883-983a-9fffc7e1cf97)

  - Choose the installation location and hit "**Next**"
  - Wait for the VirtualBox to be installed

4. Repeat step 1 from above and do the same procedure for the **Extension Pack** following the installation process

## Open VirtualBox & Create the Domain Controller (DC) Virtual Machine

1. Select "**New**"
2. Create a name, i did "DC" here
3. Folder: is where Virtual Box designates the creation and saves for the Virtual Machine. Select the **Virtual Machines** folder
4. ISO Image: Browse and open the **AD Lab Files** folder then select the **Windows Server ISO** file which is shown below
5. Check "**Skip Unattended Installation**" then hit **Next**

![select new and name it DC and folder select virtual machines and select ur iso for the server](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/630ff49d-da89-454a-8f0d-a5a26746e2ca)

6. Set the hardware specifications **4096 MB (4GB)** and **1 CPU** then hit **Next**
> Above are the preferred specifications but feel free to increase or decrease to 2GB and 1 CPU (All dependent on your current device)

![set server hardware to 4gbs](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/ec09f09e-b17e-46da-a888-429068303a63)

7. Create a virtual hard disk and set disk size to **20GB** then hit **Next**

![put virtual harddisk at 20gb for the server](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/ecf98c9a-9922-42c9-ba66-61d51905434c)

8. Before we boot up the Virtual Machine, first we are going to adjust the setting of the DC VM
9. Select the DC VM->Settings->General->**Advanced tab**. Set **Shared Clipboard** and **Drag'n'Drop** to **Bidirectional**
> This will allow us the ability to Copy/Paste and Drag/Drop things between the computer and VMs.

![dc settings and select bidirectional for both server](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/acd6edb6-1250-4d38-9b6d-f2a552d2e52c)

10. The DC as shown in the Network Diagram will have two Network Interface Cards (NIC) or Network Adapters. One will be access to the internet and the other will serve as the Internal Network
11. Go to **Network** in Settings and make **Adapter 1** attached to **NAT**

![dc network adapter 1 to NAT](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/44aa8f14-c8c7-48fb-8b48-e4967d3a8b31)


12. Select **Adapter 2** and make it attached to **Internal Network** this will be named "**intranet**"
> Feel free to create or customize the names, but for this lab it is going to match the created network diagram

![adapter 2 will be intranet server](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/ae7f579a-1d95-4e2b-ba25-2701135f5a01)

## Install Windows Server 2022

1. Now that we have added the DC VM and configured the settings, start the DC VM by clicking the **Start** button
2. The VM will boot up and select your language and time and select **Next**
3. Choose the **Standard Evaluation (Desktop Experience)** version as this will give us the GUI or normal version of Windows instead of a command line interface
4. Follow the process and choose **Custom** installation

![select custom](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/2cc257e9-cd5d-4e5d-aea2-92d08a8b1acb)

5. Now we are going to partition the drive by selecting **New** and accept the given specifications. Hit **Next** to continue with the installation

![partition the harddrive select new server](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c5fd8fd1-6b46-4c30-a358-6466ef1da216)

6. The installation process will take some time and will encounter some reboots or blackscreens. Make sure not to touch any keys until the installation is complete.

![Dont press any key during this process of boot](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/40fcc93f-c038-4745-9320-528f59243769)

![Windows Server Setting up first boot](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/7d720fdb-ce80-4551-8f6b-20c653bdda5c)

7. Once the installation is complete, you will prompted to create an Administrator password. Because this is a homelab environment we can use a rememberable universal password for the future passwords that will be created in this lab.
> It is also good to create a new text file (.txt) or make a note that will store any logins and passwords that will be used throughout the course of the lab

![Type in a password for the admin DC](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/06c95c88-c1a7-4a40-b931-966f1417b6b6)

8. Now we have successfully booted up our Administrator account and to unlock the login screen, go to **Input**->**Keyboard**->**Insert Ctrl+Alt+Del** of the top taskbar of VirtualBox

![success 1st boot of admin then click this to login](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c7e465d0-e09a-45d8-bb6e-5a9b113c16fb)

9. Then type in the previous set password
10. A lot of windows will begin to pop up during start-up (server manager), we can ignore them for now and close out of them

![after boot itll pop up windows that we can close for now](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/e52f6164-8e54-4056-9e0f-2b2545fdb81f)

11. You may notice some form of input lag of the mouse cursor or keyboard, we are going to fix that by installing the **Guest Additions CD** under **Devices**->**Insert Guest Additions CD Image** make sure to click it

![for comfort were gonna install guest addtions](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/eefa0803-165f-4be7-9205-6ea1528ddc38)

12. Now go to **File(Folder icon)**->**This PC** and select **CD Drive (D:) VirtualBox Guest Additions**

![go to file this pc then install guest addtions](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/e640e219-c492-4a28-8cd4-c365d981334a)

13. Browse and select the **amd64** edition to start the installation and click **Next** for everything

![run the amd64 addtion](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/704fa01e-2e6e-4244-8572-282154e65b87)

14. Once it is finished, check **I want to manually reboot later** and click **Finish**.

![manual reboot later then shutdown and start up the vm again](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/d10050e3-7df2-489a-80ad-2eccd453387c)

15. Now **shut down** the VM and **start up** from the VirtualBox program. You should notice an improvement in the cursor movements

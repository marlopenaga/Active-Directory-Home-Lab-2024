# Active-Directory-Home-Lab-2024

## Description

Complete step-by-step creation of an Active Directory (AD) Home Lab Environment simulating a simple corporate business network of 100 users. Utilizing PowerShell, Oracle VM VirtualBox, Windows Server 2022, and Windows 10 Enterprise to create a Domain Controller (DC) and a client user (USER) that will emulate an employee's workstation.

## Environments Used
>#### The downloads may take some time

- **Oracle VM VirtualBox**
  - Link: https://www.virtualbox.org/wiki/Downloads
- **Windows Server 2022**
  - Link: https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022
- **Windows 10 Enterprise**
  - Link: https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise

## Hardware Requirement
>#### The lab will utilize 1 CPU core for each virtual machine. I am using 16gbs of RAM. Recommend having at least 8gbs of RAM for the lab

- *Minimum*: 2 GB on Domain Controller & 2 GB on VMs
- *Recommend*: 4 GB on Domain Controller & 4 GB on VMs

## Network Diagram

![network diagram](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/7eca28ae-6717-4b3f-aafc-c5f59c75eda2)

## Creating a Designated Save Location for the VMS and Files

1. Create a new folder called "**AD LAB**" in a location with the most space. Here I created it in my D: drive

![create a new folder in ur harddrive and name it AD LAB](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/435c25ac-f98a-4b37-b81b-5841b37e41aa)

3. Inside of **AD LAB** create two folders: **AD Lab Files**, **Virtual Machines**

  - **AD Lab Files** is the location where the VirtualBox, Windows Server 2022 ISO, and Windows 10 Enterprise installation files will be located
  - **Virtual Machines** is the location where we will install our VMs later using VirtualBox, which will be discussed later

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

4. Like previously, fill in the relevant info or put "n/a" on certain fields.

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

9. Select the DC VM -> Settings -> General -> **Advanced tab**. Set **Shared Clipboard** and **Drag'n'Drop** to **Bidirectional**
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

6. The installation process will take some time and will encounter some reboots or black screens. Make sure not to touch any keys until the installation is complete.

![Dont press any key during this process of boot](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/40fcc93f-c038-4745-9320-528f59243769)

![Windows Server Setting up first boot](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/7d720fdb-ce80-4551-8f6b-20c653bdda5c)

7. Once the installation is complete, you will be prompted to create an Administrator password
> Because this is a home lab environment we can use a rememberable universal password for the future passwords that will be created in this lab.
> It is also good to create a new text file (.txt) or make a note that will store any logins and passwords that will be used throughout the course of the lab

![Type in a password for the admin DC](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/06c95c88-c1a7-4a40-b931-966f1417b6b6)

8. Now we have successfully booted up our Administrator account and to unlock the login screen, go to **Input** -> **Keyboard** -> **Insert Ctrl+Alt+Del** of the top taskbar of VirtualBox

![success 1st boot of admin then click this to login](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c7e465d0-e09a-45d8-bb6e-5a9b113c16fb)

9. Then type in the previous set password

10. A lot of windows will begin to pop up during start-up (server manager), we can ignore them for now and close out of them

![after boot itll pop up windows that we can close for now](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/e52f6164-8e54-4056-9e0f-2b2545fdb81f)

11. You may notice some form of input lag of the mouse cursor or keyboard; we are going to fix that by installing the **Guest Additions CD** under **Devices**->**Insert Guest Additions CD Image** make sure to click it

![for comfort were gonna install guest addtions](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/eefa0803-165f-4be7-9205-6ea1528ddc38)

12. Now go to **File (Folder icon)** -> **This PC** and select **CD Drive (D:) VirtualBox Guest Additions**

![go to file this pc then install guest addtions](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/e640e219-c492-4a28-8cd4-c365d981334a)

13. Browse and select the **amd64** edition to start the installation and click **Next** for everything

![run the amd64 addtion](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/704fa01e-2e6e-4244-8572-282154e65b87)

14. Once it is finished, check **I want to manually reboot later** and click **Finish**.

![manual reboot later then shutdown and start up the vm again](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/d10050e3-7df2-489a-80ad-2eccd453387c)

15. Now **shut down** the VM and **start it up** again from the VirtualBox program. You should notice an improvement in the cursor movements

## Assign IP Addresses of the NICs

1. From the home screen click the **network icon** in the bottom right and select the current network

![set up our ip for internal network click icon and network](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c5d9fa3c-b4b5-486f-8ae5-05a31074b89e)

2. There should be two NICs: one connected to the internet (NAT) and the other is the Internal NIC

![ethernets and know which one is the internet-internal](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/0b8608cc-b201-42e8-9844-078f6c561146)

3. Right-click on one of the NICs and select **Status**->**Details**
- The NIC without an **IPv4 Default Gateway**, **DNS Server**, **WINS Server** is our **Internal NIC**

![how to find the internal NIC from details](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/93e862d4-bb85-4863-a451-ca03c97388c9)

4. Now that we have recognized the **Internal NIC**, right-click and **rename** the NIC to **INTERNAL NIC**

5. Do the same for the NIC and rename it to **INTERNET NIC**

![two NICs](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/2d786c9f-ee26-42f0-bd9c-70d2863c003b)

6. We are going to configure and assign an IP address to the **INTERNAL NIC**. As the INTERNET INC will be assigned an IP address through DHCP

7. Right-click->select **Properties**->**Select Internet Protocol Version 4 (TCP/IPv4)**. We're going to assign the follow address
- **IP address: 172.16.0.1**
- **Subnet mask: 255.255.255.0**
- **Default gateway: empty**
- **Preferred DNS server: 127.0.0.1**
  - This is a loopback address, where the DC will serve as its own DNS, as well as the DNS of the USER VM that will be connected to the DC
- Then select **OK** to the changes

![assigning ip address to INTERNAL NIC](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/e99a0ed1-489d-4f70-a115-f39693a0944e)

## Rename the current VM to **DC**

1. Right-click the Windows Start icon -> **System**

2. In the **About** tab, select the button **Rename this PC**

3. Rename the PC to **DC**
> Now the PC name will match with the Network Diagram

![Rename PC to DC](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/32b491cd-5db0-4e80-8036-358f1a67a9f3)

## Installing the Active Directory and Domain Services (AD DS)
> This will allow us to manage users, passwords, access management of files on a network. Keeping assets secured and protected while maintaining business continuity

1. Open **Server Manager** (Windows start icon -> Server Manager should be on the start menu)

2. Select **Add roles and features**

![open server manager and click add roles](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/7b942dab-c25a-4ae5-aebb-3d007ca21689)

3. Click **Next** and make sure the server **DC** is selected

![click next-rolebased-select our server](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/9d75b872-34bb-4d13-8b68-7efb82ae319b)

4. Now select **Active Directory Domain Services** and add the features

![select active doman services](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/6eb863fc-d22d-43f4-91f0-1e30621d1566)

5. Continue to press **Next** then the **AD DS** will start to install

![hit next then install](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/8e1a7a8b-ce68-4cb4-989a-5f85fbfed96b)

6. Once the AD DS is installed. Go back to the **Server Manager Dashboard**. At the top-right there will be a **flag with a notification icon**.

7. Click on it and select **Promote this server to a domain controller**.

![select the flag and click the option to create our domain](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/4c2b6808-db6a-431f-a7ef-241a24eda8d3)

8. Here we are prompted to create a new domain. Select **Add a new forest** then type in a custom domain. For the lab I will be using **virtualdomain.com**. Select **Next**

![create our domain](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/ea4a5a55-8087-4886-92f7-939e1b161645)

9. Set a password for the Directory Services Restore Mode (DSRM). This is a home lab environment where we can just make it an easy universal password we have been using. Be sure to note down every log in and password separately

![use our same password for the admin](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/382580ae-9de1-4a75-9db5-33e33b25a5f1)

10. Following the installation process, click **Next** on all to start the installation. Afterwards the DC will **restart**.

11. Upon reboot, we now see the log in of our **domain name\Administrator**

12. Log in with the previously set password

![once it reboots we see our domain added to the admin](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/30949d85-eba7-43db-b4ab-ab760c3cfc51)

## Creating a Dedicated Admin Account for the New DC

1. Click the **Windows Start** icon -> select **Active Directory Users and Computers**

![going to add a new admin](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/21192b51-620b-451e-a50b-0eb10b5aa1db)

2. Hover over your new domain name and **right-click it -> New -> Select Organizational Unit (OU)**
> This is where we will add our Admin account

![going to add a OU for the admin](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/4b3084c0-26ab-4c11-8e8e-b5a97987ce2d)

3. Give our new OU a new, here I am going to call it **ADMINS**

![name the OU ADMINS](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/1c2dff40-384e-41e8-991d-a4394e63df52)

4. Once we have created it, right-click **ADMINS** -> **New** -> **User**

![inside ADMINS create new user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/195bf69a-cb11-4b3e-a6c7-e760bf4affd7)

5. Here we can fill out the credentials
- For **User logon name** it is good to create a standard naming convention for organization and structure in a real-world environment
- I am going to use **"adm-"** followed by my name. representing an Admin account.

![created an admin user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/6f3ae749-796b-484f-a30d-e9e33490beb2)

6. Create a password for the admin account then select **Password never expires** so that we can continue to use the same password to log in

![create password for user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/aceb94b2-7354-4fc2-89db-b4ae97eaf904)

7. Confirm everything is correct and hit **Finish**

![confirm our settings for admin](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/468fade3-0cbc-489f-874b-3458dd7fc625)

8. Now that our Admin account is created and can be seen under **ADMINS**. Right-click your account -> **Properties**.

![make user to admin go to properties](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/5d078c92-7af6-4bb9-98d2-a6941739e3bb)

9. Navigate to the **"Member of"** tab then hit **Add**

10. In the text box option, Type in **"Domain Admins"**. Select **Check Names** and **Ok**.
> This will add itself in the new group of **Domain Admins**

![add and create domain admins check names and ok](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c6137a64-fe7e-4716-be3e-4a0c51676480)

> Now just select **Apply**

![success added and now admin to user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/a58ec930-7d99-42e4-8f71-490b7dc8f269)

11. Now we are going to log out and log into our new Admin account using the new credentials
- Make sure to select **Other user** and not the previous DomainName/Administrator log in screen

![now log out and sign in using our new user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/a6f28da1-df38-476b-a030-73dfef5d1c1b)

## Installing Remote Access Services/Network Address Translation (RAS/NET)
> This will allow the User VM on our Internal Network and access the internet through our DC VM

1. Go to **Server Manager** from the Windows Start icon

2. Select **Add Roles and Features**

3. Click **Next** until Server Roles. Then click and add **Remote Access**

![now gonna add remote access from our admin user account](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/0446ea46-4c9c-4aea-8e36-89022f7ecb7b)

4. Select **Next**

5. Select **Routing** then **Add Features**

![install routing now](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/d227b1fd-21c2-4c09-a6d8-d5ea6299f11d)

6. Routing is now checked and it will automatically check **DirectAccess and VPN (RAS)**. Hit **Next** and let it install

![now its added just click next and install](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/ca36f2cb-9b83-44b5-8671-74b800f125b3)

7. When it's finished installing, go to **Tools** located at the top right of Server Manager. Scroll down to select **Routing and Remote Access**

![after install go to tools and select routing and remote access](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/cf7cff20-6229-45c7-a78b-184169dc6edc)

8. Now that it is opened, right-click the **DC** -> Select **Configure and Enable Routing and Remote Access**

![right click configure and enable routing](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/5144c857-f8ca-4bfd-af2f-589416c05132)

9. Select **NAT**

![select NAT on configure](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/e7314679-1b55-499c-8fbc-9aef4cd62464)

10. Our two NICs should be shown. Select the **INTERNET NIC** and click **Next**

![select INTERNET NIC for NAT](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/5e3cf8ec-5782-45d5-a0a1-c1eec5256ffe)

11. Done we have added **RAS/NAT** and you may need to right-click on the **DC** to **refresh**. But now on the side the icons should display that they are up and running

![success now we add RAS](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/f96895ba-9db5-4be8-962d-18cd8b553225)

## Setup a DHCP Server in the DC
> This will our DC to distribute IP addresses to Users connected in our Internal network in turn will allow the User VM to access the internet

1. Go back to **Server Manager** -> select **Add Roles and Features** -> **Click DHCP Server**

2. Click **Add Features** and continue to start the installation process

![add DHCP from add roles](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/911fc6f1-19f3-4cc8-8894-9eec812e2808)

3.  Once the installation is completed, close it and go back to **Tools** at the top-right -> and select **DHCP**

![tools then select DHCP](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/9bd46fe4-4ecf-4026-9847-c8134fb6d1d1)

4.  Click the drop arrows of **DC** and **IPv4**. Right-click **IPv4** -> select **New scope**. This is where we will create a range of IP addresses for users connecting to the DC (as shown in our network diagram)

![right click IPv4 and new scope](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/9b12548c-56d5-45d1-80ea-971f8bb38bbc)

5.  It is going to prompt us to name the scope: **172.16.0.100-200** then select **Next**

![setup our scope for the internal network](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/1e3874e3-df3a-4f10-bd4f-bcefa0937cf9)

6.  Referencing our network diagram, we are going to input the same
- **Start IP address: 172.16.0.100**
- **End IP Address: 172.16.0.200**
- DHCP Settings
- **Length: 24**
- **Subnet mask: 255.255.255.0**

![address the ip range for the scope](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/55d10ed2-b45a-4af6-bd48-e1910dca7976)

> Here is our network diagram and we are at the **DHCP (1 Scope)** for reference
![network diagram](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/df8618dd-afdc-40ae-84ba-f648da802e22)

9. Click **Next**

10. Lease Duration is how long the User VMs IP Address will be given access to our DC. This is dependent on the environment but since this is a home lab we are going to set it at **8 days**

![set lease duration to 8days for lab purposes](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/af699d00-0602-43df-964c-2450c4eed9f5)

11. Select **Yes** to configure our options and continue

![select yes for configure DHCP options](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/8b90ee2b-c20e-4746-988f-f137c31b8ea7)

12. Now we are going to specify our router (Default Gateway)
- Type in our set IP Address of the **INTERNAL NIC**: **172.16.0.1**
- Make sure to select **Add**
- Now it's been added, click **Next**

![add the router ip of the internal network](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/1329eb8b-8560-4e00-bf6c-cd73361b7e2a)

13. Click **next** again

![click next and on DNS servers](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c1c6af17-4bae-4ebc-aa32-3ed0196b3a2a)

14. We're going to activate our new scope, select **Yes** and hit **Next**

![yes on activate the scope](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/e858b3ca-bd42-4aba-a38b-9002920f42d7)

15. For assurance we are going to right-click our **domain name** -> select **Authorize**

![now authorize the dc server by right clicking](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/2cfa4c1f-5290-49ce-b6d8-d2cfd03fa071)

16. Right-click the **domain name** again and select **Refresh**

![click refresh on dc server](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/d2476d88-f1a0-4868-9a63-4805fd924ecd)

17. Now we can see our **IPv4** is up and running including our newly added scope
> Under the **Address Leases** there is nothing yet but later on once we setup our User VM next, this is where you can see the User VMs Address Lease

![now our DHCP is up and running](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c8b6c825-e3ff-45d0-9601-0ebfe3a042f1)

## Create and Add Users to the AD with a PowerShell Script
> The following files created will be available to download

1. To start go to home screen and we are going to create a new folder in the desktop named, **Employees List**

![create a new folder on the desk top called Employees List](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/56b43fa0-4e50-4c49-87cd-1f6d5cb7d127)

2. Inside of the **Employees List** folder, create two .txt files
- "**Create_Users_Script**"
- "**employees**"

![Create new txt files called employees and Create_Users_script](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/8a71b62e-2190-4a6e-bd6f-ccabdefa9e05)

3. Open the **names** .txt file. Here I used ChatGPT to generate a list of 100 names (First Name Last Name) and copy/paste the list into the file. Then **Save** the file
> The amount of names is customizable, but for the lab I chose to do 100

![Here i created a list of 100 names from the help of GPT](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/bfc5d728-c8b9-4b6b-87aa-f9bc3491a995)

4. Now close the **names** file and open **Create_Users_Script** .txt file. Here I added comments to describe the purpose of each line of code

- "**$PASSWORD_FOR_USERS**" - You can customize the password to your liking as long it is between the " " after the equal sign
- "**New-ADOrganizationalUnit**" then after "**-Name**" - You can customize the OU name but here I chose to do **Employees**

![This is the code that will create new users in the AD from the employees list](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/11b2ad9f-ccc8-4d86-af51-fce394d432dd)

5. Save **Create_Users_Script** .txt file.

6. Now click **Save As**, use the same name and make sure to add "**.ps1**" at the end. This will create a new PowerShell script save that we can use to automate the creation of users using **PowerShell ISE**

![were going to save the notepad into a ps1 file](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/7f4b64f8-c22b-4749-860b-a4f2d24789a6)

7. Open up **Windows PowerShell ISE**, **Windows Start Icon** -> **Right-click PowerShell ISE** -> **More** -> Select **Run as administrator**

![now start up ps ISE](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/3f99157d-8d38-4e03-8fe3-b03e7dc5b931)

8. Going to open our script we made, **File** -> **Open** -> Navigate to the desktop and select **Create_Users_Script**

![now open and select our script file](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/0b6fe0d7-ef06-4021-8208-2cc7b0ac1ca7)

9. We see our script loaded in but before we run it, we must go into the terminal to allow the script to run
- Type in the following "**Set-ExecutionPolicy Unrestricted**".
- Select **Yes to All**

![set to unrestricted and yes to all](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/9f653741-ff1a-4f0d-9b1d-f5ced869c476)

10. Last thing to do before we can run the script, go to the terminal, and input the logical path of the **Create_Users_Script**
- Type in: "**cd C:\users\(YOUR ADMIN USERNAME)\Desktop\Employees List\**"
- Hit **Enter**

![were going to change directory to the script location](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/53d2eb30-adab-48d1-9098-b1018080d6e5)

11. Now we are ready to run the script, let PowerShell compile, and create Users into our AD
- Select **Green Play Button** on the top task bar to run the script
- You should see in green that it is "Creating user: xxxxxx"
- Just let it run until the script is finished
- There will be some errors, but the reason is the list has some duplicate names

![click run and now it will create users into the AD](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/896f93d0-3a16-4574-bfea-4172b168d9f7)

12. To check our work lets go to **Active Directory Users and Computers** -> **Right-click your Domain name** -> Select **Refresh**.
- And now under our new OU **Employees** the list of names from the list are now added as employees in the network. Each with a username and login following the same naming conventions.

![now go to AD and refresh we can see all of the users are now added under Employees OU](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/06ce0cc5-48e3-44a3-b12c-95fd1aa492df)

- Congrats and now it's time to set up our User VM that will connect to our DC and Internal work emulating an employee workstation

## Creating our 2nd VM: the USER VM, Windows 10 Enterprise
> This will connect to our Internal NIC, and the DC will provide internet access through the DC's DCHP scope

1. Go back to **VirtualBox** and select **New**
- Name: "**Client User**"
- Folder: This is where we are going to store virtual machines. Use the same location as we did for the Windows Server. Should be **AD LAB\Virtual Machines** (Disregard my folder location in the image)
- ISO Image: This should be in your AD Lab Files folder **AD LAB\AD Lab Files** and select the Windows ISO File
- Check the **Skip Unattended Installation**

![create a new vm client user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/809be623-eba7-440f-b345-b13c4468d43a)

2. For hardware specs, feel free to go above than depicted but I used the minimum specifications
- **2048MB or 2GB**
- **1 CPU**

![hardware specs for vm client user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/df2bf52f-e163-48f6-9593-dc89a208b9ca)

3. Like before assign the **Virtual Hard Disk** to **20GB**

![make 20 gb for vm client user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/62e6dea6-b0bb-476c-b3da-e621e7bb3798)

4. Now that the VM is added, go to **Settings** -> **General** -> Turn on **Bidirectional** for both **Shared Clipboard & Drag'n'Drop**

![turn on bidirectional for vm client user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/69757c74-38c0-4a04-a09f-a6eae7ba5eec)

5. Go to **Network** in settings, here we are only using **Adapter 1** our INTERNAL NIC
- Change **Attached to: Internal Network**
- Name: **intranet** , the name we set for our INTERNAL NIC

![switch adapter 1 to internal network](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/ff531f3d-735b-49de-abbb-0be3c5edf80f)

6. Now we can **boot up** our Client User VM in VirtualBox
- Select your appropriate language and region
- Continue to hit **Next** until we get to where we want to install windows prompt
- Select **New** and accept the given conditions so that we can partition the drive

![now start up the vm client user and click next and partition the drive](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/b8dc753e-a5c2-4588-b715-83a2d2de149f)

7. It may take a while and let Windows install and do not touch any keys until Windows is finished

![let the windows 10 install vm client](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/8c10ace6-9bdc-4c6a-ae6d-b930005c4a86)

![just let everything install vm client](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/3b7fa9b4-ce34-43fd-9792-5a625ca92649)

8. Once it is done, Windows will ask you for a network to connect
- Select **I don't have internet**

![after filling in your language and region click i dont have internet](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/f26ebbaa-39c1-48c2-8b7a-31333e2590c0)

9. Here Select **Continue with limited setup**

![select continue with limited setup vm client](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/93709e6e-b048-4f92-b824-756f05a4e45f)

10. When it comes to inputting a user and password, this is just for creating a Windows account and not important
- For the name I just used **User**
- For the password it is not need so skip it and select **Next**

![just name it user for now](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/30fd3857-aaf9-460c-b496-6448bb9c29c8)

11. These privacy settings just put **No** on all and **No** on other Microsoft setups

![select no for these options vm client](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/63e192f0-bdde-485f-a8a9-921fc92a8991)

Finally, our Client User VM is now set up with Windows

## Renaming our PC and Joining our Domain Controller
> Last step of our Network Diagram and journey of this lab. Here we are going to simulate an employee logging in and joining the corporate business network for the first time

1. From the home screen, go to **Settings** -> **About** -> Select **Rename this PC (advanced)**

![now go to settings-about-rename this pc](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/880ad71d-1f9b-48cb-90c7-2827b26a0744)

2. Inside the Properties window select **Change...**

![select this to change name vm client](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/0b2ee0be-2b0c-4632-91a5-2035a54f98d6)

3. Here we are going to Rename this PC and make the PC a member of our domain
- For the name I used **USER1**
- Select **Domain** and type in your exact domain
- Hit **Ok**
- The PC is going to contact our domain to establish a connection

![type in the name and our domain client user](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/37deebfe-8aa8-4ff6-b403-3f42487cebc4)

4. We are going to be prompted to enter a Username and Password that exist in the Active Directory
- These credentials can be one of the **Employees** that we created or our **Admin account**
- If you want to use an **Employees Log in** go back to the DC VM and browse in the **Active Directory Users and Computers** and under the **Employees** OU double-click any of the list. The password should be the universal password that was in the **PowerShell** script
- And again, it is good to keep note of all the log in credentials for this lab for reference

![now we can connect to our domain lets select one of our employees to log into the domain](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/3c0c1552-29fd-4e83-a66a-5effea8bc418)

- Showing how to access an **Employees log in** 

![here we going to select the first name as an example and use the username and universal password](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/28c56e73-8d92-47a6-bc6b-ec8549bb783d)

- During this time of the lab I used my Admin account but either is fine or will work

![going to log in with our admin account we made before](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/26c63e39-fdd2-4604-989e-737fcc586130)

5. Afterwards it is going to prompt us to restart the VM to apply the changes

![now that its success were going to restart the pc vc client](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/7d289743-206f-4af5-abc5-6ea28cd80935)

6. Last step, once it is done restarting, we can now log in with any accounts in the **Employees OU** or the **Admin Account** by selecting **Other User** and logging in

![now lets try to log in as one of the employees we created](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/d9e6a1bc-4ee7-4bb0-8dfb-fc27eac5dc32)

We have completed the network diagram we started!

![network diagram](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/assets/165770329/c1c334df-af50-490a-8bb3-061c31dc3ac9)

# Congratulations

We are all done with the **Active Directory Home Lab**! The purpose of this lab is to create and simulate a simple corporate network that uses AD to manage and secure multiple users in an environment. The next steps would be to add layers of defense in depth into the simple network to further harden the environment and maintain business continuity. Additional you can further structure and organize Employees (users) into groups such as: Marketing, IT, Sales, and Executive. Again, this is just a simple home lab project, thank you for your time and hope you enjoyed this lab!

## Credits

This project was made with the guidance of Josh Madakor's Video can be found here: https://www.youtube.com/watch?v=MHsI8hJmggI&t=831s&ab_channel=JoshMadakor

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

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%201.PNG?raw=true)

## Creating a Designated Save Location for the VMS and Files

1. Create a new folder called "**AD LAB**" in a location with the most space. Here I created it in my D: drive

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%202.PNG?raw=true)

3. Inside of **AD LAB** create two folders: **AD Lab Files**, **Virtual Machines**

  - **AD Lab Files** is the location where the VirtualBox, Windows Server 2022 ISO, and Windows 10 Enterprise installation files will be located
  - **Virtual Machines** is the location where we will install our VMs later using VirtualBox, which will be discussed later

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%203.PNG?raw=true)

## Download Windows 10 Enterprise

1. Go to https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise

2. Select "**Download the ISO - Enterprise**"

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%204.PNG?raw=true)

3. Fill in the relevant info or put "n/a" on certain fields

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%205.PNG?raw=true)

4. Select "**64-bit edition**" link under "**ISO - Enterprise downloads**"

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%206.PNG?raw=true)

5. The download will start and make sure to select "**AD Lab Files**" as your save location. It may take some time.

## Download Windows Server 2022

1. Go to https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022

2. Select "**Download the ISO**"

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%207.PNG?raw=true)

4. Like previously, fill in the relevant info or put "n/a" on certain fields.

5. Select "**64-bit edition**" link under "**ISO downloads**"

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%208.PNG?raw=true)

6. The download will start and make sure to select "**AD Lab Files**" as your save location

## Download Oracle VM VirtualBox & Extension Pack

1. Go to https://www.virtualbox.org/wiki/Downloads

2. Select "**Windows hosts** under the current VirtualBox platform packages and "**All supported platforms**" to also download the extension pack

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%209.PNG?raw=true)

3. Install Oracle VM VirtualBox
  - Open the Installation Setup file from where you downloaded the file (AD Lab)

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2010.PNG?raw=true)

  - Choose the installation location and hit "**Next**"
  - Wait for the VirtualBox to be installed

4. Repeat step 1 from above and do the same procedure for the **Extension Pack** following the installation process

## Open VirtualBox & Create the Domain Controller (DC) Virtual Machine

1. Select "**New**"

2. Create a name, i did "DC" here

3. Folder: is where Virtual Box designates the creation and saves for the Virtual Machine. Select the **Virtual Machines** folder

4. ISO Image: Browse and open the **AD Lab Files** folder then select the **Windows Server ISO** file which is shown below

5. Check "**Skip Unattended Installation**" then hit **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2011.PNG?raw=true)

6. Set the hardware specifications **4096 MB (4GB)** and **1 CPU** then hit **Next**
> Above are the preferred specifications but feel free to increase or decrease to 2GB and 1 CPU (All dependent on your current device)

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2012.PNG?raw=true)

7. Create a virtual hard disk and set disk size to **20GB** then hit **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2013.PNG?raw=true)

8. Before we boot up the Virtual Machine, first we are going to adjust the setting of the DC VM

9. Select the DC VM -> Settings -> General -> **Advanced tab**. Set **Shared Clipboard** and **Drag'n'Drop** to **Bidirectional**
> This will allow us the ability to Copy/Paste and Drag/Drop things between the computer and VMs.

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2014.PNG?raw=true)

10. The DC as shown in the Network Diagram will have two Network Interface Cards (NIC) or Network Adapters. One will be access to the internet and the other will serve as the Internal Network

11. Go to **Network** in Settings and make **Adapter 1** attached to **NAT**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2015.PNG?raw=true)


12. Select **Adapter 2** and make it attached to **Internal Network** this will be named "**intranet**"
> Feel free to create or customize the names, but for this lab it is going to match the created network diagram

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2016.PNG?raw=true)

## Install Windows Server 2022

1. Now that we have added the DC VM and configured the settings, start the DC VM by clicking the **Start** button

2. The VM will boot up and select your language and time and select **Next**

3. Choose the **Standard Evaluation (Desktop Experience)** version as this will give us the GUI or normal version of Windows instead of a command line interface

4. Follow the process and choose **Custom** installation

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2017.PNG?raw=true)

5. Now we are going to partition the drive by selecting **New** and accept the given specifications. Hit **Next** to continue with the installation

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2018.PNG?raw=true)

6. The installation process will take some time and will encounter some reboots or black screens. Make sure not to touch any keys until the installation is complete.

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2019.PNG?raw=true)

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2020.PNG?raw=true)

7. Once the installation is complete, you will be prompted to create an Administrator password
> Because this is a home lab environment we can use a rememberable universal password for the future passwords that will be created in this lab.
> It is also good to create a new text file (.txt) or make a note that will store any logins and passwords that will be used throughout the course of the lab

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2021.PNG?raw=true)

8. Now we have successfully booted up our Administrator account and to unlock the login screen, go to **Input** -> **Keyboard** -> **Insert Ctrl+Alt+Del** of the top taskbar of VirtualBox

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2022.PNG?raw=true)

9. Then type in the previous set password

10. A lot of windows will begin to pop up during start-up (server manager), we can ignore them for now and close out of them

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2023.PNG?raw=true)

11. You may notice some form of input lag of the mouse cursor or keyboard; we are going to fix that by installing the **Guest Additions CD** under **Devices**->**Insert Guest Additions CD Image** make sure to click it

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2024.PNG?raw=true)

12. Now go to **File (Folder icon)** -> **This PC** and select **CD Drive (D:) VirtualBox Guest Additions**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2025.PNG?raw=true)

13. Browse and select the **amd64** edition to start the installation and click **Next** for everything

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2026.PNG?raw=true)

14. Once it is finished, check **I want to manually reboot later** and click **Finish**.

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2027.PNG?raw=true)

15. Now **shut down** the VM and **start it up** again from the VirtualBox program. You should notice an improvement in the cursor movements

## Assign IP Addresses of the NICs

1. From the home screen click the **network icon** in the bottom right and select the current network

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2028.PNG?raw=true)

2. There should be two NICs: one connected to the internet (NAT) and the other is the Internal NIC

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2029.PNG?raw=true)

3. Right-click on one of the NICs and select **Status**->**Details**
- The NIC without an **IPv4 Default Gateway**, **DNS Server**, **WINS Server** is our **Internal NIC**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2030.PNG?raw=true)

4. Now that we have recognized the **Internal NIC**, right-click and **rename** the NIC to **INTERNAL NIC**

5. Do the same for the NIC and rename it to **INTERNET NIC**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2031.PNG?raw=true)

6. We are going to configure and assign an IP address to the **INTERNAL NIC**. As the INTERNET INC will be assigned an IP address through DHCP

7. Right-click->select **Properties**->**Select Internet Protocol Version 4 (TCP/IPv4)**. We're going to assign the follow address
- **IP address: 172.16.0.1**
- **Subnet mask: 255.255.255.0**
- **Default gateway: empty**
- **Preferred DNS server: 127.0.0.1**
  - This is a loopback address, where the DC will serve as its own DNS, as well as the DNS of the USER VM that will be connected to the DC
- Then select **OK** to the changes

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2032.PNG?raw=true)

## Rename the current VM to **DC**

1. Right-click the Windows Start icon -> **System**

2. In the **About** tab, select the button **Rename this PC**

3. Rename the PC to **DC**
> Now the PC name will match with the Network Diagram

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2033.PNG?raw=true)

## Installing the Active Directory and Domain Services (AD DS)
> This will allow us to manage users, passwords, access management of files on a network. Keeping assets secured and protected while maintaining business continuity

1. Open **Server Manager** (Windows start icon -> Server Manager should be on the start menu)

2. Select **Add roles and features**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2034.PNG?raw=true)

3. Click **Next** and make sure the server **DC** is selected

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2035.PNG?raw=true)

4. Now select **Active Directory Domain Services** and add the features

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2036.PNG?raw=true)

5. Continue to press **Next** then the **AD DS** will start to install

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2037.PNG?raw=true)

6. Once the AD DS is installed. Go back to the **Server Manager Dashboard**. At the top-right there will be a **flag with a notification icon**.

7. Click on it and select **Promote this server to a domain controller**.

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2038.PNG?raw=true)

8. Here we are prompted to create a new domain. Select **Add a new forest** then type in a custom domain. For the lab I will be using **virtualdomain.com**. Select **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2039.PNG?raw=true)

9. Set a password for the Directory Services Restore Mode (DSRM). This is a home lab environment where we can just make it an easy universal password we have been using. Be sure to note down every log in and password separately

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2040.PNG?raw=true)

10. Following the installation process, click **Next** on all to start the installation. Afterwards the DC will **restart**.

11. Upon reboot, we now see the log in of our **domain name\Administrator**

12. Log in with the previously set password

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2041.PNG?raw=true)

## Creating a Dedicated Admin Account for the New DC

1. Click the **Windows Start** icon -> select **Active Directory Users and Computers**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2042.PNG?raw=true)

2. Hover over your new domain name and **right-click it -> New -> Select Organizational Unit (OU)**
> This is where we will add our Admin account

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2043.PNG?raw=true)

3. Give our new OU a new, here I am going to call it **ADMINS**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2044.PNG?raw=true)

4. Once we have created it, right-click **ADMINS** -> **New** -> **User**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2045.PNG?raw=true)

5. Here we can fill out the credentials
- For **User logon name** it is good to create a standard naming convention for organization and structure in a real-world environment
- I am going to use **"adm-"** followed by my name. representing an Admin account.

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2046.PNG?raw=true)

6. Create a password for the admin account then select **Password never expires** so that we can continue to use the same password to log in

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2047.PNG?raw=true)

7. Confirm everything is correct and hit **Finish**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2048.PNG?raw=true)

8. Now that our Admin account is created and can be seen under **ADMINS**. Right-click your account -> **Properties**.

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2049.PNG?raw=true)

9. Navigate to the **"Member of"** tab then hit **Add**

10. In the text box option, Type in **"Domain Admins"**. Select **Check Names** and **Ok**.
> This will add itself in the new group of **Domain Admins**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2050.PNG?raw=true)

> Now just select **Apply**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2051.PNG?raw=true)

11. Now we are going to log out and log into our new Admin account using the new credentials
- Make sure to select **Other user** and not the previous DomainName/Administrator log in screen

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2052.PNG?raw=true)

## Installing Remote Access Services/Network Address Translation (RAS/NET)
> This will allow the User VM on our Internal Network and access the internet through our DC VM

1. Go to **Server Manager** from the Windows Start icon

2. Select **Add Roles and Features**

3. Click **Next** until Server Roles. Then click and add **Remote Access**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2053.PNG?raw=true)

4. Select **Next**

5. Select **Routing** then **Add Features**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2054.PNG?raw=true)

6. Routing is now checked and it will automatically check **DirectAccess and VPN (RAS)**. Hit **Next** and let it install

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2055.PNG?raw=true)

7. When it's finished installing, go to **Tools** located at the top right of Server Manager. Scroll down to select **Routing and Remote Access**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2056.PNG?raw=true)

8. Now that it is opened, right-click the **DC** -> Select **Configure and Enable Routing and Remote Access**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2057.PNG?raw=true)

9. Select **NAT**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2058.PNG?raw=true)

10. Our two NICs should be shown. Select the **INTERNET NIC** and click **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2059.PNG?raw=true)

11. Done we have added **RAS/NAT** and you may need to right-click on the **DC** to **refresh**. But now on the side the icons should display that they are up and running

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2060.PNG?raw=true)

## Setup a DHCP Server in the DC
> This will our DC to distribute IP addresses to Users connected in our Internal network in turn will allow the User VM to access the internet

1. Go back to **Server Manager** -> select **Add Roles and Features** -> **Click DHCP Server**

2. Click **Add Features** and continue to start the installation process

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2061.PNG?raw=true)

3.  Once the installation is completed, close it and go back to **Tools** at the top-right -> and select **DHCP**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2062.PNG?raw=true)

4.  Click the drop arrows of **DC** and **IPv4**. Right-click **IPv4** -> select **New scope**. This is where we will create a range of IP addresses for users connecting to the DC (as shown in our network diagram)

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2063.PNG?raw=true)

5.  It is going to prompt us to name the scope: **172.16.0.100-200** then select **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2064.PNG?raw=true)

6.  Referencing our network diagram, we are going to input the same
- **Start IP address: 172.16.0.100**
- **End IP Address: 172.16.0.200**
- DHCP Settings
- **Length: 24**
- **Subnet mask: 255.255.255.0**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2065.PNG?raw=true)

> Here is our network diagram and we are at the **DHCP (1 Scope)** for reference
![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%201.PNG?raw=true)

9. Click **Next**

10. Lease Duration is how long the User VMs IP Address will be given access to our DC. This is dependent on the environment but since this is a home lab we are going to set it at **8 days**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2066.PNG?raw=true)

11. Select **Yes** to configure our options and continue

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2067.PNG?raw=true)

12. Now we are going to specify our router (Default Gateway)
- Type in our set IP Address of the **INTERNAL NIC**: **172.16.0.1**
- Make sure to select **Add**
- Now it's been added, click **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2068.PNG?raw=true)

13. Click **next** again

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2069.PNG?raw=true)

14. We're going to activate our new scope, select **Yes** and hit **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2070.PNG?raw=true)

15. For assurance we are going to right-click our **domain name** -> select **Authorize**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2071.PNG?raw=true)

16. Right-click the **domain name** again and select **Refresh**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2072.PNG?raw=true)

17. Now we can see our **IPv4** is up and running including our newly added scope
> Under the **Address Leases** there is nothing yet but later on once we setup our User VM next, this is where you can see the User VMs Address Lease

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2073.PNG?raw=true)

## Create and Add Users to the AD with a PowerShell Script
> The following files created will be available to download

1. To start go to home screen and we are going to create a new folder in the desktop named, **Employees List**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2074.PNG?raw=true)

2. Inside of the **Employees List** folder, create two .txt files
- "**Create_Users_Script**"
- "**employees**"

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2075.PNG?raw=true)

3. Open the **names** .txt file. Here I used ChatGPT to generate a list of 100 names (First Name Last Name) and copy/paste the list into the file. Then **Save** the file
> The amount of names is customizable, but for the lab I chose to do 100

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2076.PNG?raw=true)

4. Now close the **names** file and open **Create_Users_Script** .txt file. Here I added comments to describe the purpose of each line of code

- "**$PASSWORD_FOR_USERS**" - You can customize the password to your liking as long it is between the " " after the equal sign
- "**New-ADOrganizationalUnit**" then after "**-Name**" - You can customize the OU name but here I chose to do **Employees**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2077.PNG?raw=true)

5. Save **Create_Users_Script** .txt file.

6. Now click **Save As**, use the same name and make sure to add "**.ps1**" at the end. This will create a new PowerShell script save that we can use to automate the creation of users using **PowerShell ISE**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2078.PNG?raw=true)

7. Open up **Windows PowerShell ISE**, **Windows Start Icon** -> **Right-click PowerShell ISE** -> **More** -> Select **Run as administrator**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2079.PNG?raw=true)

8. Going to open our script we made, **File** -> **Open** -> Navigate to the desktop and select **Create_Users_Script**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2080.PNG?raw=true)

9. We see our script loaded in but before we run it, we must go into the terminal to allow the script to run
- Type in the following "**Set-ExecutionPolicy Unrestricted**".
- Select **Yes to All**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2081.PNG?raw=true)

10. Last thing to do before we can run the script, go to the terminal, and input the logical path of the **Create_Users_Script**
- Type in: "**cd C:\users\(YOUR ADMIN USERNAME)\Desktop\Employees List\**"
- Hit **Enter**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2082.PNG?raw=true)

11. Now we are ready to run the script, let PowerShell compile, and create Users into our AD
- Select **Green Play Button** on the top task bar to run the script
- You should see in green that it is "Creating user: xxxxxx"
- Just let it run until the script is finished
- There will be some errors, but the reason is the list has some duplicate names

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2083.PNG?raw=true)

12. To check our work lets go to **Active Directory Users and Computers** -> **Right-click your Domain name** -> Select **Refresh**.
- And now under our new OU **Employees** the list of names from the list are now added as employees in the network. Each with a username and login following the same naming conventions.

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2084.PNG?raw=true)

- Congrats and now it's time to set up our User VM that will connect to our DC and Internal work emulating an employee workstation

## Creating our 2nd VM: the USER VM, Windows 10 Enterprise
> This will connect to our Internal NIC, and the DC will provide internet access through the DC's DCHP scope

1. Go back to **VirtualBox** and select **New**
- Name: "**Client User**"
- Folder: This is where we are going to store virtual machines. Use the same location as we did for the Windows Server. Should be **AD LAB\Virtual Machines** (Disregard my folder location in the image)
- ISO Image: This should be in your AD Lab Files folder **AD LAB\AD Lab Files** and select the Windows ISO File
- Check the **Skip Unattended Installation**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2085.PNG?raw=true)

2. For hardware specs, feel free to go above than depicted but I used the minimum specifications
- **2048MB or 2GB**
- **1 CPU**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2086.PNG?raw=true)

3. Like before assign the **Virtual Hard Disk** to **20GB**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2087.PNG?raw=true)

4. Now that the VM is added, go to **Settings** -> **General** -> Turn on **Bidirectional** for both **Shared Clipboard & Drag'n'Drop**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2088.PNG?raw=true)

5. Go to **Network** in settings, here we are only using **Adapter 1** our INTERNAL NIC
- Change **Attached to: Internal Network**
- Name: **intranet** , the name we set for our INTERNAL NIC

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2089.PNG?raw=true)

6. Now we can **boot up** our Client User VM in VirtualBox
- Select your appropriate language and region
- Continue to hit **Next** until we get to where we want to install windows prompt
- Select **New** and accept the given conditions so that we can partition the drive

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2090.PNG?raw=true)

7. It may take a while and let Windows install and do not touch any keys until Windows is finished

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2091.PNG?raw=true)

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2092.PNG?raw=true)

8. Once it is done, Windows will ask you for a network to connect
- Select **I don't have internet**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2093.PNG?raw=true)

9. Here Select **Continue with limited setup**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2094.PNG?raw=true)

10. When it comes to inputting a user and password, this is just for creating a Windows account and not important
- For the name I just used **User**
- For the password it is not need so skip it and select **Next**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2095.PNG?raw=true)

11. These privacy settings just put **No** on all and **No** on other Microsoft setups

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2096.PNG?raw=true)

Finally, our Client User VM is now set up with Windows

## Renaming our PC and Joining our Domain Controller
> Last step of our Network Diagram and journey of this lab. Here we are going to simulate an employee logging in and joining the corporate business network for the first time

1. From the home screen, go to **Settings** -> **About** -> Select **Rename this PC (advanced)**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2097.PNG?raw=true)

2. Inside the Properties window select **Change...**

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2098.PNG?raw=true)

3. Here we are going to Rename this PC and make the PC a member of our domain
- For the name I used **USER1**
- Select **Domain** and type in your exact domain
- Hit **Ok**
- The PC is going to contact our domain to establish a connection

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%2099.PNG?raw=true)

4. We are going to be prompted to enter a Username and Password that exist in the Active Directory
- These credentials can be one of the **Employees** that we created or our **Admin account**
- If you want to use an **Employees Log in** go back to the DC VM and browse in the **Active Directory Users and Computers** and under the **Employees** OU double-click any of the list. The password should be the universal password that was in the **PowerShell** script
- And again, it is good to keep note of all the log in credentials for this lab for reference

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%20100.PNG?raw=true)

- Showing how to access an **Employees log in** 

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%20101.PNG?raw=true)

- During this time of the lab I used my Admin account but either is fine or will work

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%20102.PNG?raw=true)

5. Afterwards it is going to prompt us to restart the VM to apply the changes

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%20103.PNG?raw=true)

6. Last step, once it is done restarting, we can now log in with any accounts in the **Employees OU** or the **Admin Account** by selecting **Other User** and logging in

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%20104.PNG?raw=true)

We have completed the network diagram we started!

![](https://github.com/marlopenaga/Active-Directory-Home-Lab-2024/blob/main/images/AD%20LAB%201.PNG?raw=true)

# Congratulations

We are all done with the **Active Directory Home Lab**! The purpose of this lab is to create and simulate a simple corporate network that uses AD to manage and secure multiple users in an environment. The next steps would be to add layers of defense in depth into the simple network to further harden the environment and maintain business continuity. Additional you can further structure and organize Employees (users) into groups such as: Marketing, IT, Sales, and Executive. Again, this is just a simple home lab project, thank you for your time and hope you enjoyed this lab!

## Credits

This project was made with the guidance of Josh Madakor's Video can be found here: https://www.youtube.com/watch?v=MHsI8hJmggI&t=831s&ab_channel=JoshMadakor

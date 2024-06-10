# --Customizable Password--
# Defines the password for all the users
$PASSWORD_FOR_USERS   = "VirtualP@$$word1"

# Get names of employees from our "employees" list
$USER_FIRST_LAST_LIST = Get-Content .\employees.txt

# Going to convert the universal password into a secure password
$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

# --Customizable OU Name--
# Creating a new Organizational Unit called "Employees" into the Active Directory
New-ADOrganizationalUnit -Name Employees -ProtectedFromAccidentalDeletion $false

# Creates a new user with revelant information for each person into our AD
foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Green
    
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=Employees,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}
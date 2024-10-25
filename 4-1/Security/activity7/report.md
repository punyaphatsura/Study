# Activity: Recon and Defense (Network Security I)

    Attacker IP (Thanat Wongsamut 6432067021): 10.144.0.3
    Target IP: 10.144.0.101
    VM IP: 10.144.0.100

## Part I: Prepare your target

**Test 1:** Use a browser in your target VM to visit the web server on the target VM.

![alt text](image.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

**Test 2:** Use a browser in your target notebook (notebook 1) to visit the web server on the VM. If you cannot reach the web server, modify your VM network settings in VirtualBox to "Bridge". Google for how to modify the setting if you cannot find it in VirtualBox.

![alt text](image-3.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

**Test 3:** Test that the ssh server on your VM is available by running ssh from the target notebook. Mac users may use Terminal. Windows users need to use putty, cygwin, CMDer, WSL, etc.

![alt text](image-2.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

**Test 4:** Test that the attacker can access the web server on your VM. Use a browser in your
attacker notebook (notebook 2) to visit the web server on the VM.

![alt text](image-1.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

## Part II. Reconnaissance

#### Run nmap from the attacker notebook against itself (localhost).

![alt text](image-4.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

![alt text](image-5.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

#### Run nmap from the attacker notebook against the target notebook (not the VM, but the host).

![alt text](image-6.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

![alt text](image-7.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

### Q1. Notice the open ports on all 3 devices (the attacker notebook, the target notebook, and the target Linux VM). Does anything look suspicious, i.e., some ports that you are not aware of that are open on the VM or on your notebooks?

Attacker notebook: ![alt text](image-8.png)

1. **Port 21 (FTP)**:

   - Risky to have open; potential security issue due to cleartext data transmission and possible configuration issues.

2. **Port 1123 (Murray?)**:

   - Unusual service; identified as "Murray?" with web-like responses indicating "Tabnine Hub." Could be a rogue or misconfigured service.

3. **Other Open Ports (22, 80, 631)**:
   - Standard services (SSH, HTTP, CUPS), but still need securing:
     - **SSH (22)**: Restrict access, use key-based authentication.
     - **HTTP (80)**: Verify necessity of the web server.
     - **IPP/CUPS (631)**: Disable if not used for printing.

Target notebook: ![alt text](image-9.png)
![alt text](image-10.png)

- **Port 5000 and 7000**:
  - Associated with the **AirTunes protocol**, used for wireless music streaming.
- **Port 3000**:
  - Port 3000 is running the project web app
- **Port 5900 (VNC)**:
  - Associated with **Virtual Network Computing (VNC)**, allowing for remote desktop access.

VM: ![alt text](image-11.png)

- **Port 22, 80**:
  - Same as Attacker notebook Port (SSH Port and HTTP Port)

### Q2. Look at the information provided by nmap about your OS's on all 3 devices. Is the information correct? Why is it or why is it not correct?

**Ans**

- **Attacker Notebook**:
  - Nmap provides accurate information about the operating system and the open ports.
- **Target Notebook**:

  - The detected **open port 5900** (VNC) is noted as potentially abnormal. It may appear open but doesn't have an application actively running on it.
  - This could indicate a configuration issue or leftover settings from previous installations. If VNC is not intentionally set up, this may be a vulnerability.

- **Target Linux VM**:
  - The OS information matches expectations, with open ports reflecting typical services (SSH, HTTP).

### Q3. What do you think about the information you can get using nmap? Scary?

**Ans**

Using Nmap to gather information about devices on a network can indeed be concerning. The level of detail it provides such as open ports, operating system versions, and service information can expose potential vulnerabilities.

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

### Q4. Look at the access.log file for the web server in your Linux VM. What IP addresses do you see accessing the web server? Which devices do these IP addresses belong to?

![alt text](image-12.png)

From the **access.log** file for the web server on the Linux VM, the following IP addresses were observed accessing the web server:

- **IP Address**: `127.0.0.1`

  - **Device**: This is the localhost address.

- **IP Address**: `10.144.0.3`
  - **Device**: This IP belongs to the attacker’s notebook.

### Q5. Find the nmap scan in the web server log. Copy the lines from the log file that were created because of the nmap scan.

![alt text](image-13.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

## Part III. Defense

**Test 1**: Ping your VM from your two notebooks. You should not see any responses.

Attacker notebook:
![alt text](image-14.png)

Target notebook:
![alt text](image-15.png)

**Test 2**: Access the web server on your VM from your browser on your 2 notebooks. You should be able to get the same web page as before.

**Yes, still got the same webpage**

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

**Test 3**: ssh from your target notebook (notebook 1) into the VM. You should be able to get the same results as before.

![alt text](image-16.png)

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

### Q6. After you successfully install your iptable rule(s), how do the reported results from your new nmap scan compare to your previous scan before using iptables? Look to see if OS detection, port open results, etc. have changed. Something(s) have definitely changed.

**Ans**

Before Firewall: ![alt text](image-11.png)

After Firewall: ![alt text](image-17.png)

The new Nmap scan results indicated that port 22 (SSH) is no longer visible to the scan, suggesting that the iptables rules effectively blocked access to this port.

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

### Q7. Notice that nmap can still figure out you have Apache httpd running. Look at the access.log file for the web server in your Linux VM. Are the logs the same as in Part II?

**Ans**

After running the second Nmap scan, it was observed that Nmap was still able to detect that Apache HTTPD was running on the server.

![Nmap Second Scan Result](image-18.png)

- **Access Log Consistency**: The access logs from the web server remained the same as those recorded in Part II.

### Q8. Explain whether or not you could prevent nmap from reaching the web server while still allowing legitimate clients to get service. Will a firewall be suﬃcient for this? Or do you need some other device? Please think critically about this.

**Ans**

- **Inability to Fully Restrict Access**: It’s impossible to prevent Nmap from accessing the web server while allowing legitimate users. Essential ports must remain open, which Nmap can exploit.

- **Limitations of Firewalls**: A firewall alone is not enough, as it can only control traffic based on rules without discerning intent.

- **Need for Additional Measures**:
  - **Traffic Analysis Tools** can identify and block suspicious patterns.
  - **Whitelisting** limits access to trusted IP addresses, reducing exposure to scans.

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

### Q9. What are your firewall rules? Run iptables -L on your VM and enter the output here.

![alt text](image-19.png)

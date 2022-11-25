# Kernel Config

### General
1. Kernel Comp mode = LZO
2. POSIX msg queues, need for DOCKER
3. Enable process VM = DISABLE
4. uselib syscall = Disable, using glibc
5. Auditing Support = Disable
6. Timers Subsystem
  * Timer Tick Handling
    * Idle dynticks system
    * Untick old dynticks
    * Untick High resolution timer support
7. CPU / Task time and stats accounting
  * Untick all to lower overhead, can produce HTOP errors
8. Initial RAM filesys = Untick, not using, build in drivers into kernel. (NB! not nouveu, need as module)
9. Compiler optimization level = -o2 gcc
10. Choose SLAB allocator = SLUB

### Process type and features
1. Enable MPS table = disable
2. Support for extended x86 platforms = disable
3. Processor family change accordingly
4. Remove all Intel if on AMD and vice versa
5. Max CPU's = Change to nproc on system for low overhead
6. Multicore scheduler support = disable if low nproc
7. Reroute for broken boot IQR = disable
8. IOPERM and IOPL Emulations = disable
9. CPU microcode loading = on
10. Enable level 5 paging = disable | WTF??
11. NUMA memory allocation and scheduler support = nproc high, then ON, else disable
12. Check for low memory corruption = disable
13. MTRR cleanup support
  * MTRR cleanup enable = 1
  * MTRR cleanup spare = 1
14. EFI all on
15. Timer frequency = 1000HZ
16. Kexec system call = ON
17. Build relocatable kernel = ON

### Power Management and ACPI
1. Suspend and Hibernation = ON laptop, disable on desktop
2. CPU frequency scaling
  * DefaultCPUFreq governor = ondemand for AMD and performance for Intel
3. ACPI support = ON
4. Cpuidle driver = ON if on Intel

### Bus options
1. Support mmconfig PCI = ON

### Enable the block layer 
1. Block layer debuggin info in debugfs = disable

### Network support
1. Amateur radio support = disable
2. Go through what is needed for your system. lsmod

### Device driver
1. PCCard PCMCIA support = disable
2. Block devices
  * Number of loop devices change to 0
3. NVME support check lsmod
4. SCSI device support
  * Asynchronous SCSI scanning = ON
5. Multiple devices driver support = disable
6. Macintosh device drivers = disable
7. Network device support
  * Check all options needed, check lsmod for info
8. Input device support
  * Check lsmod here for especially touchpad (i2c)
  * joysticks = disable
9. Graphics support
  * Max number of GPU's = set as nproc for GPU
  * video card as module, except Intel gpu

### File system
1. Set filesys as needed for system
2. Miscellaneous filesystems = disable

### Kernel hacking
1. RCU debugging
  * RCU CPU stall timer = 3 sec

### Gentoo linux support
1. Support for init systems
  * openRC

## NB!
For being able to have display support during loading of kernel
* config_fb_efi = y
* config_fb_simple = y
* config_fb_vesa = y

### LSMOD and lspci -k
Go through lsmod and enable all modules needed as well as see through lspci -k for more.

### kvm, docker and other hardware, like webcam support
Check gentoos related wiki for each hardware, for what to enable.




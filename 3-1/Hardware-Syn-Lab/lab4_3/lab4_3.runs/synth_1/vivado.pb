
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:012default:default2
00:00:082default:default2
456.9302default:default2
164.1452default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/utils_1/imports/synth_1/main.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2m
YC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/utils_1/imports/synth_1/main.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
q
Command: %s
53*	vivadotcl2@
,synth_design -top main -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
195682default:defaultZ8-7075h px� 
�
.redeclaration of ANSI port '%s' is not allowed7382*oasys2
clk_out2default:default2l
VC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/clock_divider.v2default:default2
282default:default8@Z8-11121h px� 
�
.redeclaration of ANSI port '%s' is not allowed7382*oasys2
segment2default:default2j
TC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/hex_to_7seg.v2default:default2
272default:default8@Z8-11121h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
clockdiv2default:default2
wire2default:default2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
512default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:10 . Memory (MB): peak = 1274.309 ; gain = 411.762
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
main2default:default2
 2default:default2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
232default:default8@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2
ROM.mem2default:default2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
412default:default8@Z8-3876h px� 
�
synthesizing module '%s'%s4497*oasys2!
clock_divider2default:default2
 2default:default2l
VC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/clock_divider.v2default:default2
232default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
clock_divider2default:default2
 2default:default2
02default:default2
12default:default2l
VC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/clock_divider.v2default:default2
232default:default8@Z8-6155h px� 
�
index %s out of range324*oasys2
202default:default2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
482default:default8@Z8-324h px� 
�
-case statement is not full and has no default155*oasys2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
632default:default8@Z8-155h px� 
�
synthesizing module '%s'%s4497*oasys2%
seven_segment_tdm2default:default2
 2default:default2p
ZC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/seven_segment_tdm.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
hex_to_7seg2default:default2
 2default:default2j
TC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/hex_to_7seg.v2default:default2
232default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
hex_to_7seg2default:default2
 2default:default2
02default:default2
12default:default2j
TC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/hex_to_7seg.v2default:default2
232default:default8@Z8-6155h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
num02default:default2p
ZC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/seven_segment_tdm.v2default:default2
492default:default8@Z8-567h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
num12default:default2p
ZC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/seven_segment_tdm.v2default:default2
492default:default8@Z8-567h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
num22default:default2p
ZC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/seven_segment_tdm.v2default:default2
492default:default8@Z8-567h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
num32default:default2p
ZC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/seven_segment_tdm.v2default:default2
492default:default8@Z8-567h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
seven_segment_tdm2default:default2
 2default:default2
02default:default2
12default:default2p
ZC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/seven_segment_tdm.v2default:default2
232default:default8@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
dot2default:default2
12default:default2%
seven_segment_tdm2default:default2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
732default:default8@Z8-689h px� 
�
5ignoring illegal expression in output port connection2900*oasys2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
732default:default8@Z8-2900h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
main2default:default2
 2default:default2
02default:default2
12default:default2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
232default:default8@Z8-6155h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
dp2default:default2
main2default:default2c
MC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/sources_1/new/main.v2default:default2
292default:default8@Z8-3848h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
dp2default:default2
main2default:defaultZ8-7129h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:13 . Memory (MB): peak = 1364.242 ; gain = 501.695
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:03 ; elapsed = 00:00:13 . Memory (MB): peak = 1364.242 ; gain = 501.695
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:03 ; elapsed = 00:00:13 . Memory (MB): peak = 1364.242 ; gain = 501.695
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1364.2422default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2o
YC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/constrs_1/new/Basys-3-Master.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
btnC2default:default2o
YC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/constrs_1/new/Basys-3-Master.xdc2default:default2
672default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2o
YC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/constrs_1/new/Basys-3-Master.xdc2default:default2
672default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2o
YC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/constrs_1/new/Basys-3-Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2m
YC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.srcs/constrs_1/new/Basys-3-Master.xdc2default:default2*
.Xil/main_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1449.5122default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
1449.5122default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:08 ; elapsed = 00:00:24 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:08 ; elapsed = 00:00:24 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:24 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:25 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 20    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
dp2default:default2
main2default:defaultZ8-7129h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:30 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
M
%s*synth25
!
ROM: Preliminary Mapping Report
2default:defaulth px� 
i
%s*synth2Q
=+------------+------------+---------------+----------------+
2default:defaulth px� 
j
%s*synth2R
>|Module Name | RTL Object | Depth x Width | Implemented As | 
2default:defaulth px� 
i
%s*synth2Q
=+------------+------------+---------------+----------------+
2default:defaulth px� 
j
%s*synth2R
>|main        | data       | 1024x11       | LUT            | 
2default:defaulth px� 
j
%s*synth2R
>|main        | p_0_out    | 1024x11       | LUT            | 
2default:defaulth px� 
j
%s*synth2R
>+------------+------------+---------------+----------------+

2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:37 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:14 ; elapsed = 00:00:37 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:15 ; elapsed = 00:00:37 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:19 ; elapsed = 00:00:45 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:19 ; elapsed = 00:00:45 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:19 ; elapsed = 00:00:45 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:19 ; elapsed = 00:00:45 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:19 ; elapsed = 00:00:45 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:19 ; elapsed = 00:00:45 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
C
%s*synth2+
+------+------+------+
2default:defaulth px� 
C
%s*synth2+
|      |Cell  |Count |
2default:defaulth px� 
C
%s*synth2+
+------+------+------+
2default:defaulth px� 
C
%s*synth2+
|1     |BUFG  |     1|
2default:defaulth px� 
C
%s*synth2+
|2     |LUT1  |    20|
2default:defaulth px� 
C
%s*synth2+
|3     |LUT2  |     5|
2default:defaulth px� 
C
%s*synth2+
|4     |LUT3  |     2|
2default:defaulth px� 
C
%s*synth2+
|5     |LUT4  |    13|
2default:defaulth px� 
C
%s*synth2+
|6     |LUT5  |    17|
2default:defaulth px� 
C
%s*synth2+
|7     |LUT6  |    82|
2default:defaulth px� 
C
%s*synth2+
|8     |MUXF7 |     5|
2default:defaulth px� 
C
%s*synth2+
|9     |MUXF8 |     2|
2default:defaulth px� 
C
%s*synth2+
|10    |FDRE  |    33|
2default:defaulth px� 
C
%s*synth2+
|11    |IBUF  |    13|
2default:defaulth px� 
C
%s*synth2+
|12    |OBUF  |    11|
2default:defaulth px� 
C
%s*synth2+
|13    |OBUFT |     1|
2default:defaulth px� 
C
%s*synth2+
+------+------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:19 ; elapsed = 00:00:45 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:15 ; elapsed = 00:00:43 . Memory (MB): peak = 1449.512 ; gain = 501.695
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:19 ; elapsed = 00:00:46 . Memory (MB): peak = 1449.512 ; gain = 586.965
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1449.5122default:default2
0.0002default:defaultZ17-268h px� 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
72default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1449.5122default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
h
%Synth Design complete | Checksum: %s
562*	vivadotcl2
e0471d162default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
322default:default2
142default:default2
12default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:222default:default2
00:00:542default:default2
1449.5122default:default2
964.3552default:defaultZ17-268h px� 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2]
IC:/Users/Meep/Desktop/File/hw_syn_lab/lab4_3/lab4_3.runs/synth_1/main.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2r
^Executing : report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Sep 19 03:49:22 20232default:defaultZ17-206h px� 


End Record
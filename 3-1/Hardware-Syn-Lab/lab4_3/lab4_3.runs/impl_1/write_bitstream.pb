
d
Command: %s
53*	vivadotcl23
write_bitstream -force main.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2j
 "T
genblk1[18].div1/clk_out_reg_0genblk1[18].div1/clk_out_reg_02default:default2default:default2f
 "P
genblk1[18].div1/op[1]_i_2/Ogenblk1[18].div1/op[1]_i_2/O2default:default2default:default2b
 "L
genblk1[18].div1/op[1]_i_2	genblk1[18].div1/op[1]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px� 
�
�Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 12 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2b
 "L
genblk1[18].div1/op[1]_i_2	genblk1[18].div1/op[1]_i_22default:default2default:default2�
 ".
num0_reg[0]	num0_reg[0]2default:default".
num0_reg[1]	num0_reg[1]2default:default".
num0_reg[2]	num0_reg[2]2default:default".
num0_reg[3]	num0_reg[3]2default:default".
num1_reg[0]	num1_reg[0]2default:default".
num1_reg[1]	num1_reg[1]2default:default".
num1_reg[2]	num1_reg[2]2default:default".
num1_reg[3]	num1_reg[3]2default:default".
num2_reg[0]	num2_reg[0]2default:default".
num2_reg[1]	num2_reg[1]2default:default"*
	op_reg[0]		op_reg[0]2default:default"*
	op_reg[1]		op_reg[1]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px� 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 2 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
f
%Bitstream compression saved %s bits.
26*	bitstream2
152984962default:defaultZ40-26h px� 
[
Writing bitstream %s...
11*	bitstream2

./main.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
142default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:062default:default2
00:00:132default:default2
2561.1842default:default2
507.3162default:defaultZ17-268h px� 


End Record
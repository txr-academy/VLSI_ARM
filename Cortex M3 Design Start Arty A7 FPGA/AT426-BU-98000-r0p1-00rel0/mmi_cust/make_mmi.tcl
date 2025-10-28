# -------------------------------------------------------------------------
# Vivado 2022.1: Auto-generate ITCM MMI for updatemem (Minor ≤6)
# -------------------------------------------------------------------------

# Output MMI file
set output_mmi "m3_itcm_updatemem.mmi"

# CPU info
set cpu_name   "m3_itcm"
set cpu_begin  "0x00000000"
set cpu_end    "0x00007FFF"

# -------------------------------------------------------------------------
# Find ITCM RAM primitives in the implementation
# Assumes ITCM instance names contain 'u_x_itcm'
# -------------------------------------------------------------------------
set itcm_rams [get_cells -hier -regexp {.*u_x_itcm.*ram_block_reg.*} -filter {REF_NAME =~ RAMB36E1}]

if {[llength $itcm_rams] == 0} {
    puts "Error: No ITCM RAMB36 primitives found in design"
    return
}

puts "Found [llength $itcm_rams] ITCM RAMB36 blocks"

# -------------------------------------------------------------------------
# Open output MMI file
# -------------------------------------------------------------------------
set fp [open $output_mmi w]

# Header with minor version = 6
puts $fp "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
puts $fp "<MemInfo Version=\"1\" Minor=\"6\">"

# Processor wrapper
puts $fp "    <Processor Endianness=\"ignored\" InstPath=\"dummy\">"
puts $fp "        <AddressSpace Name=\"$cpu_name\" Begin=\"$cpu_begin\" End=\"$cpu_end\">"
puts $fp "            <BusBlock>"

# -------------------------------------------------------------------------
# Write each RAMB36 as a <BitLane>
# -------------------------------------------------------------------------
foreach ram $itcm_rams {
    # Get placement
    set loc [get_property LOC $ram]

    # Extract port A MSB/LSB from RAM properties
    set msb [get_property WRITE_WIDTH_A $ram]
    set lsb 0

    # Write <BitLane>
    puts $fp "                <BitLane MemType=\"RAMB36\" Placement=\"$loc\">"
    puts $fp "                    <DataWidth MSB=\"$msb\" LSB=\"$lsb\"/>"
    puts $fp "                    <AddressRange Begin=\"0\" End=\"8191\"/>"
    puts $fp "                    <Parity ON=\"false\" NumBits=\"0\"/>"
    puts $fp "                </BitLane>"
}

# Close processor / address space
puts $fp "            </BusBlock>"
puts $fp "        </AddressSpace>"
puts $fp "    </Processor>"

# Config & DRC (optional)
puts $fp "    <Config>"
puts $fp "        <Option Name=\"Part\" Val=\"xc7a100tcsg324-1\"/>"
puts $fp "    </Config>"
puts $fp "    <DRC>"
puts $fp "      <Rule Name=\"RDADDRCHANGE\" Val=\"false\"/>"
puts $fp "    </DRC>"

puts $fp "</MemInfo>"

close $fp

puts "ITCM MMI generated: $output_mmi"


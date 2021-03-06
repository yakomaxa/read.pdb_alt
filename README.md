# read.pdb_alt
Wrapper of read.pdb in R bio3d that deal with the youngest of the alternate locations (alt-loc) instead of sticking to A alt-loc.

# Background
read.pdb of bio3d (by default) deals only with A of alternate locations. However, there are some PDB entries that have alternate location B and C, or only B (not with A), or mixtures of these. Reading these entries by read.pdb leads to pdb object lacking the corresponding atoms.

# Intention
This wrapper function extracts "youngest" alt-loc for each residue. Of course, non-alt-loc atoms are treated as-is.

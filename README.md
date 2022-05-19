# read.pdb_alt
Alternative read.pdb of R bio3d that deal with the youngest of the alternate locations.

# Background
read.pdb of bio3d (by default) dealt only with alternate location A. However, there are some PDB entries that have alternate location B+C, or only B (not with A), or mixtures of these. 

# 
This wrapper function extract "youngest" alt-loc for each residue. Of course, non-alt-loc atoms are treated as-is.

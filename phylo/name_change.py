import sys
import os
import re
from Bio import SeqIO

in_file = "./Brassica.bac.final.0.03.rep.fasta"
out_file ="./Brassica.bac.final.0.03.rep.rename.fasta"

output_handle = open(out_file, "w")

OldseqID = list()
seqInfo = list()
NewseqID = list()

for seq_record in SeqIO.parse(in_file, "fasta"):
    OldseqID.append(seq_record.id)
    seqInfo.append(seq_record.description)
    seqID_New = seq_record.description
    seqID_New = re.findall('Otu.{6}',seq_record.description)
    NewseqID.append(seqID_New)
    seq_record.id = seqID_New[0]

    SeqIO.write(seq_record, output_handle, "fasta")

output_handle.close()
renamed = len(NewseqID)

print("done")
print("renamed %i sequence records" %(renamed))

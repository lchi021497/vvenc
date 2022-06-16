import os
import sys

labels = []
with open(sys.argv[1], "r") as f:
    for line in f.readlines():
        labels.append(line.split(" ")[0])

for l in labels:
    print(l)

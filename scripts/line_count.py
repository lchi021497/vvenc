import sys
import re
import pickle

if len(sys.argv) < 2:
    print("python line_count.py block_debug.txt")
    exit(1)

line_counts = []
with open(sys.argv[1]) as f:
    for idx, line in enumerate(f.readlines()):
        line_count = 0
        print(idx)
        res = re.findall("\{.*?\}", line)
        if not res:
            line_counts.append(0)
            continue

        for match in res:
            line_count += len(match[1:-1].strip().split(" "))
        line_counts.append(line_count)

with open("line_count.pkl", "wb") as pkl_file:
    pickle.dump(line_counts, pkl_file)

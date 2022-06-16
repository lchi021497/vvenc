import sys

if (len(sys.argv) < 2):
    print("Usage: format.py count.bb")
    exit(1)

with open(sys.argv[1]) as countfile:
    for line in countfile.readlines():
        if len(line) == 0 or line[0] != 'T':
            continue
        elif line[:2] == 'TT':
            sys.stdout.write('T: {}'.format(line[2:]))
        else:
            sys.stdout.write(line) 

#!/usr/local/bin/python
#python add_lang_to_relative_links_docs.py bg test/doc.md 
#TODO automate recursive dor directories
import sys

filepath=sys.argv[2]
lang=sys.argv[1]
lines=[]
pattern="](/"
pattern2="]: /"
news="/news/"
with open(filepath) as fp:
    line = fp.readline()
    cnt = 1
    while line:
        tmp=line.split(pattern)
        tmp2=line.split(pattern2)
        if tmp and pattern in line and lang not in line and news not in line:
            replace=tmp[0]+pattern+lang+"/"+tmp[1]
            lines.append(replace)
        elif tmp2 and pattern2 in line and lang not in line and news not in line:
            replace=tmp2[0]+pattern2+lang+"/"+tmp2[1]
            lines.append(replace)
        else:
            lines.append(line)
        line = fp.readline()
        cnt += 1
    fp.close()

replaced = open(filepath, "w")
replaced.writelines(lines)
replaced.close()

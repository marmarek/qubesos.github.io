from __future__ import print_function
import fileinput
import sys
import os


line_number = 2

lang_line='lang: bg'
lang = ' BG'
ref_line='ref: '
title_line='title:'
permalink_line='permalink:'
ref_nr=10

def addperma(filen,searchExp):
    for line in fileinput.input(filen, inplace=1):
        if searchExp in line:
            result = [line.strip() for x in line.split(',')]
            line = result[0]+'/bg'+result[1]
        sys.stdout.write(line)

def main():
    for root, dirs, files in os.walk("."):
        for filename in files:
            print(filename)
            # add language to permalink line
            addperma(filename,permalink_line)

            if os.path.is_file(filename):
                with open(filename, 'r+') as fh:
                    lines = fh.readlines()
                    for line in lines:
                        # change title to lang and title 
                        if line.startswith(title_line):
                            l = line + lang
                            index = [x for x in range(len(lines)) if title_line in lines[x].lower()]
                        
                        fh.seek(0)
                        # insert lang in front matter
                        lines.insert(line_number - 1, lang_line)
                        # insert ref in front matter
                        lines.insert(line_number, ref_line + ref_nr)    
                        ref_nr = ref_nr + 1
                        fh.writelines(lines)


if __name__ == "__main__":
    main()


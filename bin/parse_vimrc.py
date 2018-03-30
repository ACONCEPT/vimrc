#! usr/bin/env python3
import sys
import os

def readfile(fn):
    with open(fn,"r") as f:
        return f.readlines()

def parsebetween(command,p1,p2):
    i1 = command.find(p1)+ len(p1)
    i2 = command.find(p2)
    return command[i1:i2].strip()

def parsepoint(lines,fl,tl,processline = False,othercheck = False):
    if othercheck == False or not hasattr(othercheck,"__call__"):
        def othercheck(item):
            return True

    if othercheck == False or not hasattr(othercheck,"__call__"):
        def processline(val):
            return val
    result = []
    for line in lines:
        if f1 in line:
            keep = True
        if keep and othercheck(line):
            #output of function should be a tuple of (key,value) refrences the index, and referents of the associated command
           item = processline(line)
           if isinstance(item,str):
               if isinstance(result,list):
                   result.append(item)
               else:
                   result = []
                   result.append(item)
           result[item[0]]=item[1]
        if t1 in line:
            keep = False
            break
    return result

def parsecommand(command):
    commandmap = parsebetween(command,":command",":vsp")
    commandpath = parsebetween(command,":vsp","\n")
    return commandmap, commandpath

def getcommands(vimrc):
    ft = readfile(vimrc)
    keepfrom = False
    def commandcheck(val):
        return line[0] == ":"
    result = parsepoint(ft,"file shortcuts","\"+",parsecommand,commandcheck)
    return result

def appendto(loc,appendtype):
    with open(loc,"w+") as f:
        allofit = f.readlines()
    if appendtype == "file_shortcut":
#def parsepoint(lines,fl,tl,processline = False,othercheck = False):
        scopelines = parsepoint(allofit,"file shortcuts","\"+")
        print(scopelines)
        pass
    elif appendtype == "run_config":
        pass

if __name__ == "__main__":
    home = os.environ.get("HOME")
    appendto(home +"/.vimrc","file_shortcut")












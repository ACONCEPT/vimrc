#! usr/bin/env python3
import sys
import os
def get_argv(n,alt = False):
    try:
        return sys.argv[n]
    except:
        return alt

def check_dir():
    check = os.environ['HOME'] + "/bin/.vimindex"
    return check


def readindex():
    indexfile = check_dir()
    try:
        with open(indexfile,"r") as f:
            tf = f.readlines()
        result = [x.split(";") for x in tf]

    except Exception as e:
        with open(indexfile,"w") as f:
            f.write("")
            return ""

def inindex(val):
    index =readindex()
    return val in index

def make_commandname(fta):
    commandname = os.path.splitext(os.path.basename(fta))[0]
    indexes = []
    for i, char in enumerate(commandname):
        if i == 0 :
            indexes.append(i)
        if char == "_":
            indexes.append(i+1)
    commandname = "O{}".format("".join([commandname[x] for x in indexes]))
    return commandname

def make_runconfig(interpreter, buffer, args):
    print("make_runconfig got args int {}, buf {} , arg {}".format(interpreter,buffer,args))
    bn = os.path.splitext(os.path.basename(buffer))[0]
    listindexes = []
    for i, char in enumerate(bn):
        if i == 0 :
            listindexes.append(i)
        if char == "_":
            listindexes.append(i+1)
    fnshortcut = "".join([bn[x] for x in listindexes])
    intshortcut = interpreter[:1]
    shortcut = " {}{}".format(intshortcut,fnshortcut )
    funcargs = "'{} {} {}'".format(interpreter,buffer,args)
    return shortcut , funcargs


def append_shortcut(appendtype,**kwargs):
    vimrc = os.environ['HOME'] + '/.vimrc'
    if appendtype == "file":
        command = ":command {} :vsp {}"
        msg = "mapping {} to :{}"
        try:
#            file_to_add = kwargs.get("fta")
            file_to_add = sys.argv[2]
        except IndexError as e:
            print("Please provide the file you would like to add as a argument")
            exit()
        commandname = make_commandname(file_to_add)
        index = (commandname,file_to_add)
        one = commandname
        two = os.path.abspath(file_to_add)
    if appendtype == "run":
        command = "noremap {} :call RunConfig({})<CR>"
        msg = "mapping <leader>{} to {}"
        try:
            print("making runconfig")
#            mapping,funcargs =  make_runconfig(kwargs.get("interpreter"), kwargs.get("buffer"),kwargs.get("args"))
            mapping,funcargs =  make_runconfig(sys.argv(2), sys.argv(3),sys.argv(4))
            one = mapping
            two = funcargs
        except:
            print(" please provide at least three arguments for run configuration mappings")
            exit()
    insert = command.format(one,two )
    with open(vimrc,'a+') as f:
        f.write(insert + "\n")
    print(msg.format(two,one))


if __name__ == '__main__':
    runtype = sys.argv[1]
    print("got runtype {}".format(runtype))
    append_shortcut(runtype)


#! usr/bin/env/ python3
import sys
import os
base_string_components={'TOP':"function! {}()",
                        'BODY':["SetArgs('{}')","SetBuffer('{}')","SetInterpreter('{}')","Run()"],
                        'END':"endfunction"}

def indent_join(l):
    return "\t{}".format("\n\t".join(l))

def ifthere(num):
    try:
        return sys.argv[num]
    except:
        return False

def configindex(*args):
    index = "{}_{}_{}".format(*args)
    index = index.strip()
#    index[0] = index[0].upper()
    index = index.replace(index[0],index[0].upper(),0)
    return index

def process_body(bodylist,interpreter, buffer, args):
    if not isinstance(bodylist,list):
        bodylist = list(bodylist)
    result = []
    for x in bodylist:
        if "Args" in x:
            result.append(x.format(args))
        if "Buffer" in x:
            result.append(x.format(buffer))
        if "Interpreter" in x:
            result.append(x.format(interpreter))
        else:
            result.append(x)
    return indent_join(result)

def get_name(index):
    msg = "Please input mapping for the run configuration {}".format(index)
    msg += "\n{}:".format("".join(" " for x in range(len(msg))))
    mapping = input(msg)
    return mapping

def process_components(base,interpreter,buffer,args):
    index = configindex(interpreter,buffer,args)
    TOP = base['TOP'].format(index)
    BODY = process_body(base['BODY'], interpreter,buffer, args)
    END = base['END']
    command = process_command(index)
    components = [TOP,BODY,END]
    return "\n".join(components), command

def process_command(index,command = "noremap `{} :call {}"):
    name = get_name(index)
    command = command.format(name,index + "()")
    return command

def main(interpreter,buffer,args):
    print(" interpreter is {}, buffer is {}, args are {}".format(interpreter,buffer,args))
    function,command = process_components(base_string_components,interpreter, buffer,args)
    print("function is :\n{}".format(function))
    print("command is :\n{}".format(command))

if __name__ == '__main__':
    argone = ifthere(1)
    argtwo = ifthere(2)
    argthree = ifthere(3)
    main(argone, argtwo, argthree)

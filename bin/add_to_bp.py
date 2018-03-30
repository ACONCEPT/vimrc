#!usr/bin/env/ python3
import sys
import os
def append_to_bash_profile(n,bp):
    home = os.environ['HOME']
    try:
        if os.path.isdir(sys.argv[1]):
            print("adding {} to {}".format(n,bp))
            with open(os.path.join(home,bp),"a") as f:
                result = 'export PATH={}:$PATH'.format(n)
                f.write(result)

        else:
            text = "{} is not a dir and cannot be added to path".format(sys.argv[1])
            print(text)

    except Exception as e:
        print("exception {} all args {} ".format(e,sys.argv))

def main():
    n=sys.argv[1]
    bp=sys.argv[2]
    append_to_bash_profile(n,bp)

if __name__ == '__main__':
	main()


#! usr/bin/env python3
import sys
import os
def main(target_dir):
    for x in os.listdir(target_dir):
        if os.path.isfile(target_dir + x):
            if x[0] ==".":
                if "sw" in x[-3:]:
                    os.remove(target_dir +x)
                    print("removed {}".format(x))

if __name__ == '__main__':
    target_dir = sys.argv[1]
    main(target_dir)

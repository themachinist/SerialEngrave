import sys
import math

# made a little test in python prior to writing the g code. i wish there was an open source app for plotting g code.

try:
    num = 1
    while num > 0:
        s = len(str(num))
        s597 = num
        while s > 0:
            s598 = s597 % 10
            s597 = s597 / 10
            calc = math.floor(s598)
            answ = str(num)[s - 1]
            s = s - 1
            if int(calc) != int(answ):
                raise Exception('we\'re porked.. {0} != {1}'.format(calc, answ))
        num = num + 1
        if (num > 10000000):
            print('finished')
            sys.exit(1)
except KeyboardInterrupt as i:
    print(num)
    sys.exit(1)

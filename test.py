import sys
import math

# i didnt use a test framework, because i dont know how!

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

from random import randint as r

def rand_bin32():
    b = ""
    for i in range(32):
        b += str(r(0,1))
    return b

inp = ""

while True:
    b = rand_bin32()
    print b, int(b, 2)
    t = b[:15]
    i = b[15:15+11]
    o = b[15+11:32]
    print t + " " + i + " " + o
    print (int(t, 2), int(i, 2), int(o, 2))
    inp = raw_input()


        

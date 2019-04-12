import string

order = "{lowers}{uppers}{odds}{evens}".format(lowers=string.lowercase,
                                               uppers=string.uppercase,
                                               odds="13579",
                                               evens="02468"
                                              ).index

def ginort(s):    
    return "".join(sorted(s, key=order))
    
if __name__ == '__main__':
    s = raw_input()
    print (ginort(s))

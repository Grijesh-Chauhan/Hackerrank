#!/bin/python
import re
import itertools
    
class Decoder(object):

    def __init__(self, matrix):
        self.matrix = matrix

    # <bug>: special chars and whitespaces b/w two alpha-numerics
    BugPattern = re.compile(r"""
        [a-z0-9]
        (?P<bug>[\(!@#$%&\)\s]+)
        [a-z0-9]
        """, re.IGNORECASE|re.VERBOSE)
        
    Space = " "
    
    @classmethod
    def bugrpel(cls, matchobj):
        bugstr = matchobj.group('bug')
        return matchobj.group(0).replace(bugstr, cls.Space)
        
    @classmethod
    def make_readable(cls, decoded):
        return cls.BugPattern.sub(cls.bugrpel, decoded)
        
    def decode(self):
        colstrs = itertools.imap(lambda *args: "".join(args), *self.matrix)
        decoded = "".join(colstrs)
        return self.make_readable(decoded)

if __name__ == '__main__':
# FIXME replace `raw_input` using professional `fileinput` module
    nrows, ncols = map(int, raw_input().split())    
    matrix = []
    for _ in xrange(nrows):
        row = raw_input()
        matrix.append(row)

    print(Decoder(matrix).decode())

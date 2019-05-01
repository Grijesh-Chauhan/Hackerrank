from itertools import product, imap

def remainder(iterable, M):
    return sum(number**2 for number in iterable) % M

def maximize(arrays, M):
    max_remainder = None
    for t in product(*arrays):
        if max_remainder is None:
            max_remainder = remainder(t, M)
            continue
        if max_remainder == (M - 1):
            return max_remainder
        new = remainder(t, M)
        if new > max_remainder:
            max_remainder = new
    return max_remainder
    
if __name__ == '__main__':
    K, M = map(int, raw_input().split())    
    arrays = []
    for _ in range(K):
        numstrs = raw_input().split()[1:]
        arrays.append(imap(int, numstrs))
    print maximize(arrays, M)

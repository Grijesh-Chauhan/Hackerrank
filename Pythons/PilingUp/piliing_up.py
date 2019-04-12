# Puzzle is :- to check if sorting of numbers is possible in the descending
# order as a new array if we always pick new element from front or rear end

def pilingUp(cubes):
    """
    returns True if Piling is possible as per given in puzzle direction
    otherwise return False.
    
    * pile is always a sorted series of cubes by length
    """
    front, rear = 0, len(cubes) - 1
    
    # start with larger end as pile-top
    if cubes[front] >= cubes[rear]:
        piletop = cubes[front]
        front += 1
    else:
        piletop = cubes[rear]
        rear -= 1
    
    # pick the larger end from cubes to put on the pile-top
    # *greater end should be greater than pile-top
    while front <= rear:
        if cubes[front] >= cubes[rear]:
            if piletop < cubes[front]:
                return False
            piletop = cubes[front]
            front += 1
        else:
            if piletop < cubes[rear]:
                return False
            piletop = cubes[rear]
            rear -= 1
    return True

if __name__ == '__main__':
    T = int(raw_input())
    for _ in xrange(T):
        n = int(raw_input())
        cubes = map(int, raw_input().split())
        print ("Yes" if pilingUp(cubes) else "No")

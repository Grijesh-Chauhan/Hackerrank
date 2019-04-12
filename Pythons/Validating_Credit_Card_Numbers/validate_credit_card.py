import re

# 16 digits starts either 4, 5 or 6. may have '-' in b/w group of 4 digits
_is_valid_credit_card = re.compile(r"""^
    ([456][0-9]{15})|
    ([456][0-9]{3}(?:-[0-9]{4}){3})
    $""", re.VERBOSE).match

# continues four or more same number, may be seprated by '-'
_is_invalid_credit_card = re.compile(r"""
    (?P<continue>
        (?P<number>[0-9])
        (-?(?P=number)){3,}
    )
    """, re.VERBOSE).search
    
def isvalid_creditcard(number):
    return _is_valid_credit_card(number) and not _is_invalid_credit_card(number)

if __name__ == '__main__':
    N = int(raw_input())
    for _ in xrange(N):
        card_number = raw_input()
        print ("Valid" if isvalid_creditcard(card_number) else "Invalid")

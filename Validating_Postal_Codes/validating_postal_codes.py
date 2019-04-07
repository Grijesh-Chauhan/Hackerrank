import re

# 10000 <= code <= 999999
regex_integer_in_range = re.compile(r"^[1-9][0-9]{5}$")

# 552523: has two alternating repreats => [ 5, 2 ]
regex_alternating_repetitive_digit_pair = re.compile(r"""
    (?=
      (?P<first>[0-9])
       [0-9]
       (?P=first)
    )""", re.IGNORECASE|re.VERBOSE)

isinrange = regex_integer_in_range.search
alternatings = regex_alternating_repetitive_digit_pair.findall

def validate(code):
    if not isinrange(code):
        return False
    if len(alternatings(code)) > 1:
        return False
    return True

if __name__ == '__main__':
    
    postal_codes = ("4542867", # greater than 999999
                    "110000", # has two alternatings
                    "121426", # 1 alternating: valid code
                    "523563", # valid code
                    "552523", # 2 alternatings
                   )
    for code in postal_codes:
        print "%10s: %s" % (code, validate(code))

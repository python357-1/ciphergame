import sequtils, strutils

proc caeserCipher*(input: string, shift: int): string =
    var alphabet: array[26, char] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    
    # now 100% bullshit free!
    var numarray = map(cast[seq[char]](toLowerAscii(strip(input))), proc(x: char): int = (if x == ' ': -5 else: find(alphabet, x) + shift))
    var decodedarray = map(numarray, proc(y: int): char = (if y < 0: ' ' else: alphabet[(if y >= 26: y-26 else: y)]))
    var ciphered = join(decodedarray)
    return ciphered
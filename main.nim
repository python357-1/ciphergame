import strutils, strformat
import std/random
import algorithms/caeser

randomize()

#choose a line from the library file to run through ciper algorithm

var file: File = open("library.txt")
var data: string = readAll(file)
var line = rsplit(data, "\n")

var numLines: int = len(line)
numLines = numLines - 1
var plainText = line[rand(numLines)]

var cipherKey = rand(23) + 1
var res = caeserCipher($plainText, cipherKey)
var workingSolution: seq[char] = cast[seq[char]](res)

var placeholders: seq[string] = @[]

for letter in workingSolution:
    if (find(placeholders, cast[seq[char]](letter)) != -1):
        placeholders.add(cast[string](letter))

var numberedSolution: seq[string] = cast[seq[string]](workingSolution)
for lett in placeholders:
    var y = 1
    while (find(numberedSolution, lett) != -1):
        numberedSolution[find(numberedSolution, lett)] = $y
    y += 1


echo join(workingSolution)
while workingSolution != plainText:
    var input: string = readLine(stdin); # user input should be in form of xx:y or xx=y or xx y
    case (join(input)):
        of "solution":
            echo plainText
        of "shift":
            echo cipherKey 
        of "reset":
            workingSolution = cast[seq[char]](res)
        else:
            var inputFmt = align(input, 4, '0')
            var replaced = parseInt(fmt"{inputFmt[0]}{inputFmt[1]}") - 1
            var replacedWith = inputFmt[3]
            workingSolution[replaced] = replacedWith
    echo join(workingSolution)
    echo align("", len(workingSolution), '-')
    #echo join(numberedSolution)
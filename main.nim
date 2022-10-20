import strutils
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

var cipherKey = rand(24)
echo caeserCipher($plainText, cipher_key)
echo "Cipher Key: " & $cipher_key
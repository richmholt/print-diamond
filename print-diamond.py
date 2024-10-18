import sys
import argparse

parser = argparse.ArgumentParser(description='Create a diamond pattern for a given letter.')
parser.add_argument('-l', '--letter', type=str, default='c', help='Letter to create the diamond pattern')

args = parser.parse_args()

letter = args.letter.lower() 

# Alphabet and available colours
alphabet = list('abcdefghijklmnopqrstuvwxyz')

# Check if the letter is in the alphabet
if letter not in alphabet:
    print("Please pick a letter from the Latin Alphabet!")
    sys.exit()

choice = letter.lower()
ordinal_index = alphabet.index(choice)
initial_lead_space = ordinal_index  # for clarity
alphabet_index = 0  # starts the diamond at "a"

# Top of the diamond
for line in range(ordinal_index + 1):
    if alphabet[alphabet_index] == 'a':  # no mid space for the tip
        print(" " * initial_lead_space + alphabet[alphabet_index].upper())
        initial_lead_space -= 1
        alphabet_index += 1
    else:
        mid_space = (alphabet_index * 2) - 1
        print(" " * initial_lead_space + alphabet[alphabet_index].upper() + " " * mid_space + alphabet[alphabet_index].upper())
        initial_lead_space -= 1
        alphabet_index += 1

# Bottom of the diamond
if alphabet[alphabet_index - 1] != 'a':
    initial_lead_space = 1
    alphabet_index = ordinal_index - 1

    for line in range(ordinal_index):
        if alphabet[alphabet_index] == 'a':  # no mid space for the bottom tip
            print(" " * initial_lead_space + alphabet[alphabet_index].upper())
            initial_lead_space += 1
            alphabet_index -= 1
        else:
            mid_space = (alphabet_index * 2) - 1
            print(" " * initial_lead_space + alphabet[alphabet_index].upper() + " " * mid_space + alphabet[alphabet_index].upper())
            initial_lead_space += 1
            alphabet_index -= 1

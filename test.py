# jsonfile = open('data.json')
# output = open('output.json', 'w')
#
# for line in jsonfile.readlines():
#     output.write(line.encode().decode('unicode-escape'))
#
# jsonfile.close()
# output.close()

with open('data.json', mode='r') as in_file, \
     open('output.json', mode='w') as out_file:

    # A file is iterable
    # We can read each line with a simple for loop
    for line in in_file:

        # Tuple unpacking is more Pythonic and readable
        # than using indices
        # print(line)
        # ref, name, price, quantity, reorder = line.split()
        #
        # # Turn strings into integers
        # quantity, reorder = int(quantity), int(reorder)
        #
        # if quantity <= reorder:
        #     # Use f-strings (Python 3) instead of concatenation
        out_file.write(line.encode().decode('unicode-escape'))
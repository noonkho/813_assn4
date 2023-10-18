from itertools import permutations

golds = ["gold1", "gold2"]
locs = ["l11", 'l12', 'l13', 'l21', 'l22', 'l23', 'l31', 'l32', 'l33']
signs = ['strong', 'weak', 'empty']

response_table = {
    "l11": [2, 1, 0, 1, 0, 0, 0, 0, 0],
    "l12": [1, 2, 1, 0, 1, 0, 0, 0, 0],
    "l13": [0, 1, 2, 0, 0, 1, 0, 0, 0],
    "l21": [1, 0, 0, 2, 1, 0, 1, 0, 0],
    "l22": [0, 1, 0, 1, 2, 1, 0, 1, 0],
    "l23": [0, 0, 1, 0, 1, 2, 0, 0, 1],
    "l31": [0, 0, 0, 1, 0, 0, 2, 1, 0],
    "l32": [0, 0, 0, 0, 1, 0, 1, 2, 1],
    "l33": [0, 0, 0, 0, 0, 1, 0, 1, 2]
}

signal_table = {
    2: "strong",
    1: "weak",
    0: "empty"
}


# gold = 'gold1'
# loc = 'l11'


# for loc in locs:
#     for gold in golds:
#         for idx, val in enumerate(response_table[loc]):
#             string = "(or (not (metalAt " + loc + " " + gold + "))" + "(response " + locs[idx] + " " + signal_table[val]+ " " + gold +"))"
#             print(string)
#         print()
#     print()
#     print()


perms = [''.join(p) for p in permutations('120000000')]
comb = list(set(perms))
# print(len(comb))
# print(comb)

# (metalLoc ?l1 - location ?g1 - metal ?l2 - location ?g2 - metal)
# (or (not (metalLoc l11 gold1 l12 gold2)) (goldAt l11 gold1))
# (or (not (metalLoc l11 gold1 l12 gold2)) (goldAt l12 gold2))

for idx, choice in enumerate(comb):
    i_gold = [choice.find("1"), choice.find("2")]
    string_p1 = "(metalLoc " + locs[i_gold[0]] + " gold1 " + locs[i_gold[1]] + " gold2)"
    
    for i in range(2):
        full_string = "(or (not " + string_p1 + ") (goldAt " + locs[i_gold[i]] + " " + golds[i] + "))"
        print(full_string, end=" ")

        
    print()

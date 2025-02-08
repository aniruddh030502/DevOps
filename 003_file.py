num=[3,5,2,6,1,7]
maxi=num[0]
mini=num[0]
for i in num:
    maxi=max(maxi,i)
    mini=min(mini,i)

print("Max element",maxi)
print("Min element",mini)
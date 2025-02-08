num=[3,5,2,6,4,6,6]
maxi=num[0]
sec_maxi=num[0]

for i in num:
    if i>maxi:
        sec_maxi=maxi
        maxi=i
    if i<maxi and  i>sec_maxi:
        sec_maxi=i

print(maxi)
print(sec_maxi)
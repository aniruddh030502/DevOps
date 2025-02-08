arr=['a','x','x','b','a','d','c','c','x']

freq=[0]*26
for i in arr:
    freq[ord(i)-ord('a')]+=1
ele=''
maxi=-1
for i in range(26):
    if freq[i]>maxi:
        maxi=freq[i]
        ele=chr(i+ord('a'))

print(ele)
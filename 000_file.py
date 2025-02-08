s='Hello how are u doing after lunch'
# x=s.index("after",23)
# print(x)
s1="hello123"
s2="45344654"
# print(s1.isalnum())
# print(s2.isalpha())
# print(s2.isdecimal())

s3="\u00b2"
s4="10\u00bd"
# print(s3.isdecimal())
# print(s3.isdigit())
# print(s3.isnumeric())
# print(s3)
# print(s4.isdecimal())
# print(s4.isdigit())
# print(s4.isnumeric())
print(s3.isidentifier())
s4="hi-alb"
a=["hi","how","are","youa"]
print(s4.islower())
s5=(" ".join(a))
print(s4.strip("al"))
print(s5.split(" "))
print(s5.title())
print(s5.swapcase())
print(s5.replace("how","hello"))
print(s5.startswith("hi"))
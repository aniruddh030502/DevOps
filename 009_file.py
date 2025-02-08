person={"first_name":"aniruddha",
"last_name":"das",
"skills":["python","java","c++"],
"databases":{
    "sql":"yes",
    "mongodb":"yes"
}}
print(person["skills"])

person["address"]="KOLKATA"
print(person)
print(person["databases"]["mongodb"])
print(person.pop("address"))
print(person)
person["skills"].append("c")
print(person.items)
person_copy=person.copy()
print(person_copy)
print(person.keys())
keys=person.keys()
for i in keys:
    print(person[i])
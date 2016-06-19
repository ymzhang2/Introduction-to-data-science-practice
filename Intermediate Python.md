### EXERCUSE 1
**List & String**
* Create a list of the first names of your family members.
```python
family= ['Yiman','Sen','Shuhua','Zhoulong']
```
* Print the name of the last person in the list.
```python
family[-1]
```
* Print the length of the name of the first person in the list.
```python
len(family[0])
```
* Change one of the names from their real name to their nickname.
```python
family[1]='Sensen'
```
* Append a new person to the list.
```python
family.append('Zhuzhu')
```
* Change the name of the new person to lowercase using the string method 'lower'.
```python
family[-1] = family[-1].lower()
```
* Sort the list in reverse alphabetical order.
Bonus: Sort the list by the length of the names (shortest to longest).
```python
sorted(family)
sorted(family, reverse=True)
sorted(family,key=len)
```

###EXERCISE 2:
**FOR LOOPS AND LIST COMPREHENSIONS**
* Given that: letters = ['a', 'b', 'c']. Write a list comprehension that returns: ['A', 'B', 'C']
```python
[letter.upper() for letter in letters]
```
* Given that: word = 'abc'. Write a list comprehension that returns: ['A', 'B', 'C']
```python
[letters.upper() for letter in word]
```
* Given that: fruits = ['Apple', 'Banana', 'Cherry']. Write a list comprehension that returns: ['A', 'B', 'C']
```python
[fruit[0] for fruit in fruits]
```
###EXERCISE 3:
**DICTIONARIES**
`family = {'dad':'Homer', 'mom':'Marge', 'size':2}`
1. Print the name of the mom.
`family['mom']`
2. Change the size to 5.
family['size']=5
3. Add 'Maggie' to the list of kids.
`family.append('Maggie')`
4. Fix 'bart' and 'lisa' so that the first letter is capitalized.
Bonus: Do this last step using a list comprehension.
`family['kids']=[lisa,bart]`
`family['kids']=[kid[0].upper()+kid[1:].lower() for kid in family['kids']]`
'family['kids']=[kid.capitalize() for kid in family['kids']]'

###reading data and cleaning

#####BASIC LEVEL
**PART 1**: Read in the file with csv.reader() and store it in an object called 'file_nested_list'.
Hint: This is a TSV file, and csv.reader() needs to be told how to handle it.
      https://docs.python.org/2/library/csv.html
```python
import csv
with open('/Users/yimanzhang/Desktop/DAT8-master/data/chipotle.csv') as f:
    file_nested_list=[row for row in csv.reader(f,delimiter='/t')]
with open('/Users/yimanzhang/Desktop/AT8-master/data/chipotle.csv') as f:
    file_nested_list=[row.split('/t') for row in f]
```
**PART 2**: Separate 'file_nested_list' into the 'header' and the 'data'.
```python
header=file_nested_list[0]
data=file_nested_list[1:]
```
#####INTERMEDIATE LEVEL
**PART 3**: Calculate the average price of an order.
Hint: Examine the data to see if the 'quantity' column is relevant to this calculation.
Hint: Think carefully about the simplest way to do this!
```python
price=[float(row[-1][1:-1]) for row in data]
order_num=len(set([row[0] for row in data]))
avg_price=round(sum(price)/order_num,2)
```

**PART 4**: Create a list (or set) of all unique sodas and soft drinks that they sell.
Note: Just look for 'Canned Soda' and 'Canned Soft Drink', and ignore other drinks like 'Izze'.
```python
soads=[]
for row in data:
    if 'Canned' in row[2]:
        soads.append(row[3][1:-1])
set(soads)

#or
set([row[3][1:-1] for row in data if 'Canned' in row[2]])
```
#####ADVANCED LEVEL
**PART 5**: Calculate the average number of toppings per burrito.
Note: Let's ignore the 'quantity' column to simplify this task.
Hint: Think carefully about the easiest way to count the number of toppings!
```python
topping_count=sum([row[3].count(',')+1 for row in data if 'Burrito' in row[2]])
burrito_count=len([row[3] for row in data if 'Burrito' in row[2]])
avg_topping_num=round(topping_count/burrito_count,2)
avg_topping_num
```

**PART 6**: Create a dictionary in which the keys represent chip orders and
the values represent the total number of orders.
Expected output: {'Chips and Roasted Chili-Corn Salsa': 18, ... }
Note: Please take the 'quantity' column into account!
Optional: Learn how to use 'defaultdict' to simplify your code.


## Homework 
```python
#Lesson on file reading using Airline Safety Data
#https://github.com/fivethirtyeight/data/tree/master/airline-safety
f = open('/Users/yimanzhang/Desktop/DAT8-master/data/airlines.csv')
file_string=f.read()
file_string
f.close
```


```python
# use a context manager to automatically close your file
with open('/Users/yimanzhang/Desktop/DAT8-master/data/airlines.csv') as f:
    file_string=f.read()
file_string
```


```python
# read the file into a list(each list element is one row)
with open('/Users/yimanzhang/Desktop/DAT8-master/data/airlines.csv') as f:
    file_list=[]
    for row in f:
        file_list.append(row)
```


```python
# do the same thing using a list comprehension
with open('/Users/yimanzhang/Desktop/DAT8-master/data/airlines.csv') as f:
    file_list=[row for row in f]
file_list
```


```python
## side note: spliting strings:
'hello DAT students'.split()
```




    ['hello', 'DAT', 'students']




```python
'hello DAT students'.split('e')
```




    ['h', 'llo DAT stud', 'nts']




```python
with open('/Users/yimanzhang/Desktop/DAT8-master/data/airlines.csv') as f:
    file_nested_list = [row.split(',') for row in f]
file_nested_list
```


```python
# separate the header and data
header=file_nested_list[0]
header
```




    ['airline',
     'avail_seat_km_per_week',
     'incidents_85_99',
     'fatal_accidents_85_99',
     'fatalities_85_99',
     'incidents_00_14',
     'fatal_accidents_00_14',
     'fatalities_00_14\n']




```python
data=file_nested_list[1:]
data
```




    [['Aer Lingus', '320906734', '2', '0', '0', '0', '0', '0\n'],
     ['Aeroflot*', '1197672318', '76', '14', '128', '6', '1', '88\n'],
     ['Aerolineas Argentinas', '385803648', '6', '0', '0', '1', '0', '0\n'],
     ['Aeromexico*', '596871813', '3', '1', '64', '5', '0', '0\n'],
     ['Air Canada', '1865253802', '2', '0', '0', '2', '0', '0\n'],
     ['Air France', '3004002661', '14', '4', '79', '6', '2', '337\n'],
     ['Air India*', '869253552', '2', '1', '329', '4', '1', '158\n'],
     ['Air New Zealand*', '710174817', '3', '0', '0', '5', '1', '7\n'],
     ['Alaska Airlines*', '965346773', '5', '0', '0', '5', '1', '88\n'],
     ['Alitalia', '698012498', '7', '2', '50', '4', '0', '0\n'],
     ['All Nippon Airways', '1841234177', '3', '1', '1', '7', '0', '0\n'],
     ['American*', '5228357340', '21', '5', '101', '17', '3', '416\n'],
     ['Austrian Airlines', '358239823', '1', '0', '0', '1', '0', '0\n'],
     ['Avianca', '396922563', '5', '3', '323', '0', '0', '0\n'],
     ['British Airways*', '3179760952', '4', '0', '0', '6', '0', '0\n'],
     ['Cathay Pacific*', '2582459303', '0', '0', '0', '2', '0', '0\n'],
     ['China Airlines', '813216487', '12', '6', '535', '2', '1', '225\n'],
     ['Condor', '417982610', '2', '1', '16', '0', '0', '0\n'],
     ['COPA', '550491507', '3', '1', '47', '0', '0', '0\n'],
     ['Delta / Northwest*', '6525658894', '24', '12', '407', '24', '2', '51\n'],
     ['Egyptair', '557699891', '8', '3', '282', '4', '1', '14\n'],
     ['El Al', '335448023', '1', '1', '4', '1', '0', '0\n'],
     ['Ethiopian Airlines', '488560643', '25', '5', '167', '5', '2', '92\n'],
     ['Finnair', '506464950', '1', '0', '0', '0', '0', '0\n'],
     ['Garuda Indonesia', '613356665', '10', '3', '260', '4', '2', '22\n'],
     ['Gulf Air', '301379762', '1', '0', '0', '3', '1', '143\n'],
     ['Hawaiian Airlines', '493877795', '0', '0', '0', '1', '0', '0\n'],
     ['Iberia', '1173203126', '4', '1', '148', '5', '0', '0\n'],
     ['Japan Airlines', '1574217531', '3', '1', '520', '0', '0', '0\n'],
     ['Kenya Airways', '277414794', '2', '0', '0', '2', '2', '283\n'],
     ['KLM*', '1874561773', '7', '1', '3', '1', '0', '0\n'],
     ['Korean Air', '1734522605', '12', '5', '425', '1', '0', '0\n'],
     ['LAN Airlines', '1001965891', '3', '2', '21', '0', '0', '0\n'],
     ['Lufthansa*', '3426529504', '6', '1', '2', '3', '0', '0\n'],
     ['Malaysia Airlines', '1039171244', '3', '1', '34', '3', '2', '537\n'],
     ['Pakistan International', '348563137', '8', '3', '234', '10', '2', '46\n'],
     ['Philippine Airlines', '413007158', '7', '4', '74', '2', '1', '1\n'],
     ['Qantas*', '1917428984', '1', '0', '0', '5', '0', '0\n'],
     ['Royal Air Maroc', '295705339', '5', '3', '51', '3', '0', '0\n'],
     ['SAS*', '682971852', '5', '0', '0', '6', '1', '110\n'],
     ['Saudi Arabian', '859673901', '7', '2', '313', '11', '0', '0\n'],
     ['Singapore Airlines', '2376857805', '2', '2', '6', '2', '1', '83\n'],
     ['South African', '651502442', '2', '1', '159', '1', '0', '0\n'],
     ['Southwest Airlines', '3276525770', '1', '0', '0', '8', '0', '0\n'],
     ['Sri Lankan / AirLanka', '325582976', '2', '1', '14', '4', '0', '0\n'],
     ['SWISS*', '792601299', '2', '1', '229', '3', '0', '0\n'],
     ['TACA', '259373346', '3', '1', '3', '1', '1', '3\n'],
     ['TAM', '1509195646', '8', '3', '98', '7', '2', '188\n'],
     ['TAP - Air Portugal', '619130754', '0', '0', '0', '0', '0', '0\n'],
     ['Thai Airways', '1702802250', '8', '4', '308', '2', '1', '1\n'],
     ['Turkish Airlines', '1946098294', '8', '3', '64', '8', '2', '84\n'],
     ['United / Continental*', '7139291291', '19', '8', '319', '14', '2', '109\n'],
     ['US Airways / America West*',
      '2455687887',
      '16',
      '7',
      '224',
      '11',
      '2',
      '23\n'],
     ['Vietnam Airlines', '625084918', '7', '3', '171', '1', '0', '0\n'],
     ['Virgin Atlantic', '1005248585', '1', '0', '0', '0', '0', '0\n'],
     ['Xiamen Airlines', '430462962', '9', '1', '82', '2', '0', '0\n']]


```python
##1. Create a list containing the average number of incidents per year for each airline.
avg=[round(int(row[2])+int(row[5])/float(30),2) for row in data]
```
```python
#Create a list of airline names (without the star)
#Create a list (of the same length) that contains 1 if there's a star and 0 if not.
star=[]
airlines=[]
for row in data:
    if row[0][-1]=='*':
        star.append(1)
        airlines.append(row[0][:-1])
    else: 
        star.append(0)
        airlines.append(row[0])
        
```


```python
#Create a dictionary in which the key is the airline name (without the star)
#   and the value is the average number of incidents.
airline_incidents=dict(zip(airlines,avg))
```


```python
airline_incidents
```




    {'Aer Lingus': 2.0,
     'Aeroflot': 76.2,
     'Aerolineas Argentinas': 6.03,
     'Aeromexico': 3.17,
     'Air Canada': 2.07,
     'Air France': 14.2,
     'Air India': 2.13,
     'Air New Zealand': 3.17,
     'Alaska Airlines': 5.17,
     'Alitalia': 7.13,
     'All Nippon Airways': 3.23,
     'American': 21.57,
     'Austrian Airlines': 1.03,
     'Avianca': 5.0,
     'British Airways': 4.2,
     'COPA': 3.0,
     'Cathay Pacific': 0.07,
     'China Airlines': 12.07,
     'Condor': 2.0,
     'Delta / Northwest': 24.8,
     'Egyptair': 8.13,
     'El Al': 1.03,
     'Ethiopian Airlines': 25.17,
     'Finnair': 1.0,
     'Garuda Indonesia': 10.13,
     'Gulf Air': 1.1,
     'Hawaiian Airlines': 0.03,
     'Iberia': 4.17,
     'Japan Airlines': 3.0,
     'KLM': 7.03,
     'Kenya Airways': 2.07,
     'Korean Air': 12.03,
     'LAN Airlines': 3.0,
     'Lufthansa': 6.1,
     'Malaysia Airlines': 3.1,
     'Pakistan International': 8.33,
     'Philippine Airlines': 7.07,
     'Qantas': 1.17,
     'Royal Air Maroc': 5.1,
     'SAS': 5.2,
     'SWISS': 2.1,
     'Saudi Arabian': 7.37,
     'Singapore Airlines': 2.07,
     'South African': 2.03,
     'Southwest Airlines': 1.27,
     'Sri Lankan / AirLanka': 2.13,
     'TACA': 3.03,
     'TAM': 8.23,
     'TAP - Air Portugal': 0.0,
     'Thai Airways': 8.07,
     'Turkish Airlines': 8.27,
     'US Airways / America West': 16.37,
     'United / Continental': 19.47,
     'Vietnam Airlines': 7.03,
     'Virgin Atlantic': 1.0,
     'Xiamen Airlines': 9.07}

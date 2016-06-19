
## Basic commands

##### `pwd`
* **p**rints **w**orking **d**irectory (the directory you are currently in)

##### `ls`
* **l**i**s**ts files and subdirectories in your working directory
* `ls -a` lists **a**ll files, including hidden files
* `ls -l` lists the files in a **l**ong format with extra information (permissions, size, last modified date, etc.)
* `ls *` also lists the contents of subdirectories (one level deep) in your working directory
* `ls <path>` lists files in a specific directory (without changing your working directory)

##### `clear`
* **clear**s all output from your console

##### `cd`
* `cd <path>` **c**hanges **d**irectory to the path you specify, which can be a relative path or an absolute path
* `cd ..` moves you "up" one directory (to the parent directory)
* `cd` moves you to your "home" directory

##### `mkdir`
* `mkdir <dirname>` **m**a**k**es a new **dir**ectory called `<dirname>`

##### `touch`
* `touch <filename>` creates an empty file called `<filename>`
* This is useful for creating empty files to be edited at a later time.
* You can create multiple empty files with a single command: `touch <filename1> <filename2> <filename3> ...`

##### `rm -i`
* `rm <filename>` **r**e**m**oves (deletes) a file permanently
* `rm -i <filename>` removes files in **i**nteractive mode, in which you are prompted to confirm that you really want to delete the file. It's best to always use `rm -i`.
* `rm -ir <dirname>` removes a directory and **r**ecursively deletes all of its contents

##### `mv`
* `mv <filename> <new path>` **m**o**v**es a file from its current location to `<new path>`
* `mv <filename> <new filename>` renames a file without changing its location

##### `cp`
* `cp <filename> <new path>` **c**o**p**ies a file from its current location to `<new path>`, leaving the original file unchanged
* `cp <filename> <new filename>` copies a file without changing its location


### Pre-class exercise Solution
* Open your command line interface.
* Navigate to your Desktop, and confirm you are there:
    * Print your working directory (it should end with `Desktop`).
    ```python
    pwd
   ```
    * List your files and subdirectories (they should match what you see on your Desktop).
    ```python
    ls
    ```
* Create a directory called `project`.
   ```python
   mkdir project ~/Desktop
   ```
* Navigate to the `project` directory, and create the following files in it: `draft_paper.md`, `plot1.png`, `plot2.png`.
  ```python
  cd ~/Desktop/project
  touch draft_paper.md plot1.png plot2.png
  ```
* Create two subdirectories in the `project` directory: `code`, `data`
 ```python
 mkdir code data ~/Desktop/project
 ```
* Navigate to the `code` subdirectory, and create the following files in it: `processing.py`, `exploration.py`.
```python
cd ~/Desktop/project/code
touch processing.py
touch exploration.py
```

* Navigate to the `data` subdirectory, and create the following files in it: `original.csv`, `clean.csv`, `other.csv`.
```python
cd ~/Desktop/project/data
touch original.csv clean.csv other.csv
```
* Make a copy of `draft_paper.md` called `final_paper.md`.
```python
cd ..
cp draft_paper.md final_paper.md
```
* Rename `plot1.png` as `scatterplot.png`, and rename `plot2.png` as `histogram.png`.
```python
mv plot1.png scatterplot.png
mv plot2.png histogram.png
```
* Create a subdirectory called `viz`, and then move `scatterplot.png` and `histogram.png` to `viz`.
```python
mkdir viz
mv scatterplot.png ~/viz
mv histogram.png ~/viz
```
* Delete `other.csv` from the `data` subdirectory.
```python
rm other.csv ~/Desktop/data
```
* Navigate back to `project`, and then print out (with a single command) all of its files, subdirectories, and the contents of those subdirectories. 
```python
cd ~/Desktop/project
ls
```



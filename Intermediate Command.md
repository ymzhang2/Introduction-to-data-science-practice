
### Intermediate commands

##### `head`
* `head <filename>` prints the **head** (the first 10 lines) of the file
* `head -n20 <filename>` prints the first 20 lines of the file
* This is useful for previewing the contents of a large file without opening it.

##### `tail`
* `tail <filename>` prints the **tail** (the last 10 lines) of the file

##### `cat`
* `cat <filename>` prints the entire file

##### `less`
* `less <filename>` allows you to page or scroll through the file
* Hit the spacebar to go down a page, use the arrow keys to scroll up and down, and hit `q` to exit.

##### `wc`
* `wc <filename>` returns the **c**ount of lines, **w**ords, and characters in a file
* `wc -l <filename>` only counts lines, `wc -w <filename>` only counts words, and `wc -c <filename>` only counts characters
* A "word" is defined as any set of characters delimited by a space.

##### `find`
* `find <path> -name <name>` will recursively search the specified path (and its subdirectories) and **find** files and directories with a given `<name>`
    * Use `.` for the `<path>` to refer to the working directory.
* For the `<name>`, you can search for an exact match, or use wildcard characters to search for a partial match:
    * `*` specifies any number of any characters, such as `find . -name *.py` or `find . -name *data*.*`
    * `?` specifies one character, such as `find . -name ??_*.*`

##### `grep`
* `grep <pattern> <filename>` searches a file for a **r**egular **e**xpression **p**attern and prints the matching lines
    * The pattern should be in quotation marks to allow for multiple words.
    * The pattern is case-sensitive by default, but you can use the `-i` option to **i**gnore case.
    * You can use wildcards in the filename to search multiple files, but it only searches the working directory (not subdirectories).
* `grep -r <pattern> <path>` does a **r**ecursive search of the path (checks subdirectories) for matches within files
    * Use `.` for the `<path>` to refer to the working directory.
* `grep <pattern>` does a **g**lobal search (of your entire computer) for matches
    * Hit `Ctrl + c` if you want to cancel the search.
* Much more complex string-matching patterns can be used.

##### `|`
* `<command 1> | <command 2>` pipes the results from `<command 1>` into `<command 2>`, and then the results of `<command 2>` are printed to the console

##### `>`
* `<command> > <filename>` takes the output of `<command>` and saves it in `<filename>`
* This will overwrite the file if it already exists.

##### `>>`
* `<command> >> <filename>` takes the output of `<command>` and appends it to `<filename>`
* This will create the file if it does not yet exist.


### Advanced commands

##### `cut`
* `cut -f1,2 <filename>` **cut**s a tab-delimited file into columns and returns the first two **f**ields
* `cut -f1,2 -d, <filename>` indicates that the file is **d**elimited by commas

##### `sort`
* `sort <filename>` **sort**s a file by the first field

##### `uniq`
* `uniq <filename>` discards all but one of the successive identical lines (thus it only keeps **uniq**ue lines)
* `uniq -c <filename>` also records the **c**ount of the number of occurrences
* Because lines must be successive to be counted as identical, you will usually use `sort` before `uniq`.

#### Command Line Tasks
* Look at the head and the tail of **chipotle.tsv** in the **data** subdirectory of this repo. Think for a minute about how the data is structured. What do you think each column means? What do you think each row means? Tell me! (If you're unsure, look at more of the file contents.)
```
cd ~/Desktop
ls
cd data
ls
cat chipotle.tsv | head 
cat chipotle.tsv | tail
head chipotle.tsv
tail chipotle
```

* How many orders do there appear to be?
There are 1834 orders (since 1834 is the highest **order_id** number).

* How many lines are in this file?
```
wc -l chipotle.tsv
```
* Which burrito is more popular, steak or chicken?
```
man grep
man wc
grep -i 'steak burrito' chipotle.tsv | wc -l
grep -i 'chicken burrito' chipotle.tsv | wc -l
grep -ci 'chicken burrito' chipotle.tsv
grep -ci 'chicken burrito'
```
Therefore, chicken burrito is more popular than steak burrito
* Do chicken burritos more often have black beans or pinto beans?
```
grep -i 'chicken burrito' chipotle.tsv | grep -i 'black bean' | wc -l
grep -i 'chicken burrito' chipotle.tsv | grep -i 'pinto bean' | wc -l
```
Therefore, chicken burritos with black bean is more pupular. 
6. Make a list of all of the CSV or TSV files in the DAT8 repo (using a single command). Think about how wildcard characters can help you with this task.
```
cd ..
find . -name *.?sv
```
* Count the approximate number of occurrences of the word "dictionary" (regardless of case) across all files in the DAT8 repo.
```
cd data
grep -ir 'dictionary' . | wc -l
```
* **Optional:** Use the the command line to discover something "interesting" about the Chipotle data. Try using the commands from the "advanced" section!

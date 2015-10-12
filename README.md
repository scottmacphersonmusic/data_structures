# data_structures
[![Build Status](https://travis-ci.org/scottmacphersonmusic/data_structures.svg?branch=hash_table)](https://travis-ci.org/scottmacphersonmusic/data_structures)

By [Scott Macpherson](https://github.com/scottmacphersonmusic)

### Description

A repository to hold sample code for a number of classic data structures implemented in ruby.
### Features
- Insertion Sort
  - Sort an array using an insertion sort algorithm
- Merge Sort
  - Sort an array using a merge sort algorithm
- Linked List
  - Create and manipulate singly linked lists
- Stack
  - Create a stack, push new nodes to it and pop the top node off
- ScoQueue
  - Create a queue, enqueue and dequeue items and compute size
- Hash Table
  - Create a hash table to store key/value pairs
- Benchmarks
  - Use a rake task to see performance statistics for each data structure
- Travis CI
  - Continuously tested!

### Usage
##### Insertion Sort
The insertion sort algorithm is monkey-patched onto ruby's built-in `Array` class, so to use it just call `#insertion_sort` on an `Array` object:

`[3, 2, 5, 1, 4].insertion_sort` returns `[1, 2, 3, 4, 5]`

###### Approach
The insertion sort algorithm will immediately return the array if it only has one element in it.  If there are multiple elements in the array, it creates an empty array, `sorted`, and iterates forward through the original array pushing elements into `sorted`.  For each iteration of the original array, the element will be pushed onto the end of `sorted`, and iterate backwards through `sorted` until it hits a number smaller than it or the beginning of the array and then insert itself. For each backward iteration of `sorted`, if the pushed element is smaller than the one its being compared to, the element from sorted will be assigned to the element one index up and the backwards iteration will continues.  Once an element pushed into `sorted` is compared to an element equal to or smaller than itself it is assigned to the current index and the backward iteration loop will break to jump to the next forward iteration of the original array.

##### Merge Sort
Merge sort is also monkey-patched onto `Array`.  Like the insertion sort it will return an array sorted from lowest to highest, but works more consistently across arrays of generally increasing, decreasing or random ordering.

###### Approach
The `merge_sort` algorithm calls itself recursively on an array until each element is in its own array, then it merges them back together in increasing order until they're all joined in a single array again.  To accomplish this it depends on another method called `merge`.

`Array#merge` takes an array as an argument and depending on which is smaller will shift the first element off either `self` or the input array into a new array, `merged`, which it will return once all the elements from at least one of the arrays has been shifted out.

`Array#merge_sort` works by spliting the `Array` object (`self`) in half and then calling `merge_sort` on each half.  The right half is then `merge`-ed into the left half . Because `merge_sort` calls itself recursively, each half of a given array will be split until it reaches that base case of a one element array.

##### Linked List
Create a new instance of `LinkedList` with an initial value of any type:

`list = LinkedList.new(7)`

To create a new `Node` object you must at least pass it a `value`; the second argument `next_node` will default to `nil` if nothing is given.

To insert a new node at the beginning of the list:

`list.insert Node.new(6)`

Now imagine our list has several more nodes:

`Node.new(3, Node.new(4, Node.new(5, Node.new(6, Node.new(7, nil)))))`

To search for a node with a given value:

`list.search 5`

This will return the `Node` object with value `5`.

To remove a node with given value:

`list.remove 6`

This will return the `Node` object with value `6` and remove it from the list.

To print all of the values of the list:

`list.to_s` ==> "3, 4, 5, 7"

##### Stack
To create a new stack pass it an initial value:

`stack = Stack.new "Comment 1"`

To add a new node to the top of the stack:

`stack.push "Comment 2"`

To pop the top node off the stack:

`stack.pop`

this will return a `Node` object.  You can access its value with the
`#value` method.

##### ScoQueue
So-named to avoid clashing with the Ruby built-in `Queue`.

To make a new queue:

`q = ScoQueue.new 'job 1'`

To add a new node to the top of the queue:

`q.enqueue 'job 2'`

To compute the number of nodes in the queue:

`q.size` returns: `2`

To remove a node from the bottom of the queue:

`q.dequeue` returns the value of the node: `'job 2'`

##### Hash Table
To create a new hash table pass it a table size:

`hash = HashTable.new 1024`

Use the `set(key, value)` method to enter a new key/value pair into the hash table (the key must be a `String`):

`hash.set 'team_1', 'Seattle Sounders FC'`

To retrieve a value from the table, use the `get(key)` method:

`hash.get team_1`, which will return `'Seattle Sounders FC'`

To delete a key/value pair from the hash table, use the `delete(key)` method:

`hash.delete team_1`, which will remove the pair and return the value .

###### Approach
The `HashTable` object itself is actually very simple - its main job is to apply a hashing algorithm to a key and then delegate most of the hard work to another object called `Bucket`.  When a new key/value pair is set, the hashing algorithm will sum the ordinal numbers of each character in the key string together and then find the remainder of that sum divided by the number of slots in the hash's `@table` instance variable, which is an `Array`.

```ruby
def hash(key)
  key.chars.reduce(0) { |a, e| a + e.ord } % @size
end
```

That remainder will be the index of `@table` in which the key/value will be insterted.

Each slot in `@table` holds a linked list object called `Bucket`. Each `Bucket` has an instance variable `@head` and methods to insert, search for, and remove key/value pairs.  When a second item is set into the hash table with the same `@table` index as an existing one, the new item replaces the node at that bucket's `@head` and stores the previous node in its `@nxt` instance variable.  When a key/value pair is accessed either by `get` or `delete`, the hashing algorithm points to the right bucket, which then performs either `search` or `remove` and returns the result to the `HashTable` object.

##### Benchmarks
To run benchmarks, navigate to the root of the project directory in your terminal and enter:
```bash
$ rake bm
```
This will print performance statistics to the console:

![benchmarks](/benchmarks.png)

![hash table benchmark](/hashtable_benchmark.png)

### Contributing
1. Fork It
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

### Credit
Linked list enlightenment found at [visualgo](http://visualgo.net/list.html#)

I learned about ruby exception handling at [Ruby Learning](http://rubylearning.com/satishtalim/ruby_exceptions.html)

[Ronald Kinch](https://github.com/ronaldkinch) contributed to the implementation of `Array#insertion_sort`

[Matt Yang](https://github.com/yang70) contributed to the implementation of `ScoQueue`

This README was edited at [dillinger.io](dillinger.io)


### License
data_structures is released under the [MIT License](http://opensource.org/licenses/MIT)

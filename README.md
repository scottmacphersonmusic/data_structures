# data_structures
[![Build Status](https://travis-ci.org/scottmacphersonmusic/data_structures.svg?branch=hash_table)](https://travis-ci.org/scottmacphersonmusic/data_structures)

By [Scott Macpherson](https://github.com/scottmacphersonmusic)

### Description

A repository to hold sample code for a number of classic data structures implemented in ruby.
### Features
- Linked List
  - Create and manipulate singly linked lists
- Stack
  - Create a stack, push new nodes to it and pop the top node off
- Hash Table
  - Create a hash table to store key/value pairs
  - Use a rake task to see performance statistics for the hash table
- Travis CI
  - Continuously tested!

### Usage
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

this will return a `Node` object.  You can access its value with the `#value` method.

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

This README was edited at [dillinger.io](dillinger.io)


### License
data_structures is released under the [MIT License](http://opensource.org/licenses/MIT)

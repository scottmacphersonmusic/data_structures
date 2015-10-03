# data_structures
By [Scott Macpherson](https://github.com/scottmacphersonmusic)

### Description

A repository to hold sample code for a number of classic data structures implemented in ruby.
### Features
- Insertion Sort
  - Sort an array using an insertion sort algorithm
- Linked List
  - Create and manipulate singly linked lists
- Stack
  - Create a stack, push new nodes to it and pop the top node off
- ScoQueue
  - Create a queue, enqueue and dequeue items and compute size
- Benchmarks
  - Use a rake task to see performance statistics for each data structure

### Usage
##### Insertion Sort
The insertion sort algorithm is monkey-patched onto ruby's built-in `Array` class, so to use it just call `#insertion_sort` on an `Array` object:

`[3, 2, 5, 1, 4].insertion_sort` returns `[1, 2, 3, 4, 5]`

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

##### Benchmarks
To run benchmarks, navigate to the root of the project directory in your terminal and enter:
```bash
$ rake bm
```
This will print performance statistics to the console:

![benchmarks](/benchmarks.png)

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

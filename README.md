# data_structures
By [Scott Macpherson](https://github.com/scottmacphersonmusic)
### Description
A repository to hold sample code for a number of classic data structures implemented in ruby.
### Features
- Linked List
  - Create and manipulate singly linked lists
 - Coming soon: *Insertion Sort*

### Usage
##### Linked List
Create a new instance of `LinkedList` with an initial value of any type:

`list = LinkedList.new(7)`

To create a new `Node` object you must at least give it a `value`; the second argument `next_node` will default to `nil` if nothing is given.

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
### Contributing
1. Fork It
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
### Credit
Linked list enlightenment found at [visualgo](http://visualgo.net/list.html#)

This README was edited at [dillinger.io](dillinger.io)

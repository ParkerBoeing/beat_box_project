# Project Purpose:
- To build out a functional beat box
- To utilize linked lists in Ruby

## Notes I wrote to myself while working on the project:

### Node class:

  - The set next node method is in lieu of an attr_accessor line at the top. What this does is allow the append method to push data into the next_node

### Linked List Class:

  - The find tail method is working by storing the information contained in head in a variable called node. As long as node.next_node contains data, find_tail will continue to search. Each time that the find_tail method checks for node.next_node, it simultaneously switches the variable called node for the next node in the list, with the line node = node.next_node. In this way the find_tail method traverses each node looking for node.next_node = nil, which would delineate the end of the list
  - The append method works by first checking if the head of the linked list contains data or is nil. If there is no data at the head, then there is no need to search for tail and append data. So if @head = nil, it functions in a very simple fashion and turns @head into a new node with the data given in the argument for append. If head != nil then it enacts the find_tail method on the list object and then enacts a method from the node class, which allows us to set the data of the next node to data taken from the given argument
  - The prepend method works by creating a new node with the given data, it then sets the head node to be the next node in the linked list. The code does this by invoking the set_next_node function on the newly instantiated node. The set_next_node method then takes the current (soon to be former) @head node and sets it to be the next node in the linked list. The method then sets the newly instantiated node to be contained in the now empty head variable and this newly instantiated node contains the data passed in via the invoked prepend method
  - Sub note to the above: I found a snippet of code online that used an if / else conditional
    ```
      if @head
      new_node.set_next_node(@head)
      end
    ```
  I include this sub note for documentation purposes to my future self, in case the code I'm using breaks upon further testing and a conditional does in fact need to be used.
  - With the insert method, it may become necessary to distinguish between previously instantiated nodes and newly instantiated nodes as this is the first method I've created in which that distinguishment matters. To keep it consistent I should go back through my old code and ensure that newly instantiated nodes are delineated as such.
  - Having taken the above advice it is now much more clear how each method is functioning; pay attention to these time savers in the future.
  - The index method is operating in the following way:
    - The first three lines tell the loop where to begin and sets up a counter so that the proper index position will be delineated.
    - The while loop says that as long as the current node isn't nil and the index counter is less than the number contained in the variable index when passed in by the user as an argument, the loop traverses the list and counts up until the index position is that given by the user.
    - The first return / if statement accounts for user error / faulty input
    - In the while loop, the current node gets put into the variable previous node, then the node ahead of it gets placed into the current nodes position until the index counter equals the index given. It is possible to take out the current node && and leave just index_counter < index, which I have done
    - Once the index counter equals the index passed in as an argument a new node is created. The current node at the given index position becomes set as the node after the new node by using the set next node method and passing the current node in as an argument. The new node is then set as the next node of the previous node thus completing it's full tie in to the linked list
    - The following if statements account for putting the inserted node at the head even if a node exists there already or if no head exists at all.
  - The is empty method exists so it can be used as a potential shortcut for future methods or for edge cases. As of now it has very limited functionality in my code.
  - The pop method functions by first checking to see if there is one node in the list. If so, it takes the data from the node and stores it in the variable called data, the first node is then set to nil and the return value is set to the value of the data taken from the node. The ensuing code below sets our place in the list and gets us prepared to traverse to the end. The while loop then moves through the list to find the last node. After the while loop takes us to the last node, the node before the last is then set to point to nil, effectively making it the new end of the list. The data from the removed node is then set as the return value.
  

### Beat Box Class:

  - Below is an alternative way of writing the play method, using the system() instead of backticks
    ```
    def play
    beats = list.to_string
    system("say -r 500 -v Boing '#{beats}'")
    end
    ```

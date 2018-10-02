class Node <Element: Equatable> {
    var value: Element?
    var nextNode: Node?
}

class LinkedList<Element: Equatable> {
    var head = Node<Element>()
    var last: Node<Element>
    
    //initialize linked list
    init() {
        last = head
    }
    
    //insert element in the linked list
    func insert(value: Element) {
        if head.value == nil {
            head.value = value
        } else {
            let newNode = Node<Element>()
            newNode.value = value
            last.nextNode = newNode
            last = newNode
        }
    }
    
    //delete element from the linked list
    func delete(value: Element, all: Bool = false) {
        var previousNode: Node<Element>?
        var currentNode: Node<Element>? = head
        while let currentNodeValue = currentNode?.value {
            if (currentNodeValue == value) {
                if (previousNode == nil) {
                    head = currentNode?.nextNode ?? Node<Element>()
                } else {
                    previousNode?.nextNode = currentNode?.nextNode
                }
                //if not all then continue
                if (!all) {
                    break;
                }
            } else {
                previousNode = currentNode
            }
            currentNode = currentNode?.nextNode
        }
    }
    
    //delete node at specific index
    func delete(atIndex index: Int) {
        var currentIndex = 0;
        var previousNode: Node<Element>?
        var currentNode: Node<Element>? = head
        if (index == currentIndex) {
            head = currentNode?.nextNode ?? Node<Element>()
            return
        }
        while currentIndex <= index {
            if (currentIndex == index) {
                previousNode?.nextNode = currentNode?.nextNode
            } else {
                previousNode = currentNode
            }
            currentNode = currentNode?.nextNode
            currentIndex += 1
        }
    }
 
    //print current linked list
    func print(withIndex printIndex: Bool = true) {
        var index = 0
        var currentNode: Node<Element>? = head
        while let nodeValue = currentNode?.value {
            if printIndex {
                Swift.print("\(index) - \(nodeValue)")
            } else {
                Swift.print("\(nodeValue)")
            }
            currentNode = currentNode?.nextNode
            index += 1
        }
    }
}

var ll = LinkedList<Int>()
ll.insert(value: 1)
ll.insert(value: 1)
ll.insert(value: 2)
ll.insert(value: 2)
ll.insert(value: 3)
ll.insert(value: 3)
ll.insert(value: 3)
ll.insert(value: 4)
ll.insert(value: 5)
ll.insert(value: 5)

print("Before Deleting...")
ll.print()

ll.delete(atIndex: 7)
print("After Deleting at Index 7...")
ll.print()

ll.delete(value: 1)
ll.delete(value: 2, all: true)
print("After Deleting...")
ll.print()

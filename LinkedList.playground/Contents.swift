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
    
    //print current linked list
    func print() {
        var currentNode: Node<Element>? = head
        while let nodeValue = currentNode?.value {
            Swift.print(nodeValue)
            currentNode = currentNode?.nextNode
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

ll.delete(value: 1, all: false)

ll.print()

//: Playground - noun: a place where people can play

import UIKit

public class Node{
    var value: Int
    var next: Node?
    weak var previous: Node?
    init(value: Int){
        self.value = value
    }
}

public class LinkedList {
    private var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    public func append(value: Int) {
        // 1
        let newNode = Node(value: value)
        // 2
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
            // 3
        else {
            head = newNode
        }
        // 4
        tail = newNode
    }
    
    public func remove(node: Node) -> Int {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next // 1
        } else {
            head = next // 2
        }
        next?.previous = prev // 3
        
        if next == nil {
            tail = prev // 4
        }
        
        // 5
        node.previous = nil 
        node.next = nil
        
        // 6
        return node.value
    }
    
}

// 1
extension LinkedList: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        var node = head
        // 4
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        // 5
        return text + "]"
    }
}

let numbers = LinkedList()
numbers.append(2)
numbers.append(20)
numbers.append(40)
numbers.append(50)
numbers.remove(Node(value: 2))
numbers.append(2)





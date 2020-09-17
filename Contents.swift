import UIKit

class Node {
    var value: Int
    var next: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

class BinaryTree {
    var val: Int
    var left: BinaryTree?
    var right: BinaryTree?
    
    init(_ val: Int,_ left: BinaryTree? = nil,_ right: BinaryTree? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

var tree = BinaryTree(1)
tree.left = BinaryTree(2)
tree.right = BinaryTree(3)
tree.left?.left = BinaryTree(4)
//tree.right.ri

var binary = BinaryTree(
    1,
    .init(
        2,
        .init(3),
        .init(4)
    ),
    .init(
        5,
        .init(6),
        .init(7)
    )
)


func traverse(_ binaryTree: BinaryTree) -> [Int] {
    var result = [Int]()
    result.append(binaryTree.val)
    
    if let leftChild = binaryTree.left {
        let ints = traverse(leftChild)
        result.append(contentsOf: ints)
    }
    if let rightChild = binaryTree.right {
        let ints = traverse(rightChild)
        result.append(contentsOf: ints)
    }
    
    return result
}

print(traverse(binary))

//indirect enum LinkedList {
//    case empty
//    case concat(head: Int, tail: LinkedList)
//}
//indirect enum Tree {
//    case empty
//    case node(left: Tree, value: Int, right: Tree)
//}
//Tree.node(
//    left: .node(
//        left: .empty,
//        value: 1,
//        right: .empty
//    ),
//    value: 2,
//    right: .node(
//        left: .empty,
//        value: 3,
//        right: .empty
//    )
//)

//=======================================

class Graph {
    var vertices: [Int]
    var adjacencies: [Int: [Int]]
    
    init(_ vertices: [Int], _ adjacencies: [Int: [Int]]) {
        self.vertices = vertices
        self.adjacencies = adjacencies
    }
}
//graphs can be directed/undirected
//if undirected, both vertexes are "connected"

       //data     //indices: adjacent vertices
var graph = Graph([0,1,2,3], [0: [1], 1: [0,2,3], 2: [1,3], 3: [1,2]])

/*
 [
 [0 1 0 0 1]
 [0 1 0 0 1]
 [0 1 1 0 0]
 ]
 */

//func paths(_ graph: Graph, start: Int, end: Int, visited: Set<Int> = Set()) -> [[Int]] {
//    var result = [[Int]]()
//    //all paths from 0 to 3
////    var index =
//    var visited = visited
//    guard !visited.contains(start) else { return result }
//    visited.insert(start)
//    if let startNeighbors = graph.adjacencies[start] {
//        //[1]
//
//        for neighbor in startNeighbors {
//            result.append([neighbor])
//
////            result.append(contentsOf:
////            paths(graph, start: neighbor, end: end, visited: visited)
////                .map { path in
////                    [start] + path
////            }
////            )
//
//            guard neighbor != end else { return result }
////            for index in result {
////                result.append()
////            }
//            result.append(contentsOf: paths(graph, start: neighbor, end: end, visited: visited))
////            if let neighborNeighbors = graph.adjacencies[neighbor] {
////
////            }
//        }
//    }
//
//
//    return result
//}
//
//print(paths(graph, start: 0, end: 3))


func pathS(_ graph: Graph, start: Int, end: Int, visited: Set<Int> = Set()) -> [[Int]] {
  var result = [[Int]]()
  var visited = visited
  guard !visited.contains(start) else { return result }
  guard start != end else { return [[start]] }
  visited.insert(start)
  if let startNeighbors = graph.adjacencies[start] {
    for neighbor in startNeighbors {
      result.append(
        contentsOf:
          pathS(graph, start: neighbor, end: end, visited: visited)
          .map { path in
            [start] + path
          }
      )

      guard neighbor != end else { return result }
    }
  }

  return result
}



print(pathS(graph, start: 0, end: 3))

class Node {
  int data;
  Node? left, right;
  Node({required this.data});
}

class BinaryTree {
  Node? root;
  void addNode(int data) {
    Node? newNode = Node(data: data);
    Node? currNode = root;
    if (currNode == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < currNode!.data) {
        if (currNode.left == null) {
          currNode.left = newNode;
          break;
        }
        currNode = currNode.left;
      } else {
        if (currNode.right == null) {
          currNode.right = newNode;
          break;
        }
        currNode = currNode.right;
      }
    }
  }

  void inOrder() {
    inOrderHelper(root);
  }

  inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }
}

void main() {
  // BinaryTree b = BinaryTree();
  // b.addNode(10);
  // b.addNode(20);
  // b.addNode(25);
  // b.addNode(30);
  // b.inOrder();
  Node n1 = Node(data: 10);
  Node n2 = Node(data: 5);
  Node n3 = Node(data: 15);
  Node n4 = Node(data: 23);
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  inOrderHelper(n1);
}

inOrderHelper(Node? node) {
  List<int> list = [];
  if (node != null) {
    inOrderHelper(node.left);
    print(node.data);
    list.add(node.data);
    inOrderHelper(node.right);
  }
  print(list);
}

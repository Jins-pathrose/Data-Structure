class Node {
  int data;
  Node? left, right;
  Node({required this.data});
}

// class BinaryTree {
//   Node? root;
// }

void main() {
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

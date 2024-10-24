class Node{
  int data;
  Node? left,right;
  Node({required this.data});
}

class bst{

  Node? root;

  void insert(int data){
    Node newNode = Node(data: data);
    Node? currNode = root;
    if(root == null){
      root = newNode;
      return;
    }
    while(true){
      if(data<currNode!.data){
        if(currNode.left==null){
          currNode.left = newNode;
          break;
        }
        currNode = currNode.left;
      }
      else{
        if(currNode.right == null){
          currNode.right = newNode;
          break;
        }
        currNode = currNode.right;
      } 
    }
  }

  bool contains(int target){
    Node? currNode = root;
    while(currNode!=null){
      if(target<currNode.data){
        currNode = currNode.left;
      }
      else if (target > currNode.data){
        currNode = currNode.right;
      }
      else{
        return true;
      }
    }
    return false;
  }

  int closest(int target){
    Node? currNode = root;
    int closest = currNode!.data;
    while(currNode!=null){
      if((target-closest).abs() > (target-currNode.data).abs()){
        closest = currNode.data;
      }
      if(target<currNode.data){
        currNode = currNode.left;
      }
      else if (target > currNode.data){
        currNode = currNode.right;
      }
      else{
        break;
      }
    }
    return closest;
  }

  void delete(int data){
    deleteHelper(data, root, null);
  }
  deleteHelper(int? data,Node? currNode,Node? parent){
    while(currNode!=null){
      if(data!<currNode.data){
        parent=currNode;
        currNode = currNode.left;
      }
      else if(data > currNode.data){
        parent = currNode;
        currNode =currNode.right;
      }
      else{
        if(currNode.left!=null && currNode.right!=null){
          currNode.data = getMin(currNode.right)!;
          deleteHelper(data, currNode.right, currNode);
        }
        else{
          Node? child = (currNode.left!=null)?currNode.left:currNode.right;
          if(parent == null){
            root = child;
          }
          else{
            if(parent.left == currNode){
                parent.left = child;
            }
            else{
              parent.right = child;
            }
          }
        }
        break;
      }
    }
  }

  int? getMin(Node? currNode){
    if(currNode?.left==null){
      return currNode?.data;
    }
    else{
      return getMin(currNode!.left);
    }
  }

  void inOrder(){
    inOrderHelper(root!);
  }
  inOrderHelper(Node? node){
    if(node != null){
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }
}

void main(){
  bst b = bst();

  b.insert(10);
  b.insert(45);
  b.insert(5);

  // b.delete(45);

  // print(b.contains(45));

  // print(b.closest(9));

  b.inOrder();


}
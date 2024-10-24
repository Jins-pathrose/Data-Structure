sum(int n){
  if(n==1){
    return 1;
  }
  if(n%2!=0){
    return n+sum(n-1);
  }
  else{
    return sum(n-1);
  }
}

void main(){
  print(sum(5));
}
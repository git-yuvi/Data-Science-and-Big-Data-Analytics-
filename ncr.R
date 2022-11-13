fact<-function(n){
  X<-1
  if(n==0){
    print(1)
  }else {
    for(i in 1:n){
      X<-X*i
    }
  }
  print(X)
}
fact(0)
fact(10)
bc<-function(n,k){
  y<-fact(n)/fact(n-k)*fact(k)
  print(y)
}
bc(5,2)

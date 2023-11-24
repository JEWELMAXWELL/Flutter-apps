abstract class student{
void sum();
}
class a extends student{

void sum(){
  print("name");

}

}
class b extends student{
  void sum(){
  print("adsafsahgdghvd");

}
}
void main(){
  a object1=a();
  b object2=b();
  object1.sum();
  object2.sum();

}











// class student{
//   String? name;
//   int? age;
//   student(this.name,  this.age);
//   void fun(){
//     print("name:$name");
//     print("age:$age");

//   }
// }
// void main(){

// // student("jewel", 25);
// student names=student("kiran",13);
// names.fun();


// }
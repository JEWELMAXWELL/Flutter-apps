class Student{
  String name="jewel";
  int age=25;
  int mark=50;
  String get std_name{
    return name;

  }

void set std_name(String name){
  this.name=name;
}
void set std_age(int age)
{
  if (age<=4){
    print("student age should be greater than 4 years");
  }
  else{
    this.age=age;

  }
  }
int get std_age{
  return age;

}
void set std_mark(int Marks){
  if (Marks<=20){
    print("failed");
  }
  else{
  this.mark=Marks;

  }
  }
  int get std_mark{
    return mark;
  }
}
void main(){
  Student std=Student();
  std.std_name='jewel';
  std.std_age=25;
  std.std_mark=50;
  print("student name is:${std.std_name}");
  print("student age is:${std.std_age}");
  print("student mark is:${std.std_mark}");

}





  

class Point{
  num x,y;
  static num factor = 0;
  Point(this.x,this.y);
  void printInfo() => print('($x,$y)');
  static void printStaticInfo() => print('$factor');
}

class Point2{
  num x, y, z;
  Point2(this.x, this.y) : z = 0; // 初始化变量 z
  Point2.redirect(num x) : this(x, 0); // 重定向构造函数
  void printInfo() => print('($x,$y,$z)');
}

class Point3{
  //num x = 0,y = 0;
  num x,y;
  Point3(){
    print('父类构造无参函数');
  }

  // Point3(){
  //   print('1');
  // }
  // Point3([num x = 4]){
  //   print('($x,$y)');
  // }

  // Point3([num x = 2,num y = 2]){
  //   print('($x,$y)');
  // }
  static num factor = 0;
  void printInfo() => print('($x,$y)');
  static void printStaticInfo() => print('$factor');
}

class Vector extends Point3{
  Vector(){
    print('子类构造无参函数');
  }
  num z = 0;
  @override
  void printInfo() => print('($x,$y,$z)');
}

class Point4{
  num x,y;
  Point4() : this.make(0,0);
  Point4.left(x) : this.make(x,0);
  Point4.right(y) : this.make(0,y);
  Point4.make(this.x,this.y);
  void printInfo() => print('($x,$y)');
}

class Vector2 extends Point4{
  num z = 0;
  //5 个构造函数
  //Vector2(); //(0,0,0)
  Vector2.left;
  // Vector2.middle
  // Vector2.right
  // Vector2.make

  @override
  void printInfo() => print('($x,$y,$z)');
}


main(List<String> args) {
  // var p = new Point(1,2);
  // p.printInfo();

  // Point.printStaticInfo();
  // Point.factor = 3;
  // Point.printStaticInfo();

  // var p = new Point2(1,2);
  // var p2 = Point2.redirect(100);
  // p.printInfo();
  // p2.printInfo();
  // var v = Vector();
  // v
  //   ..x = 1
  //   ..y = 2
  //   ..z = 3;
  // v.printInfo();

  //   var v = Vector();
  // v
  //   ..z = 3;
  // v.printInfo();
  var v = Vector2.left(5);
  v.printInfo();
}

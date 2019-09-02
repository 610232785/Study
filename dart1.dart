main() {
  var number = 2019; 
  //printInteger(number); 
  //testList();
  //testMap();
  //testConfinement();
  testConstant(number);

}

printInteger(int a) {
  print('Hello world, this is $a.'); 
}

testList(){
  var arr1 = ["tom","andy","jack"];
  var arr2 = List<int>.of([1,2,3]);
  arr2.add(4);
  arr2.forEach((v)=>print('${v}'));

  //添加类型约束
  var arr3 = <String>["tom","andy","jack"];
  //arr3.add(1); 
  //Error: The argument type 'int' can't be assigned to the parameter type 'String'.
  arr3.forEach((v)=>print('${v}'));
}

testMap(){
  var map1 = {"name": "Tom", 'sex': 'male'};
  var map2 = new Map();
  map2['name'] = 'tom';
  map2['sex'] = 'male';

  //添加类型约束

  map2.forEach((k,v)=>print('${k}:${v}'));
}

//约束
testConfinement(){
  var arr1 = <String>['Tom', 'Andy', 'Jack'];
  var arr2 = new List<int>.of([1,2,3]);
  arr2.add(499);
  arr2.forEach((v) => print('${v}'));
  print(arr2 is List<int>); // true

  var map1 = <String, String>{'name': 'Tom','sex': 'male',};
  var map2 = new Map<String, String>();
  map2['name'] = 'Tom';
  map2['sex'] = 'male';
  map2.forEach((k,v) => print('${k}: ${v}')); 
  print(map2 is Map<String, String>); // true
}

/*
const，表示变量在编译期间即能确定的值； 
final 则不太一样，用它定义的变量可以在运行时确定值，而一旦确定后就不可再变
*/
testConstant(int num3){
   const num = 3;
  //num = 2;
  //Error: Setter not found: 'num'
  print('$num');

  final num2 = num3;
  print('$num');
  //num2 = 3;
  //Error: Setter not found: 'num2'
  print('$num');
}

bool isZero(int number) { // 判断整数是否为 0
  return number == 0; 
}

//变量可以是函数
void printInfo(int number,Function check) { // 用 check 函数来判断整数是否为 0
  print("$number is Zero: ${check(number)}");
}

main(List<String> args) {
  // Function f = isZero;
  // int x = 10;
  // int y = 0;
  // printInfo(x,f);
  // printInfo(y,f);

  // 函数调用（不需要以keyvalue形式传入参数，默认按照顺序传入）
  // enableFlags(true,false); //true, false

  // 可选命名参数函数调用（需要以keyvalue形式传入参数）
  // enable1Flags();//null,null
  // enable1Flags(bold: true, hidden: false); //true, false
  // enable1Flags(bold: true); //true, null
  // enable2Flags();//true,false
  // enable2Flags(bold: false); //false, false

  // 可忽略参数函数调用（不需要以keyvalue形式传入参数，默认按照顺序传入）
  // enable3Flags(true, false); //true, false
  // enable3Flags(true,); //true, null
  // enable4Flags(true); //true, false
  // enable4Flags(true,true); // true, true
  
  // 可忽略参数函数可单一参数，若多参数时，只能尾项是可忽略参数
  // enable5Flags(true); // true
  // enable6Flags(bold=true,true);
  // enable7Flags(true,true);
  enable8Flags(true,true);

}

void enableFlags(bool bold,bool hidden) => print('$bold,$hidden');
// 要达到可选命名参数的用法，那就在定义函数的时候给参数加上 {}
void enable1Flags({bool bold,bool hidden}) => print('$bold,$hidden');
// 定义可选命名参数时增加默认值
void enable2Flags({bool bold = true,bool hidden = false}) => print('$bold,$hidden');
// 可忽略的参数在函数定义时用 [] 符号指定
void enable3Flags(bool bold,[bool hidden]) => print('$bold,$hidden');
// 定义可忽略参数时增加默认值
void enable4Flags(bool bold,[bool hidden = false]) => print('$bold,$hidden');

// 定义可忽略参数时增加默认值
void enable5Flags([bool bold]) => print('$bold');
void enable6Flags([bool bold],bool hidden) => print('$bold,$hidden');
// void enable7Flags([bool bold = true],bool hidden) => print('$bold,$hidden');
void enable8Flags(bool that,[bool bold],bool hidden) => print('$that,$bold,$hidden');





//
//  main.cpp
//  多继承测试
//
//  Created by zy on 2021/7/16.
//

#include <iostream>


class A {
    
    
public:
    A(){};
    ~A(){};
//    void test()
//    {
//        printf("abcA");
//    }
};

class B {
    
    

public:
    B(){};
    ~B(){};
    void test()
    {
        printf("abcB");
    }
};

class C:public A , public B {
    
    
public:
    C(){}
    ~C(){}
    
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    C c;
    c.test();
    return 0;
}

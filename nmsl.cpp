#include <iostream>

using namespace std;

int abc;

int foo() { return 1; }

int bar() { return foo(); }

template <typename T> class nmsl {};

int main() {
    abc = 1;
    cout << "nmsl\n";
    cout << foo();
    cout << "nmsl";
    while (1) {
        break;
    }
    if (1) {
        cout << "nmsl\n";
    } else {
        cout << "hehe\n";
    }
    return 0;
}

int fs() {
    cout << "nmsl";
    cout << "hehe";
    return 1;
}

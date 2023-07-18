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
switch (1) {
  hehe:
  return 0;
}

int fs() {
  cout << "nmsl";
  cout << "hehe";
  cout << "hb\n";
  return 1;
}

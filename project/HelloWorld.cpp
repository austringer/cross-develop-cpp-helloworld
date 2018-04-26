#include <functional>
#include <iostream>

int main()
{
  auto f = [] () { ::std::cout << "hello world" << ::std::endl; };
  ::std::invoke(::std::move(f));
  return 0;
}

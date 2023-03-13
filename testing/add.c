#include <stdio.h>
#include <stdlib.h>

int add_me(int a, int b)
{
  return a + b;
}

int main(int argc, const char *argv[])
{
  int a;
  int b;
  int res;

  if (argc < 3)
  {
    dprintf(2, "Usage: %s <a> <b>\n", argv[0]);
    return (1);
  }

  a = atoi(argv[1]);
  b = atoi(argv[2]);
  res = add_me(a, b);

  printf("%d + %d = %d\n", a, b, res);

  return (0);
}
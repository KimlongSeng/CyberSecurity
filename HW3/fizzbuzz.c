#include <stdio.h>
int main()
{
    int x[3];
    if (scanf("%d %d %d", &x[0],&x[1],&x[2]) == 1);
   
      for(int i = 1; i <= x[2]; i++) {
          if(i % x[0] == 0 && i % x[1] == 0)
          {
              printf("FizzBuzz\n");
          } 
          else if( i % x[0] == 0 )
          {
              printf("Fizz\n");
          } 
           else if( i % x[1] == 0 )
          {
              printf("Buzz\n");
          }
          else 
          {
              printf("%d\n",i);
          }
      }
    return 0;
}
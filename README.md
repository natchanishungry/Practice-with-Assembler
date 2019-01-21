# Practice-with-Assembler
I convert a C program to MIPS Assembly Language

This is the C program in question: <br />
int array[10]; // uninitialized array<br />
main() {<br />
 int i, sum=0;<br />
 for(i=0; i<10; i++) {<br />
 printf("enter a number: ");<br />
 scanf("%d",&array[i]);<br />
 }<br />
 sum=summation(array, array+10);<br />
 printf("the sum is %d”,sum);<br />
}<br />
int summation(int *a, *last) {<br />
 int result=0;<br />
 if (a != last) result=summation(a+1, last)+*a;<br />
 return result;<br />
}<br />

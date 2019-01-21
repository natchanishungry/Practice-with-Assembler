# Practice-with-Assembler
I convert a C program to MIPS Assembly Language

This is the C program in question: <br />
int array[10]; // uninitialized array<br />
main() {<br />
 int i, sum=0;<br />
 for(i=0; i<10; i++) {
 printf("enter a number: ");
 scanf("%d",&array[i]);
 }
 sum=summation(array, array+10);
 printf("the sum is %d”,sum);
}
int summation(int *a, *last) {
 int result=0;
 if (a != last) result=summation(a+1, last)+*a;
 return result;
}

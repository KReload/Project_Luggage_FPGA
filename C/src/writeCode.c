#include "../include/bench.h"
#include <string.h>

char *decimal_to_binary(int n)
{
   int c, d, count;
   char *pointer;
   
   count = 0;
   pointer = (char*)malloc(32+1);
   
   if (pointer == NULL)
      exit(EXIT_FAILURE);
     
   for (c = 7 ; c >= 0 ; c--)
   {
      d = n >> c;
     
      if (d & 1)
         *(pointer+count) = 1 + '0';
      else
         *(pointer+count) = 0 + '0';
     
      count++;
   }
   *(pointer+count) = '\0';
   
   return  pointer;
}

int main(void)
{
  long nrl, nrh, ncl, nch;
  uint8** I0 = LoadPGM_ui8matrix("../hall/hall000031.pgm",&nrl,&nrh,&ncl,&nch);
  uint8** I1 = LoadPGM_ui8matrix("../hall/hall000032.pgm",&nrl,&nrh,&ncl,&nch);
  FILE *f = fopen("images.COE","w");
  fprintf(f,"memory_initialization_radix=2;\nmemory_initialization_vector=\n");

  for(int i = 0; i < nrh; i++)
    {
      for(int j = 0; j < nch; j++)
	{
	  fprintf(f,"%s,\n",decimal_to_binary(I0[i][j]));
	}
    }




    for(int i = 0; i < nrh; i++)
    {
      for(int j = 0; j < nch; j++)
	{
	  fprintf(f,"%s,\n",decimal_to_binary(I1[i][j]));
	}
    }

  return 0;
  
}

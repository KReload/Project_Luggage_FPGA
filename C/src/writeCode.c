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
  FILE *f = fopen("mem.vhd","w");
  fprintf(f,"library IEEE;use IEEE.std_logic_1164.all;use ieee.numeric_std.all;entity mem is  generic(    N : integer range 2 to 300    );  port(    addr0, addr1 : in unsigned(17 downto 0);    q0,q1 : out std_logic_vector(7 downto 0)  );end entity; architecture mem_arch of mem is type img is array(N*84480 downto 0) of std_logic_vector(7 downto 0); function init_img return img is variable result : img; begin\n");

  for(int i = 0; i < nrh; i++)
    {
      for(int j = 0; j < nch; j++)
	{
	  fprintf(f,"result(%lu) := %s;\n",i*nch+j,decimal_to_binary(I0[i][j]));
	}
    }

  printf("%d*%d = %d", nrh, nch, nrh*nch);



    for(int i = 0; i < nrh; i++)
    {
      for(int j = 0; j < nch; j++)
	{
	  fprintf(f,"result(%lu) := %s;\n",83889+i*nch+j,decimal_to_binary(I1[i][j]));
	}
    }

    printf("%d*%d = %d", nrh, nch, nrh*nch);

    fprintf(f,"return result;end init_img;signal image: img:=init_img;begin  q0 <= image(To_integer(addr0));  q1 <= image(To_integer(addr1));end architecture;");
  return 0;
  
}

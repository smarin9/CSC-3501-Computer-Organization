void int2bitstr(int I, char *str) {
        /* implment here */
        unsigned int i=I;
        int j;
        /* Starts from the least significant bit */
        for (j = 31;j >= 0;j--)
        {
        /* Uses & to leave behind the least significant bit */
            unsigned int fill = i & 1;
        /* If the bit assigned is 1, fill a 1 inside the index
           If the bit assigned is 0, fill a 0 inside the index */
        if (fill == 1)
            str[j]='1';
        else
            str[j]='0';
        /* Gets rid of the least significant bit using right shift */
        i = i >> 1;
        }
        /* Creates an empty spot for the last char */
        str[32]='\0';
      
}

int get_exp_value(float f) {
        unsigned f2u(float f);
        unsigned int ui = f2u(f);
        /* Uses left and right shift to leave behind only the exponent
        bits */
        ui = ui << 1;
        ui = ui >> 24;
        /* Substracts the bias */
        ui = ui - 127;
        return(ui);
}






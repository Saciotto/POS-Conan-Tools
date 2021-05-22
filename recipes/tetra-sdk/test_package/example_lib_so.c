#include "sdk_tplus.h"

#ifndef SDK_VERSION
#error SDK_VERSION is not defined
#endif

int foo()
{
    return 1;
}

static const fct_desc_t tab_fct[] = {
    {"foo", (void *)foo}
};

#define NB_FCT sizeof(tab_fct) / sizeof(fct_desc_t)

void *GetProcAddress(char *name)
{
    unsigned int i;
    for (i = 0; i < NB_FCT; i++)
    {
        if (strcmp(name, tab_fct[i].fct_name) == 0)
            return tab_fct[i].fct;
    }
    return (void *)0;
}

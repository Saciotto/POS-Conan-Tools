#include <stddef.h>
#include "OSL_Dll.h"

#ifndef SDK_VERSION
#error SDK_VERSION is not defined
#endif

#define DLLNAME "dllname"

static T_OSL_HDLL hDll = NULL;

void __attribute__((constructor)) DIC_Constructor()
{
    if (!OSL_Dll_IsPresent(DLLNAME))
        return;
    hDll = OSL_Dll_Open(DLLNAME);
}

void __attribute__((destructor)) DIC_Destructor()
{
    if (hDll != NULL)
        OSL_Dll_Close(hDll);
    hDll = NULL;
}

int foo()
{
    static int (*_foo)() = NULL;

    if (hDll == NULL)
        return -1;
    if (_foo == NULL)
    {
        _foo = OSL_Dll_GetSymbolByName(hDll, "foo");
        if (_foo == NULL)
            return -1;
    }
    return _foo();
}

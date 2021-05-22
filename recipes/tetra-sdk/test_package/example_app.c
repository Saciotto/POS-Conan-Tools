#include "sdk_tplus.h"

#include "example.h"

#ifndef SDK_VERSION
#error SDK_VERSION is not defined
#endif

int Main(unsigned int size, StructPt *data)
{
    (void) size;
    (void) data;
    NO_SEGMENT No = ApplicationGetCurrent();
    return foo();
}

void entry()
{
    object_info_t info;
    ObjectGetInfo(OBJECT_TYPE_APPLI, ApplicationGetCurrent(), &info);
}

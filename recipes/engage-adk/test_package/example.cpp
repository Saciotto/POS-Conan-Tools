#include <sysinfo/sysbeep.h>

#ifndef _VOS2
#error VOS2 is not defined
#endif

int main() 
{
    vfisysinfo::sysPlaySound(48, 600, 50);
    return 0;
}

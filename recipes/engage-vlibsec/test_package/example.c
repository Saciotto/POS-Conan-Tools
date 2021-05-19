#include <v-libsec.h>

int main() 
{
    char version[1000];
    _VLIBSEC_get_version(version);
    return 0;
}

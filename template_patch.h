#ifndef TEMPLATE_PATCH_H
#define TEMPLATE_PATCH_H

// Define unknown macros as empty
#define LIBOPENMPT_MODPLUG_API

// Forward declarations for types
struct ModPlugFile
{
    void* mod; // Pointer to the actual module data
};
typedef struct ModPlugFile ModPlugFile;

// Stub out external functions used inside
const char* openmpt_module_get_instrument_name(void* mod, unsigned int index);
void openmpt_free_string(const char* str);

// Include standard headers
#include <limits.h>
#include <string.h>
// Auto-generated function declarations for undefined functions
int ecryptfs_init_messaging(void);
void ecryptfs_release_messaging(void);

#endif


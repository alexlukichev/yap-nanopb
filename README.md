# Usage

```
# The versions of nanpb and yap-nanopb must match in yap_retrieve
yap_retrieve(git+https://github.com/nanopb/nanopb VERSION 0.3.8 GIT_TAG nanopb-0.3.8)
yap_retrieve(git+https://github.com/alexlukichev/yap-nanopb VERSION 0.3.8 GIT_TAG stable) 

# Require yap-nanopb
yap_require(git+https://github.com/alexlukichev/yap-nanopb VERSION 0.3 NAME NANOPB)

# Make sure you specify the size of the field pointers
add_definitions(-DPB_FIELD_32BIT)

# Include nanopb directories
include_directories(${NANOPB_INCLUDE_DIRECTORIES})

# Generate stubs
set(NANOPB_IMPORT_DIRS "${MY_PROTO}")
NANOPB_GENERATE_CPP(PROTO_SRCS PROTO_HDRS "${MY_PROTO}/my.proto")

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(target ${SOURCES} ${PROTO_SRCS} ${PROTO_HDRS})

# Make sure you include the nanopb library
target_link_libraries(target ${NANOPB_LIBRARIES})
```
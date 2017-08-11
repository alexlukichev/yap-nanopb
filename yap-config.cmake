if(NOT YAP_PACKAGE_VERSION)
    message(FATAL_ERROR "Yap package version requirements not specified")
endif()

yap_require(git+https://github.com/nanopb/nanopb VERSION ${YAP_PACKAGE_VERSION} NAME _NANOPB EXCLUDE_FROM_ALL)

set(NANOPB_SRC_ROOT_FOLDER "${_NANOPB_SOURCE}")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${NANOPB_SRC_ROOT_FOLDER}/extra)
find_package(Nanopb REQUIRED)
if(Nanopb_NOT_FOUND)
  message(SEND_ERROR "Error: nanopb not found")
  return()
endif()

set(${YAP_PACKAGE_NAME}_INCLUDE_DIRECTORIES ${NANOPB_INCLUDE_DIRS} PARENT_SCOPE)
set(${YAP_PACKAGE_NAME}_LIBRARIES protobuf-nanopb PARENT_SCOPE)
set(NANOPB_SRC_ROOT_FOLDER ${NANOPB_SRC_ROOT_FOLDER} PARENT_SCOPE)
set(CXXLIB "cnutil")

find_package(Boost COMPONENTS thread system program_options date_time filesystem REQUIRED)

# Flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -D_GNU_SOURCE")

include_directories(${Boost_INCLUDE_DIRS})
include_directories("${MONERO_DIR}/contrib/epee/include")
include_directories("${MONERO_DIR}/src")
include_directories("${MONERO_DIR}/external/easylogging++")

set(MONERO_LIB_DIR "${MONERO_DIR}/build/release-shared")

link_directories(
    ${MONERO_LIB_DIR}/src/cryptonote_core
    ${MONERO_LIB_DIR}/src/cryptonote_basic
    ${MONERO_LIB_DIR}/src/crypto
    ${MONERO_LIB_DIR}/src/common
    ${MONERO_LIB_DIR}/src/ringct
    ${MONERO_LIB_DIR}/src/blockchain_db
    ${MONERO_LIB_DIR}/external/easylogging++
    ${MONERO_LIB_DIR}/contrib/epee/src
)

# Build library
add_library(${CXXLIB} SHARED src/cnutil.cpp)

target_link_libraries(${CXXLIB}
    cryptonote_core
    cryptonote_basic
    cncrypto
    common
    ringct
    blockchain_db
    easylogging
    epee
)

target_link_libraries(${CXXLIB}
    ${Boost_THREAD_LIBRARY}
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_PROGRAM_OPTIONS_LIBRARY}
    ${Boost_DATE_TIME_LIBRARY}
    ${Boost_FILESYSTEM_LIBRARY}
)

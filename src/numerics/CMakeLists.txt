# Numerics

set(exe_name numerics)
add_executable(${exe_name} numerics.cc)
target_link_libraries(${exe_name} ${CONAN_LIBS})
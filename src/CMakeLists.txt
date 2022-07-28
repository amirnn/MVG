# src

add_subdirectory(camera_calibration)
# add_subdirectory(image_reconstruction)

set(exe_name mvg_out)
add_executable(${exe_name} main.cpp)
target_link_libraries(${exe_name} ${CONAN_LIBS})
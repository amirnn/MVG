# src

add_subdirectory(camera_calibration)
# add_subdirectory(image_reconstruction)

set(Executable_Name MVG.out)
add_executable(${Executable_Name} main.cpp)
target_link_libraries(${Executable_Name} ${CONAN_LIBS})
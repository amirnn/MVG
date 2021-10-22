# Camera Calibration

set(Executable_Name camera_calibration.out)
add_executable(${Executable_Name} camera_calibration.cc)
target_link_libraries(${Executable_Name} ${CONAN_LIBS})
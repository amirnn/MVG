# Camera Calibration

set(exe_name camera_calibration)
add_executable(${exe_name} camera_calibration.cc)
target_link_libraries(${exe_name} ${CONAN_LIBS})
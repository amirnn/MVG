set(TEST_BIN first_test)
add_test(
    NAME ${TEST_BIN}
    COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TEST_BIN})
add_executable(${TEST_BIN} first_test.cc)
target_link_libraries(${TEST_BIN} ${CONAN_LIBS})
// Copyright 2021 Amir Nourinia
// #include <gtest/gtest.h>
#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest/doctest.h>

// TEST(Algorithms, first_test){
//     EXPECT_EQ(1 , 1);
// }

int factorial(int number) { return number <= 1 ? number : factorial(number - 1) * number; }

TEST_CASE("first test"){
    CHECK(factorial(1) >= 1);
}
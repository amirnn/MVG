// Copyright 2021 Amir Nourinia
#include <Eigen/Core>
#include <Eigen/Geometry>
#include <iostream>
#include <NumCpp.hpp>
// #include <boost/program_options.hpp>
// #include <opencv4/opencv2/opencv.hpp>

int main(int argc, char const *argv[]) {
  using Eigen::MatrixXd;
  nc::NdArray<int> a = { {1, 2}, {3, 4}, {5, 6} };
  a.print();
  MatrixXd m(2, 2);
  m(0, 0) = 3;
  m(1, 0) = 2.5;
  m(0, 1) = -1;
  m(1, 1) = m(1, 0) + m(0, 1);
  std::cout << m << std::endl;
  std::cout << "Hello, world!\n";
  return 0;
}

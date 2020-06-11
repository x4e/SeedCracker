cmake_minimum_required(VERSION 3.16)
project(SeedCracker CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(SeedCracker main.cu javarnd.h)

set_target_properties(
        SeedCracker
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)

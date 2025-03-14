cmake_minimum_required(VERSION 3.13)
project(tts_message)
set(CMAKE_CXX_STANDARD 20)

set(SOURCE_FILES
	main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

#include <iostream>
#include <fstream>

#include <string>
#include <vector>
#include <algorithm>
#include <iterator>

// g++ main.cpp -o hello && ./hello foo bar
// cl.exe main.cpp /Fehello.exe && hello.exe foo bar

int main(int argc, char* argv[])
{
	std::ios::sync_with_stdio(false);

	std::cout << "hello world" << '\n';

	for (int i = 1; i < argc; i++) {
		std::cout << argv[i] << '\n';
	}

	return 0;
}


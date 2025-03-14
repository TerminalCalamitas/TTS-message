#include <iostream>

const std::string giveMeTheTts() {
	return "Hey Doug, I'm worried that our friendship is only parasocial, can you acknowledge this message so that it isn't anymore?";
}


int main( int /* argc */, char ** /* argv */ ) {
	std::cout << giveMeTheTts() << "\n";
	return 0;
}

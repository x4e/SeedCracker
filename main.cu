#include <iostream>
#include "javarnd.h"

bool isSlimeChunk(int64_t* seed, int32_t* chunkX, int32_t* chunkZ) {
	int64_t chunkSeed = *seed +
        (*chunkX * *chunkX * 0x4c1906) +
        (*chunkX * 0x5ac0db) +
        (*chunkZ * *chunkZ) * 0x4307a7L +
        (*chunkZ * 0x5f24f) ^ 0x3ad8025f;
	setSeed(&chunkSeed);
	return nextInt(&chunkSeed, 10) == 0;
}

int main() {
	int64_t seed = 25;
	#define numChunks 2
	int32_t chunks[] = {
		5, 17,
		2, 2
	};
	for (int i = 0; i < (numChunks * 2); i += 2) {
		int32_t* chunkX = &chunks[i];
		int32_t* chunkZ = &chunks[i + 1];
		bool slime = isSlimeChunk(&seed, chunkX, chunkZ);
		std::cout << *chunkX << "," << *chunkZ;
		if (slime) {
			std::cout << " is a slime chunk";
		} else {
			std::cout << " isn't a slime chunk";
		}
		std::cout << std::endl;
	}
	return 0;
}

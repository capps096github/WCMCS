#include <random>

int computeWaterFlow() {
  // Use modern C++ random number generation with better quality
  std::random_device rd;  // Seed from system randomness
  std::mt19937 gen(rd());  // Random number engine
  std::uniform_int_distribution<int> distr(1, 20); // Generate integers between 1 (inclusive) and 20 (inclusive)

  return distr(gen);
}

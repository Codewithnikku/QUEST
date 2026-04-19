#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

class PlusOne {
public:

    vector<int> plusOne(vector<int>& digits) {
        int n = digits.size();
        for (int i = n - 1; i >= 0; i--) {
            if (digits[i] < 9) {
                digits[i]++;
                return digits;
            }
            digits[i] = 0;
        }
        digits.insert(digits.begin(), 1);
        return digits;

    }
};

int main() {
    PlusOne p;
    vector<int> digits = {1, 2, 3};
    vector<int> result = p.plusOne(digits);
    for (int num : result) {
        cout << num << " ";
    }
    cout << endl;
    return 0;
}
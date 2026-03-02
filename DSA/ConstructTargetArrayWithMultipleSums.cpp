#include <iostream>
#include <vector>
using namespace std;

class ConstructTargetArrayWithMultipleSums{
public:
    bool isPossible(vector<int>& target) {
        long long sum = 0;
        for(int num : target) {
            sum += num;
        }
        while(true) {
            int maxIndex = 0;
            for(int i = 1; i < (int)target.size(); ++i) {
                if(target[i] > target[maxIndex]) {
                    maxIndex = i;
                }
            }
            int maxValue = target[maxIndex];
            long long restSum = sum - maxValue;
            if(maxValue == 1 || restSum == 1) return true;
            if(maxValue < restSum || restSum == 0 || maxValue % restSum == 0) return false;
            target[maxIndex] = maxValue % restSum;
            sum = restSum + target[maxIndex];
        }
        return false;
    }
};

int main(){
    ConstructTargetArrayWithMultipleSums ctams;
    vector<int> target = {9,3,5};
    cout << "Result: " << ctams.isPossible(target) << endl;
    return 0;
}
#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    int findMaxConsecutiveOnes(vector<int>& nums) {
        int maxCount = 0;
        int count = 0;
        
        for (int num : nums) {
            if (num == 1) {
                count++;
                maxCount = max(maxCount, count);
            } else {
                count = 0;
            }
        }
        
        return maxCount;
    }
};

int main(){
    Solution sol;
    vector<int> nums = {1, 1, 0, 1, 1, 1};
    int result = sol.findMaxConsecutiveOnes(nums);
    cout << "Maximum consecutive ones: " << result << endl;
    return 0;
}
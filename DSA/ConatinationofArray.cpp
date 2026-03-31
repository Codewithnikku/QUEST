#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> getConcatenation(vector<int>& nums) {
        vector<int> ans;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < nums.size(); j++) {
                ans.push_back(nums[j]);
            }
        }
        return ans;
    }
};

int main() {
    Solution sol;
    vector<int> nums = {1, 2, 3};
    vector<int> result = sol.getConcatenation(nums);
    for (int num : result) {
        cout << num << " ";
    }
    cout << endl;
    return 0;
}
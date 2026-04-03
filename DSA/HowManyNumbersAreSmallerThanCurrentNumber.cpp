#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> smallerNumbersThanCurrent(vector<int>& nums) {
        int n = nums.size();
        vector<int> res(n);
        for(int i = 0; i < n; i++){
            for(int j = 0; j < n; j++){
                if(nums[i] > nums[j]){
                    res[i]++;
                }
            }
        }
        return res;
    }
};

int main(){
    Solution s;
    vector<int> nums = {8,1,2,2,3};
    vector<int> res = s.smallerNumbersThanCurrent(nums);
    for(int i = 0; i < res.size(); i++){
        cout << res[i] << " ";
    }
    return 0;
}
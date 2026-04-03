#include <iostream>
#include <vector>
using namespace std;



class Solution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        int n = nums.size();
        vector<int> res;
        for(int i = 0; i < n; i++){
            int x = abs(nums[i]);
            if(nums[x-1] > 0){
                nums[x-1] = -nums[x-1];
            }
        }
        for(int i = 0; i < n; i++){
            if(nums[i] > 0){
                res.push_back(i+1);
            }
        }
        return res;
    }
};

int main(){
    Solution s;
    vector<int> nums = {4,3,2,7,8,2,3,1};
    vector<int> res = s.findDisappearedNumbers(nums);
    for(int i = 0; i < res.size(); i++){
        cout << res[i] << " ";
    }
    return 0;
}

#include <iostream>
#include <vector>
using namespace std;



class Solution {
public:
    vector<int> findErrorNums(vector<int>& nums) {
        int n = nums.size();
        vector<int> res;
        for(int i = 0; i < n; i++){
            int x = abs(nums[i]);
            if(nums[x-1] > 0){
                nums[x-1] = -nums[x-1];
            }
            else{
                res.push_back(x);
            }
        }
        for(int i = 0; i < n; i++){
            if(nums[i] > 0){
                res.push_back(i+1);
                break;
            }
        }
        return res;
    }
};

int main(){
    Solution s;
    vector<int> nums = {1,2,2,4};
    vector<int> res = s.findErrorNums(nums);
    for(int i = 0; i < res.size(); i++){
        cout << res[i] << " ";
    }
    return 0;
}
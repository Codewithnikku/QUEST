#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    vector<string> buildArray(vector<int>& target, int n) {
        vector<string> ans;
        int j = 0;
        for (int i = 1; i <= n && j < target.size(); ++i) {
            ans.push_back("Push");
            if (i == target[j]) {
                ++j;
            } else {
                ans.push_back("Pop");
            }
        }
        return ans;
    }
};

int main() {
    Solution sol;
    vector<int> target = {1, 3};
    int n = 3;
    vector<string> result = sol.buildArray(target, n);
    for (const string& op : result) {
        cout << op << endl;
    }
    return 0;
}
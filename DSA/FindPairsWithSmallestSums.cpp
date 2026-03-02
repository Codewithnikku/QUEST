#include <iostream>
#include <vector>
#include <queue>
using namespace std;

class FindPairsWithSmallestSums {
public:
    vector<vector<int>> kSmallestPairs(vector<int>& nums1, vector<int>& nums2, int k) {
        vector<vector<int>> result;
        if(nums1.empty() || nums2.empty() || k <= 0) return result;
        auto cmp = [&](const pair<int, int>& a, const pair<int, int>& b) {
            return nums1[a.first] + nums2[a.second] > nums1[b.first] + nums2[b.second];
        };
        priority_queue<pair<int, int>, vector<pair<int, int>>, decltype(cmp)> pq(cmp);
        for(int i = 0; i < min((int)nums1.size(), k); ++i) {
            pq.emplace(i, 0);
        }
        while(k-- > 0 && !pq.empty()) {
            pair<int, int> p = pq.top(); pq.pop();
            int i = p.first, j = p.second;
            result.push_back({nums1[i], nums2[j]});
            if(j + 1 < (int)nums2.size()) {
                pq.emplace(i, j + 1);
            }
        }
        return result;
    }    
};

int main(){
    FindPairsWithSmallestSums fpss;
    vector<int> nums1 = {1,7};
    vector<int> nums2 = {3,4};
    int k = 3;
    vector<vector<int>> pairs = fpss.kSmallestPairs(nums1, nums2, k);
    for(const auto& pair : pairs) {
        cout << "[" << pair[0] << "," << pair[1] << "] ";
    }
    cout << endl;
    return 0;
}
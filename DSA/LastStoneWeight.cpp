#include <iostream>
#include <vector>
#include <queue>
using namespace std;

class LastStoneWeight{
public:
    int lastStoneWeight(vector<int>& stones) {
        priority_queue<int> pq(stones.begin(), stones.end());
        while(pq.size() > 1) {
            int stone1 = pq.top(); pq.pop();
            int stone2 = pq.top(); pq.pop();
            if(stone1 != stone2) {
                pq.push(abs(stone1 - stone2));
            }
        }
        return pq.empty() ? 0 : pq.top();
    }
    
};

int main(){
    LastStoneWeight lsw;
    vector<int> stones = {2,7,4,1,8,1};
    cout << lsw.lastStoneWeight(stones) << endl;
    return 0;
}
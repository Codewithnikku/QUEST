#include <iostream>
#include <vector>
#include <stack>
#include <algorithm>
#include <queue>
using namespace std;


class maximumnumberOfEatenApples {
public:
    int eatenApples(vector<int>& apples, vector<int>& days) {
        int n = apples.size();
        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
        int i = 0, ans = 0;
        while(i < n || !pq.empty()){
            if(i < n && apples[i] > 0){
                pq.push({i + days[i], i});
            }
            while(!pq.empty() && (pq.top().first <= i || apples[pq.top().second] <= 0)){
                pq.pop();
            }
            if(!pq.empty()){
                ans++;
                apples[pq.top().second]--;
            }
            i++;
        }
        return ans;
    }
};

int main(){
    maximumnumberOfEatenApples s;
    vector<int> apples = {1,2,3,5,2};
    vector<int> days = {3,2,1,4,2};
    cout << s.eatenApples(apples, days) << endl;
    return 0;
}


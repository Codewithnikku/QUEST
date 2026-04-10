#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

class TimeNeededToBuyTickets {
public:
    int timeRequiredToBuy(vector<int>& tickets, int k) {
        int time = 0;
        int n = tickets.size();

        for (int i = 0; i < n; ++i) {
            if (i <= k) {
                time += min(tickets[i], tickets[k]);
            } else {
                time += min(tickets[i], tickets[k] - 1);
            }
        }

        return time;
    }
};

int main() {
    TimeNeededToBuyTickets solution;
    vector<int> tickets = {2, 3, 2};
    int k = 2;
    int result = solution.timeRequiredToBuy(tickets, k);
    cout << "Time needed to buy tickets: " << result << endl;
    return 0;
}
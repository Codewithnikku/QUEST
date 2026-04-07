#include <iostream>
#include <vector>
#include <string>
using namespace std;

class ExclusiveTimeOfFunctions {
public:
    vector<int> exclusiveTime(int n, vector<string>& logs) {
        vector<int> result(n, 0);
        vector<int> stack;
        int prevTime = 0;

        for (const string& log : logs) {
            size_t pos1 = log.find(':');
            size_t pos2 = log.find(':', pos1 + 1);

            int id = stoi(log.substr(0, pos1));
            string type = log.substr(pos1 + 1, pos2 - pos1 - 1);
            int time = stoi(log.substr(pos2 + 1));

            if (!stack.empty()) {
                result[stack.back()] += time - prevTime;
            }
            prevTime = time;

            if (type == "start") {
                stack.push_back(id);
            } else {
                result[stack.back()]++;
                stack.pop_back();
                prevTime++;
            }
        }

        return result;
    }
};

int main() {
    ExclusiveTimeOfFunctions sol;
    vector<string> logs = {"0:start:0", "1:start:2", "1:end:5", "0:end:6"};
    vector<int> result = sol.exclusiveTime(2, logs);
    for (int time : result) {
        cout << time << " ";
    }
    cout << endl; 
    return 0;
}
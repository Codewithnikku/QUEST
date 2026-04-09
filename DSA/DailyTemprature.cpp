#include <iostream>
#include <vector>
#include <stack>
using namespace std;

class DailyTemprature
{
public:
    vector<int> dailyTemperatures(vector<int> &temperatures)
    {
        int n = temperatures.size();
        vector<int> result(n, 0);
        stack<int> st;

        for (int i = 0; i < n; i++)
        {
            while (!st.empty() && temperatures[st.top()] < temperatures[i])
            {
                int idx = st.top();
                st.pop();
                result[idx] = i - idx;
            }
            st.push(i);
        }

        return result;
    }
};

int main()
{
    DailyTemprature solution;
    vector<int> temperatures = {73, 74, 75, 71, 69, 72, 76, 73};
    vector<int> result = solution.dailyTemperatures(temperatures);
    for (int days : result)
    {
        cout << days << " ";
    }
    cout << endl;
    return 0;
}
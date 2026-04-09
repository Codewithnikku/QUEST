#include <iostream>
#include <vector>
#include <stack>
#include <algorithm>
using namespace std;

class LargestRectangleInHistogram {
public:
    int largestRectangleArea(vector<int>& heights) {
        int n = heights.size();
        stack<int> st;
        int maxArea = 0;

        for (int i = 0; i < n; i++) {
            while (!st.empty() && heights[st.top()] > heights[i]) {
                int height = heights[st.top()];
                st.pop();
                int width = st.empty() ? i : i - st.top() - 1;
                maxArea = max(maxArea, height * width);
            }
            st.push(i);
        }

        while (!st.empty()) {
            int height = heights[st.top()];
            st.pop();
            int width = st.empty() ? n : n - st.top() - 1;
            maxArea = max(maxArea, height * width);
        }
        return maxArea;
    }
};

int main() {
    LargestRectangleInHistogram solution;
    vector<int> heights = {2, 1, 5, 6, 2, 3};
    int result = solution.largestRectangleArea(heights);
    cout << "Largest Rectangle Area: " << result << endl;
    return 0;
}
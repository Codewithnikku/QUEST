#include <iostream>
#include <vector>
#include <stack>
using namespace std;

class FinalPriceWithASpecialDiscountInAShop {
public:
    vector<int> finalPrices(vector<int>& prices) {
        int n = prices.size();
        vector<int> result = prices;
        stack<int> st; 

        for (int i = 0; i < n; i++) {
            while (!st.empty() && prices[st.top()] >= prices[i]) {
                result[st.top()] -= prices[i];
                st.pop();
            }
            st.push(i);
        }

        return result;
    }
};

int main() {
    FinalPriceWithASpecialDiscountInAShop solution;
    vector<int> prices = {8, 4, 6, 2, 3};
    vector<int> finalPrices = solution.finalPrices(prices);
    for (int price : finalPrices) {
        cout << price << " ";
    }
    cout << endl;
    return 0;
}
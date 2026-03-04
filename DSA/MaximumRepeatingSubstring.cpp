#include <iostream>
#include <vector>
#include <string>
using namespace std;



class MaximumRepeatingSubstring {
public:
    int maxRepeating(string sequence, string word) {
        int n = sequence.size();
        int m = word.size();
        
        vector<int> dp(n, 0);
        int maxRepeat = 0;

        for (int i = m - 1; i < n; i++) {
            if (sequence.substr(i - m + 1, m) == word) {
                dp[i] = 1;
                if (i >= m)
                    dp[i] += dp[i - m];
                
                maxRepeat = max(maxRepeat, dp[i]);
            }
        }
        
        return maxRepeat;
    }
};

int main() {
    MaximumRepeatingSubstring obj;
    string sequence = "ababc";
    string word = "ab";
    cout << obj.maxRepeating(sequence, word) << endl;
    return 0;
}